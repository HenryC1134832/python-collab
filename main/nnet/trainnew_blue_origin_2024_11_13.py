
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# wujian@2018
import os
import pprint
import argparse
import random
import torch as th
import torchvision
from libs.trainer import SiSnrTrainer
from libs.dataset import make_dataloader
from libs.utils import dump_json, get_logger

# from model_max_only_att import MS_SL1_only_attention_model
# from model_ms_ch_fusion_BPF import ConvTasNet, MB_ConvTasNet, MS_SL2_model,MS_SL2_split_model
# from model_stft_Fusion import MS_SL2_split_model
from model_SC_CHM_Fusion import MS_SL2_split_model
#from conv_tas_net import ConvTasNet
from conf import trainer_conf, nnet_conf, train_data, dev_data, chunk_size
import datetime

logger = get_logger(__name__)


def run(args):
    gpuids = tuple(map(int, args.gpus.split(",")))
    nnet = MS_SL2_split_model(**nnet_conf)    
    trainer = SiSnrTrainer(nnet,
                           gpuid=gpuids,
                           checkpoint=args.checkpoint,
                           resume=args.resume,
                           **trainer_conf)

    data_conf = {
        "train": train_data,
        "dev": dev_data,
        "chunk_size": chunk_size
    }
    for conf, fname in zip([nnet_conf, trainer_conf, data_conf],
                           ["mdl.json", "trainer.json", "data.json"]):
        dump_json(conf, args.checkpoint, fname)

    train_loader = make_dataloader(train=True,
                                   data_kwargs=train_data,
                                   batch_size=args.batch_size,
                                   chunk_size=chunk_size,
                                   num_workers=args.num_workers)
    dev_loader = make_dataloader(train=False,
                                 data_kwargs=dev_data,
                                 batch_size=args.batch_size,
                                 chunk_size=chunk_size,
                                 num_workers=args.num_workers)

    trainer.run(train_loader, dev_loader, num_epochs=args.epochs)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description=
        "Command to start ConvTasNet training, configured from conf.py",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--gpus",
                        type=str,
                        default="0,1",
                        help="Training on which GPUs "
                        "(one or more, egs: 0, \"0,1\")")
    parser.add_argument("--epochs",
                        type=int,
                        default=50,
                        help="Number of training epochs")
    parser.add_argument("--checkpoint",
                        type=str,
                        required=True,
                        help="Directory to dump models")
    parser.add_argument("--resume",
                        type=str,
                        default="",
                        help="Exist model to resume training from")
    parser.add_argument("--batch-size",
                        type=int,
                        default=16,
                        help="Number of utterances in each batch")
    parser.add_argument("--num-workers",
                        type=int,
                        default=4,
                        help="Number of workers used in data loader")
    args = parser.parse_args()
    logger.info("Arguments in command:\n{}".format(pprint.pformat(vars(args))))
    
    start = datetime.datetime.now()

    run(args)
    
    end = datetime.datetime.now()
    print("running time：", end - start)
