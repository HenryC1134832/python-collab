# -*- coding: utf-8 -*-
# wujian@2018

import os
import sys
import time

from itertools import permutations
from collections import defaultdict
import torchvision
import torch as th
import torch.nn.functional as F
from torch.optim.lr_scheduler import ReduceLROnPlateau
from torch.nn.utils import clip_grad_norm_

from .utils import get_logger


def load_obj(obj, device):
    """
    Offload tensor object in obj to cuda device
    """

    def cuda(obj):
        return obj.to(device) if isinstance(obj, th.Tensor) else obj

    if isinstance(obj, dict):
        return {key: load_obj(obj[key], device) for key in obj}
    elif isinstance(obj, list):
        return [load_obj(val, device) for val in obj]
    else:
        return cuda(obj)


class SimpleTimer(object):
    """
    A simple timer
    """

    def __init__(self):
        self.reset()

    def reset(self):
        self.start = time.time()

    def elapsed(self):
        return (time.time() - self.start) / 60


class ProgressReporter(object):
    """
    A simple progress reporter
    """

    def __init__(self, logger, period=100):
        self.period = period
        self.logger = logger
        self.loss = []
        self.timer = SimpleTimer()

    def add(self, loss):
        self.loss.append(loss)
        N = len(self.loss)
        if not N % self.period:
            avg = sum(self.loss[-self.period:]) / self.period
            self.logger.info("Processed {:d} batches"
                             "(loss = {:+.2f})...".format(N, avg))

    def report(self, details=False):
        N = len(self.loss)
        if details:
            sstr = ",".join(map(lambda f: "{:.2f}".format(f), self.loss))
            self.logger.info("Loss on {:d} batches: {}".format(N, sstr))
        return {
            "loss": sum(self.loss) / N,
            "batches": N,
            "cost": self.timer.elapsed()
        }


class Trainer(object):
    def __init__(self,
                 nnet,
                 checkpoint="checkpoint",
                 optimizer="adam",
                 gpuid=0,
                 optimizer_kwargs=None,
                 clip_norm=None,
                 min_lr=0,
                 patience=0,
                 factor=0.5,
                 logging_period=100,
                 resume=None,
                 no_impr=6,
                 loss_mode="snr"):
        if not th.cuda.is_available():
            raise RuntimeError("CUDA device unavailable...exist")
        if not isinstance(gpuid, tuple):
            gpuid = (gpuid, )
        self.device = th.device("cuda:{}".format(gpuid[0]))
        self.gpuid = gpuid
        if checkpoint and not os.path.exists(checkpoint):
            os.makedirs(checkpoint)
        self.checkpoint = checkpoint
        self.logger = get_logger(
            os.path.join(checkpoint, "trainer.log"), file=True)
        self.clip_norm = clip_norm
        self.logging_period = logging_period
        self.cur_epoch = 0  # zero based
        self.no_impr = no_impr
        self.loss_mode = loss_mode
        print('no_impr: ', no_impr)

        if resume:
            if not os.path.exists(resume):
                raise FileNotFoundError(
                    "Could not find resume checkpoint: {}".format(resume))
            cpt = th.load(resume, map_location="cpu")
            self.cur_epoch = cpt["epoch"]
            #epoch清0重新開始
            self.cur_epoch = 0
            self.logger.info("Resume from checkpoint {}: epoch {:d}".format(
                resume, self.cur_epoch))

            # 加載模型
            nnet.load_state_dict(cpt["model_state_dict"], strict=False)
            self.nnet = nnet.to(self.device)

            # 檢查是否有 optimizer state
            if 'optim_state_dict' in cpt:
                self.optimizer = self.create_optimizer(
                    optimizer, optimizer_kwargs, state=cpt["optim_state_dict"])
            else:
                self.logger.warning("No optimizer state found in checkpoint. Starting with a new optimizer.")
                self.optimizer = self.create_optimizer(optimizer, optimizer_kwargs)
        else:
            self.nnet = nnet.to(self.device)
            self.optimizer = self.create_optimizer(optimizer, optimizer_kwargs)

        # 凍結所有層的參數
        for param in self.nnet.parameters():
            param.requires_grad = False
        
        # 僅解凍嵌入層的參數
        for param in self.nnet.embedding_layer.parameters():
            param.requires_grad = True

        print('patience: ', patience)
        self.scheduler = ReduceLROnPlateau(
            self.optimizer,
            mode="min",
            factor=factor,
            patience=patience,
            min_lr=min_lr,
            verbose=True)
        self.num_params = sum(
            [param.nelement() for param in nnet.parameters()]) / 10.0**6
        
        self.num_trainable_params = sum(
            p.nelement() for p in nnet.parameters() if p.requires_grad
        ) / 10.0**6

        # logging
        self.logger.info("Model summary:\n{}".format(nnet))
        self.logger.info("Loading model to GPUs:{}, #param: {:.2f}M".format(
            gpuid, self.num_params))
        self.logger.info(
            "Loading model to GPUs:{}, Total #param: {:.2f}M, Trainable #param: {:.2f}M".format(
                gpuid, self.num_params, self.num_trainable_params
            )
        )
        if clip_norm:
            self.logger.info(
                "Gradient clipping by {}, default L2".format(clip_norm))

    def save_checkpoint(self, best=True):
        cpt = {
            "epoch": self.cur_epoch,
            "model_state_dict": self.nnet.state_dict(),
            "optim_state_dict": self.optimizer.state_dict()
        }
        th.save(
            cpt,
            os.path.join(self.checkpoint,
                         "{}.pt.tar".format("best" if best else self.cur_epoch)))

    def create_optimizer(self, optimizer, kwargs, state=None):
        supported_optimizer = {
            "sgd": th.optim.SGD,  # momentum, weight_decay, lr
            "rmsprop": th.optim.RMSprop,  # momentum, weight_decay, lr
            "adam": th.optim.Adam,  # weight_decay, lr
            "adadelta": th.optim.Adadelta,  # weight_decay, lr
            "adagrad": th.optim.Adagrad,  # lr, lr_decay, weight_decay
            "adamax": th.optim.Adamax  # lr, weight_decay
            # ...
        }
        if optimizer not in supported_optimizer:
            raise ValueError("Now only support optimizer {}".format(optimizer))
        opt = supported_optimizer[optimizer](self.nnet.parameters(), **kwargs)
        self.logger.info("Create optimizer {0}: {1}".format(optimizer, kwargs))
        if state is not None:
            opt.load_state_dict(state)
            self.logger.info("Load optimizer state dict from checkpoint")
        return opt

    def compute_loss(self, egs):
        raise NotImplementedError

    def train(self, data_loader):
        self.logger.info("Set train mode...")
        self.nnet.train()

        # 僅量化嵌入層中的線性層
        #self.nnet.embedding_layer = th.quantization.quantize_dynamic(
        #    self.nnet.embedding_layer, {th.nn.Linear}, dtype=th.qint8
        #)
        
        reporter = ProgressReporter(self.logger, period=self.logging_period)

        for egs in data_loader:
            # load to gpu
            egs = load_obj(egs, self.device)

            self.optimizer.zero_grad()
            loss = self.compute_loss(egs)
            loss.backward()
            if self.clip_norm:
                clip_grad_norm_(self.nnet.parameters(), self.clip_norm)
            self.optimizer.step()

            reporter.add(loss.item())
        return reporter.report()

    def eval(self, data_loader):
        self.logger.info("Set eval mode...")
        self.nnet.eval()
        reporter = ProgressReporter(self.logger, period=self.logging_period)

        with th.no_grad():
            for egs in data_loader:
                egs = load_obj(egs, self.device)
                loss = self.compute_loss(egs)
                reporter.add(loss.item())
        return reporter.report(details=True)

    def run(self, train_loader, dev_loader, num_epochs=50):
        # avoid alloc memory from gpu0
        with th.cuda.device(self.gpuid[0]):
            stats = dict()
            # check if save is OK
            self.save_checkpoint(best=False)
            print('start eval')
            cv = self.eval(dev_loader)
            print('end eval')
            best_loss = cv["loss"]
            self.logger.info("START FROM EPOCH {:d}, LOSS = {:.4f}".format(
                self.cur_epoch, best_loss))
            no_impr = 0
            # make sure not inf
            self.scheduler.best = best_loss
            while self.cur_epoch < num_epochs:
                self.cur_epoch += 1
                cur_lr = self.optimizer.param_groups[0]["lr"]
                self.logger.info("cur_lr: {}".format(cur_lr))
                stats[
                    "title"] = "Loss(time/N, lr={:.3e}) - Epoch {:2d}:".format(
                        cur_lr, self.cur_epoch)
                tr = self.train(train_loader)
                stats["tr"] = "train = {:+.4f}({:.2f}m/{:d})".format(
                    tr["loss"], tr["cost"], tr["batches"])
                cv = self.eval(dev_loader)
                stats["cv"] = "dev = {:+.4f}({:.2f}m/{:d})".format(
                    cv["loss"], cv["cost"], cv["batches"])
                stats["scheduler"] = ""
                if cv["loss"] > best_loss:
                    no_impr += 1
                    stats["scheduler"] = "| no impr, best = {:.4f}".format(
                        self.scheduler.best)
                else:
                    best_loss = cv["loss"]
                    no_impr = 0
                    self.save_checkpoint(best=True)
                self.logger.info(
                    "{title} {tr} | {cv} {scheduler}".format(**stats))
                # schedule here
                self.scheduler.step(cv["loss"])
                # flush scheduler info
                sys.stdout.flush()
                # save last checkpoint
                self.save_checkpoint(best=False)
                if no_impr == self.no_impr:
                    self.logger.info(
                        "Stop training cause no impr for {:d} epochs".format(
                            no_impr))
                    break
            self.logger.info("Training for {:d}/{:d} epoches done!".format(
                self.cur_epoch, num_epochs))


class SiSnrTrainer(Trainer):
    def __init__(self, *args, **kwargs):
        super(SiSnrTrainer, self).__init__(*args, **kwargs)

    def sisnr(self, x, s, eps=1e-8):
        """
        Arguments:
        x: separated signal, N x S tensor
        s: reference signal, N x S tensor
        Return:
        sisnr: N tensor
        """

        def l2norm(mat, keepdim=False):
            return th.norm(mat, dim=-1, keepdim=keepdim)

        if x.shape != s.shape:
            raise RuntimeError(
                "Dimention mismatch when calculate si-snr, {} vs {}".format(
                    x.shape, s.shape))
        x_zm = x - th.mean(x, dim=-1, keepdim=True)
        s_zm = s - th.mean(s, dim=-1, keepdim=True)
        t = th.sum(
            x_zm * s_zm, dim=-1,
            keepdim=True) * s_zm / (l2norm(s_zm, keepdim=True)**2 + eps)
        return 20 * th.log10(eps + l2norm(t) / (l2norm(x_zm - t) + eps))

    def snr(self, x, s, eps=1e-8):
        """
        Arguments:
        x: separated signal, N x S tensor
        s: reference signal, N x S tensor
        Return:
        snr: N tensor
        """

        def l2norm(mat, keepdim=False):
            return th.norm(mat, dim=-1, keepdim=keepdim)

        if x.shape != s.shape:
            raise RuntimeError(
                "Dimention mismatch when calculate si-snr, {} vs {}".format(
                    x.shape, s.shape))
        x_zm = x - th.mean(x, dim=-1, keepdim=True)
        s_zm = s - th.mean(s, dim=-1, keepdim=True)
        return 20 * th.log10(eps + l2norm(s_zm) / (l2norm(s_zm - x_zm) + eps))

    def compute_loss(self, egs):
        # spks x n x S
        ests = th.nn.parallel.data_parallel(
            self.nnet, egs["mix"], device_ids=self.gpuid)
        # spks x n x S
        refs = egs["ref"]
        num_spks = len(refs)

        def sisnr_loss(permute):
            return sum(
                [self.sisnr(ests[s], refs[t])
                 for s, t in enumerate(permute)]) / len(permute)
        
        def snr_loss(permute):
            return sum(
                [self.snr(ests[s], refs[t])
                 for s, t in enumerate(permute)]) / len(permute)

        N = egs["mix"].size(0)
        if self.loss_mode == "snr":
            sisnr_mat = th.stack(
                [snr_loss(range(num_spks))])
        elif self.loss_mode == "sisnr":
            sisnr_mat = th.stack(
                [sisnr_loss(p) for p in permutations(range(num_spks))])
        else:
            raise "must specify loss_mode to sisnr or snr"
        max_perutt, _ = th.max(sisnr_mat, dim=0)
        return -th.sum(max_perutt) / N
