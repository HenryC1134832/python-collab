#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 25 16:00:57 2022

@author: speech70809
"""
import torch as th
from torch._C import Size
import torch.nn as nn

import torch.nn.functional as F


def param(nnet, Mb=True):
    """
    Return number parameters(not bytes) in nnet
    """
    neles = sum([param.nelement() for param in nnet.parameters()])
    return neles / 10**6 if Mb else neles


class ChannelWiseLayerNorm(nn.LayerNorm):
    """
    Channel wise layer normalization
    """

    def __init__(self, *args, **kwargs):
        super(ChannelWiseLayerNorm, self).__init__(*args, **kwargs)

    def forward(self, x):
        """
        x: N x C x T
        """
        if x.dim() != 3:
            raise RuntimeError("{} accept 3D tensor as input".format(
                self.__name__))
        # N x C x T => N x T x C
        x = th.transpose(x, 1, 2)
        # LN
        x = super().forward(x)
        # N x C x T => N x T x C
        x = th.transpose(x, 1, 2)
        return x
    
class WeightNorm(nn.Module):
    append_g = '_g'
    append_v = '_v'

    def __init__(self, module, weights):
        super(WeightNorm, self).__init__()
        self.module = module
        self.weights = weights
        self._reset()

    def _reset(self):
        for name_w in self.weights:
            w = getattr(self.module, name_w)

            # construct g,v such that w = g/||v|| * v
            g = th.norm(w)
            v = w/g.expand_as(w)
            g = nn.parameters(g.data)
            v = nn.parameters(v.data)
            name_g = name_w + self.append_g
            name_v = name_w + self.append_v

            # remove w from parameter list
            del self.module._parameters[name_w]

            # add g and v as new parameters
            self.module.register_parameter(name_g, g)
            self.module.register_parameter(name_v, v)

    def _setweights(self):
        for name_w in self.weights:
            name_g = name_w + self.append_g
            name_v = name_w + self.append_v
            g = getattr(self.module, name_g)
            v = getattr(self.module, name_v)
            w = v*(g/th.norm(v)).expand_as(v)
            setattr(self.module, name_w, w)

    def forward(self, *args):
        self._setweights()
        return self.module.forward(*args)

class GlobalChannelLayerNorm(nn.Module):
    """
    Global channel layer normalization
    """

    def __init__(self, dim, eps=1e-05, elementwise_affine=True):
        super(GlobalChannelLayerNorm, self).__init__()
        self.eps = eps
        self.normalized_dim = dim
        self.elementwise_affine = elementwise_affine
        if elementwise_affine:
            self.beta = nn.Parameter(th.zeros(dim, 1))
            self.gamma = nn.Parameter(th.ones(dim, 1))
        else:
            self.register_parameter("weight", None)
            self.register_parameter("bias", None)

    def forward(self, x):
        """
        x: N x C x T
        """
        if x.dim() != 3:
            raise RuntimeError("{} accept 3D tensor as input".format(
                self.__name__))
        # N x 1 x 1
        mean = th.mean(x, (1, 2), keepdim=True)
        var = th.mean((x - mean)**2, (1, 2), keepdim=True)
        # N x T x C
        if self.elementwise_affine:
            x = self.gamma * (x - mean) / th.sqrt(var + self.eps) + self.beta
        else:
            x = (x - mean) / th.sqrt(var + self.eps)
        return x

    def extra_repr(self):
        return "{normalized_dim}, eps={eps}, " \
            "elementwise_affine={elementwise_affine}".format(**self.__dict__)


def build_norm(norm, dim):
    """
    Build normalize layer
    LN cost more memory than BN
    """
    if norm not in ["cLN", "gLN", "BN"]:
        raise RuntimeError("Unsupported normalize layer: {}".format(norm))
    if norm == "cLN":
        return ChannelWiseLayerNorm(dim, elementwise_affine=True)
    elif norm == "BN":
        return nn.BatchNorm1d(dim)
    else:
        return GlobalChannelLayerNorm(dim, elementwise_affine=True)


class Conv1D(nn.Conv1d):
    """
    1D conv in ConvTasNet
    """

    def __init__(self, *args, **kwargs):
        super(Conv1D, self).__init__(*args, **kwargs)

    def forward(self, x, squeeze=False):
        """
        x: N x L or N x C x L
        """
        if x.dim() not in [2, 3]:
            raise RuntimeError("{} accept 2/3D tensor as input".format(
                self.__name__))
        x = super().forward(x if x.dim() == 3 else th.unsqueeze(x, 1))
        if squeeze:
            x = th.squeeze(x)
        return x


class ConvTrans1D(nn.ConvTranspose1d):
    """
    1D conv transpose in ConvTasNet
    """

    def __init__(self, *args, **kwargs):
        super(ConvTrans1D, self).__init__(*args, **kwargs)

    def forward(self, x, squeeze=False):
        """
        x: N x L or N x C x L
        """
        if x.dim() not in [2, 3]:
            raise RuntimeError("{} accept 2/3D tensor as input".format(
                self.__name__))
        x = super().forward(x if x.dim() == 3 else th.unsqueeze(x, 1))
        if squeeze:
            x = th.squeeze(x)
        return x


class Conv1DBlock(nn.Module):
    """1D Convolutional block.

    Args:
        io_channels (int): The number of input/output channels, <B, Sc>
        hidden_channels (int): The number of channels in the internal layers, <H>.
        kernel_size (int): The convolution kernel size of the middle layer, <P>.
        padding (int): Padding value of the convolution in the middle layer.
        dilation (int, optional): Dilation value of the convolution in the middle layer.
        no_redisual (bool, optional): Disable residual block/output.

    Note:
        This implementation corresponds to the "non-causal" setting in the paper.
    """
    
    """
    1D convolutional block:
        Conv1x1 - PReLU - Norm - DConv - PReLU - Norm - SConv
    """

    def __init__(self,
                 in_channels=256,
                 conv_channels=512,
                 Sc = 512,
                 kernel_size=3,
                 dilation=1,
                 norm="cLN",    
                 no_residual = False,
                 causal=False):
        super(Conv1DBlock, self).__init__()
        # 1x1 conv nxBxT -> nXHXT
        # torch.nn.Conv1d(in_channels=io_channels, out_channels=hidden_channels, kernel_size=1)
        self.conv1x1 = Conv1D(in_channels, conv_channels, 1)
        self.prelu1 = nn.PReLU()
        # self.weightsnorm = nn.utils.weight_norm(nn.linear(in_channels,conv_channels))
        self.lnorm1 = build_norm(norm, conv_channels)
        dconv_pad = (dilation * (kernel_size - 1)) // 2 if not causal else (
            dilation * (kernel_size - 1))
        # depthwise conv 
        self.dconv = nn.Conv1d(
            conv_channels,
            conv_channels,
            kernel_size,
            groups=conv_channels,
            padding=dconv_pad,
            dilation=dilation,
            bias=True)
        self.prelu2 = nn.PReLU()
        self.lnorm2 = build_norm(norm, conv_channels)
        # 1x1 conv cross channel
        self.sconv = nn.Conv1d(conv_channels, in_channels, 1, bias=True)
# =============================================================================
#         # residual block 
#         self.res_out = ( 
#             None
#             if no_residual
#             else nn.Conv1d(conv_channels, in_channels, 1, bias=True)
#             )
# =============================================================================
                         
        #1x1 conv skip-connection
        self.skip_out = nn.Conv1d(conv_channels, Sc, 1, bias=True)
        # different padding way
        self.causal = causal
        self.dconv_pad = dconv_pad
        
        
        
# =============================================================================
#     def forward(self, x) 
#         feature = self.conv_layers(input)
#         if self.res_out is None:
#             residual = None
#         else:
#             residual = self.res_out(feature)
#         skip_out = self.skip_out(feature)
#         return residual, skip_out    
# =============================================================================

    def forward(self, x):
        y = self.conv1x1(x)
        
        if __name__ == "__main__":
            print('1D blick after fist 1x1Conv size', y.size())
            
        y = self.lnorm1(self.prelu1(y))
        y = self.dconv(y)
        
        if __name__ == "__main__":
            print('1D Conv block after dconv size', y.size())
        
        if self.causal:
            y = y[:, :, :-self.dconv_pad]
            
        y = self.lnorm2(self.prelu2(y))
        out = self.sconv(y)
# =============================================================================
#         if self.res_out is None:
#             residual = None
#         else:
#             residual = self.res_out(x)
# =============================================================================
        skip = self.skip_out(y)
        x = x + out

        return skip, x



class ConvTasNet(nn.Module):
    """TCN (Temporal Convolution Network) Separation Module

    Generates masks for separation.

    Args:
        input_dim (int): Input feature dimension, <N>.
        num_sources (int): The number of sources to separate.
        kernel_size (int): The convolution kernel size of conv blocks, <P>.
        num_featrs (int): Input/output feature dimenstion of conv blocks, <B, Sc>.
        num_hidden (int): Intermediate feature dimention of conv blocks, <H>
        num_layers (int): The number of conv blocks in one stack, <X>.
        num_stacks (int): The number of conv block stacks, <R>.
        msk_activate (str): The activation function of the mask output.

    Note:
        This implementation corresponds to the "non-causal" setting in the paper.
    """
    
    """Conv-TasNet: a fully-convolutional time-domain audio separation network
    *Conv-TasNet: Surpassing Ideal Time–Frequency Magnitude Masking for Speech Separation*
    [:footcite:`Luo_2019`].

    Args:
        num_sources (int, optional): The number of sources to split.
        enc_kernel_size (int, optional): The convolution kernel size of the encoder/decoder, <L>.
        enc_num_feats (int, optional): The feature dimensions passed to mask generator, <N>.
        msk_kernel_size (int, optional): The convolution kernel size of the mask generator, <P>.
        msk_num_feats (int, optional): The input/output feature dimension of conv block in the mask generator, <B, Sc>.
        msk_num_hidden_feats (int, optional): The internal feature dimension of conv block of the mask generator, <H>.
        msk_num_layers (int, optional): The number of layers in one conv block of the mask generator, <X>.
        msk_num_stacks (int, optional): The numbr of conv blocks of the mask generator, <R>.
        msk_activate (str, optional): The activation function of the mask output (Default: ``sigmoid``).

    Note:
        This implementation corresponds to the "non-causal" setting in the paper.
    """

    
    def __init__(self,
                 # encoder/decoder parameters
                 L=16,
                 N=512,
                 # mask generator parameters
                 X=8,
                 R=3,
                 B=128,
                 Sc=128,
                 H=512,
                 P=3,
                 norm="cLN",
                 num_spks=2,
                 non_linear="sigmoid",
                 causal=False):
        super(ConvTasNet, self).__init__()
        supported_nonlinear = {
            "relu": F.relu,
            "sigmoid": th.sigmoid,
            "softmax": F.softmax
        }
        if non_linear not in supported_nonlinear:
            raise RuntimeError("Unsupported non-linear function: {}",
                               format(non_linear))
        self.non_linear_type = non_linear
        self.non_linear = supported_nonlinear[non_linear]
        # n x S => n x N x T, S = 4s*8000 = 32000
        # Hyper-parameter
        # Components
        # 50% overlap
        self.encoder_1d = Conv1D(1, N, L, stride=L // 2, padding=0)
        # self.encoder = Conv1d(in_channels=1,out_channels=enc_num_feats,kernel_size=enc_kernel_size,stride=self.enc_stride,padding=self.enc_stride,bias=False)
        # keep T not change
        # T = int((xlen - L) / (L // 2)) + 1
        # before repeat blocks, always cLN
        self.ln = ChannelWiseLayerNorm(N)
        # n x N x T => n x B x T
        self.proj = Conv1D(N, B, 1)
        # repeat blocks
        # n x B x T => n x B x T
        self.repeats = self._build_repeats(
            R,
            X,
            Sc=Sc,
            in_channels=B,
            conv_channels=H,
            kernel_size=P,
            norm=norm,
            causal=causal)
        self.PRelu = nn.PReLU()
        # output 1x1 conv
        # n x B x T => n x N x T
        # NOTE: using ModuleList not python list
        # self.conv1x1_2 = th.nn.ModuleList(
        #     [Conv1D(B, N, 1) for _ in range(num_spks)])
        # n x Sc x T => n x 2N x T
        self.mask = Conv1D(Sc, num_spks * N, 1)
        # using ConvTrans1D: n x N x T => n x 1 x To
        # To = (T - 1) * L // 2 + L
        self.decoder_1d = ConvTrans1D(
            N, 1, kernel_size=L, stride=L // 2, bias=True)
        self.num_spks = num_spks
        self.R = R #numbers of repeat
        self.X = X #numbers of Conv1Dblock in each repeat

    def _build_blocks(self, num_blocks, **block_kwargs):
        """
        Build Conv1D block
        """
        blocks = [
            Conv1DBlock(**block_kwargs, dilation=(2**b))
            for b in range(num_blocks)
        ]
        return nn.Sequential(*blocks)

    def _build_repeats(self, num_repeats, num_blocks, **block_kwargs):
        """
        Build Conv1D block repeats
        """
        repeats = [
            self._build_blocks(num_blocks, **block_kwargs)
            for r in range(num_repeats)
        ]
        return nn.Sequential(*repeats)

    def forward(self, x):
        if x.dim() >= 3:
            raise RuntimeError(
                "{} accept 1/2D tensor as input, but got {:d}".format(
                    self.__name__, x.dim()))
        # when inference, only one utt
        if x.dim() == 1:
            x = th.unsqueeze(x, 0)
        #encoder
        # n x 1 x S => n x N x T
        w = F.relu(self.encoder_1d(x))
        
        #Seperation
        #   LayerNorm & 1X1 Conv
        # n x B x T
        y = self.proj(self.ln(w))
        
        #TCN
        # n x B x T
        skip_connection = 0
        for i in range(self.R):
            for j in range(self.X):
                skip, y = self.repeats[i][j](y)
                skip_connection = skip_connection + skip
        
        y = self.PRelu(skip_connection)
        # n x 2N x T
        e = th.chunk(self.mask(y), self.num_spks, 1)
        # n x N x T
        if self.non_linear_type == "softmax":
            m = self.non_linear(th.stack(e, dim=0), dim=0)
        else:
            m = self.non_linear(th.stack(e, dim=0))
        # spks x [n x N x T]
        s = [w * m[n] for n in range(self.num_spks)]
        # spks x n x S
        return [self.decoder_1d(x, squeeze=True) for x in s]
    
    
class MB_ConvTasNet(nn.Module):
    def __init__(self,
                 L=16,
                 N=512,
                 X=8,
                 R=1,
                 B=128,
                 Sc=128,
                 Slice=1,
                 H=512,
                 P=3,
                 norm="gLN",
                 num_spks=2,
                 non_linear="sigmoid",
                 causal=False):
        super(MB_ConvTasNet, self).__init__()
        supported_nonlinear = {
            "relu": F.relu,
            "sigmoid": th.sigmoid,
            "softmax": F.softmax
        }
        if non_linear not in supported_nonlinear:
            raise RuntimeError("Unsupported non-linear function: {}",
                               format(non_linear))
        self.non_linear_type = non_linear
        self.non_linear = supported_nonlinear[non_linear]
        # n x S => n x N x T, S = 4s*8000 = 32000
        self.encoder_1d = Conv1D(1, N, L, stride=L // 2, padding=0)
        # keep T not change
        # T = int((xlen - L) / (L // 2)) + 1
        # before repeat blocks, always cLN
        self.ln = ChannelWiseLayerNorm(N)
        # n x N x T => n x B x T
        self.proj = Conv1D(N, B, 1)
        # repeat blocks
        # n x B x T => n x B x T
        self.slices = self._build_slices(
            Slice,
            R,
            X,
            Sc=Sc,
            in_channels=B,
            conv_channels=H,
            kernel_size=P,
            norm=norm,
            causal=causal)
        
        #weight for each branch
        self.wList = self._build_weight(Slice)
        
        self.PRelu = nn.PReLU()
        # output 1x1 conv
        # n x B x T => n x N x T
        # NOTE: using ModuleList not python list
        # self.conv1x1_2 = th.nn.ModuleList(
        #     [Conv1D(B, N, 1) for _ in range(num_spks)])
        # n x Sc x T => n x 2N x T
        self.mask = Conv1D(Sc, num_spks * N, 1)
        # using ConvTrans1D: n x N x T => n x 1 x To
        # To = (T - 1) * L // 2 + L
        self.decoder_1d = ConvTrans1D(
            N, 1, kernel_size=L, stride=L // 2, bias=True)
        self.num_spks = num_spks
        self.R = R #numbers of repeat
        self.X = X #numbers of Conv1Dblock in each repeat
        self.slice = Slice #numbers of slices
        

    def _build_weight(self, Slice):
        wList = nn.Parameter(th.randn(Slice,requires_grad=True))
        return wList

    def _build_blocks(self, num_blocks, **block_kwargs):
        """
        Build Conv1D block
        """
        blocks = [
            Conv1DBlock(**block_kwargs, dilation=(2**b))
            for b in range(num_blocks)
        ]
        return nn.Sequential(*blocks)

    def _build_repeats(self, num_repeats, num_blocks, **block_kwargs):
        """
        Build Conv1D block repeats
        """
        repeats = [
            self._build_blocks(num_blocks, **block_kwargs)
            for r in range(num_repeats)
        ]
        return nn.Sequential(*repeats)
    
    def _build_slices(self, num_slice, num_repeats, num_blocks, **block_kwargs):
        """
        Build Conv1D block repeats
        """
        slices = [
            self._build_repeats(num_repeats, num_blocks, **block_kwargs)
            for r in range(num_slice)
        ]
        return nn.Sequential(*slices)

    def forward(self, x):
        
        if __name__ == "__main__":
            print('input size', x.size())
        
        if x.dim() >= 3:
            raise RuntimeError(
                "{} accept 1/2D tensor as input, but got {:d}".format(
                    self.__name__, x.dim()))
        # when inference, only one utt
        if x.dim() == 1:
            x = th.unsqueeze(x, 0)
        #encoder
        # n x 1 x S => n x N x T
        w = F.relu(self.encoder_1d(x))
        
        if __name__ == "__main__":
            print('after encoder size', w.size())
        
        #Seperation
        #   LayerNorm & 1X1 Conv
        # n x B x T
        y = self.proj(self.ln(w))
        
        if __name__ == "__main__":
            print('after LayerNorm and 1x1 Conv', y.size())
        
        #Slices of TCN
        # n x B x T
        total_connection = 0
        skip_connection = 0
        Slice_input = y
        a = 0
        for Slice in range(self.slice):
            
            if __name__ == "__main__":
                print('slice input size', y.size())
            
            for i in range(self.R):
                for j in range(self.X):
                    if __name__ == "__main__":
                        print('1D Conv block input size', y.size())
                    
                    skip, y = self.slices[Slice][i][j](y)
                    skip_connection = skip_connection + skip
                    if __name__ == "__main__":
                        print('finished 1D Conv block skip_connection size', skip.size())
                        print('finished 1D Conv blick ouput size', y.size())
                
            total_connection = skip_connection * self.wList[Slice] + total_connection
            if __name__ == "__main__":
                print('slice weight here', self.wList[Slice])
                print('total_connection', total_connection.size())
            if a==0:
                result = total_connection
                print('first loop total_connection is here ',total_connection)
                a = a+1
            else:
                print('sec loop total_connection is ',total_connection)
                result = result+total_connection
            skip_connection = 0
            y = Slice_input
        
        y = self.PRelu(total_connection)
        
        # n x 2N x T
        e = th.chunk(self.mask(y), self.num_spks, 1)
        
        if __name__ == "__main__":
            print('after 1x1 Conv mask)', e[0].size())
        
        # n x N x T
        if self.non_linear_type == "softmax":
            m = self.non_linear(th.stack(e, dim=0), dim=0)
        else:
            m = self.non_linear(th.stack(e, dim=0))
        # spks x [n x N x T]
        s = [w * m[n] for n in range(self.num_spks)]
        # spks x n x S
        return [self.decoder_1d(x, squeeze=True) for x in s]


class MS_SL2_model(nn.Module):
    def __init__(self,
                 L=16,
                 N=512,
                 X=8,
                 R=1,
                 B=128,
                 Sc=128,
                 Slice=2,
                 H=512,
                 P=3,
                 norm="gLN",
                 num_spks=2,
                 non_linear="sigmoid",
                 causal=False):
        super(MS_SL2_model, self).__init__()
        supported_nonlinear = {
            "relu": F.relu,
            "sigmoid": th.sigmoid,
            "softmax": F.softmax
        }
        if non_linear not in supported_nonlinear:
            raise RuntimeError("Unsupported non-linear function: {}",
                               format(non_linear))
        self.non_linear_type = non_linear
        self.non_linear = supported_nonlinear[non_linear]
        # n x S => n x N x T, S = 4s*8000 = 32000
        self.encoder_1d = Conv1D(1, N, L, stride=L // 2, padding=0)
        # keep T not change
        # T = int((xlen - L) / (L // 2)) + 1
        # before repeat blocks, always cLN
        self.ln = ChannelWiseLayerNorm(N)
        # n x N x T => n x B x T
        self.proj = Conv1D(N, B, 1)
        # repeat blocks
        # n x B x T => n x B x T
        self.slices = self._build_slices(Slice)

        #weight for each branch
        self.wList = [0.5+0.001, 0.5-0.001]
        self.PRelu = nn.PReLU()
        # output 1x1 conv
        # n x B x T => n x N x T
        # NOTE: using ModuleList not python list
        # self.conv1x1_2 = th.nn.ModuleList(
        #     [Conv1D(B, N, 1) for _ in range(num_spks)])
        # n x Sc x T => n x 2N x T
        self.mask = Conv1D(Sc, num_spks * N, 1)
        # using ConvTrans1D: n x N x T => n x 1 x To
        # To = (T - 1) * L // 2 + L
        self.decoder_1d = ConvTrans1D(
            N, 1, kernel_size=L, stride=L // 2, bias=True)
        self.num_spks = num_spks
        self.R = R #numbers of repeat
        self.X = X #numbers of Conv1Dblock in each repeat
        self.slice = Slice #numbers of slices
    
        
    def get_slice(self):
        cpt = th.load('/workplace/yxzeng/new/Speech_Denoiser/MS_R1_SL2_TL_AIcenter_saved_models/15.pt.tar')

        #cpt = th.load('/media/lab70809/Mac-pro2/Speech_Denoiser/MS_R1_SL2_TL_AIcenter_saved_models/48.pt.tar')
        MS_model=MB_ConvTasNet()
        MS_model.load_state_dict(cpt["model_state_dict"])
        return MS_model.slices[0]

    def _build_slices(self, num_slice):
        """
        Build Conv1D block repeats
        """
        
        slicesBlock= [            
            self.get_slice()
            for b in range(num_slice)
        ]
        return nn.Sequential(*slicesBlock)
    
    def forward(self, x):
        
        if __name__ == "__main__":
            print('input size', x.size())
        
        if x.dim() >= 3:
            raise RuntimeError(
                "{} accept 1/2D tensor as input, but got {:d}".format(
                    self.__name__, x.dim()))
        # when inference, only one utt
        if x.dim() == 1:
            x = th.unsqueeze(x, 0)
        #encoder
        # n x 1 x S => n x N x T
        w = F.relu(self.encoder_1d(x))
        
        if __name__ == "__main__":
            print('after encoder size', w.size())
        
        #Seperation
        #   LayerNorm & 1X1 Conv
        # n x B x T
        y = self.proj(self.ln(w))
        
        if __name__ == "__main__":
            print('after LayerNorm and 1x1 Conv', y.size())
        
        #Slices of TCN
        # n x B x T
        total_connection = 0
        skip_connection = 0
        Slice_input = y
        a = 0
        for Slice in range(self.slice):
            
            if __name__ == "__main__":
                print('slice input size', y.size())
            
            for i in range(self.R):
                for j in range(self.X):
                    if __name__ == "__main__":
                        print('1D Conv block input size', y.size())
                    
                    skip, y = self.slices[Slice][i][j](y)
                    skip_connection = skip_connection + skip
                    if __name__ == "__main__":
                        print('finished 1D Conv block skip_connection size', skip.size())
                        print('finished 1D Conv blick ouput size', y.size())
                
            total_connection = skip_connection * self.wList[Slice] + total_connection
            if __name__ == "__main__":
                print('slice weight', self.wList[Slice])
                print('total_connection', total_connection.size())
            
            if a==0:
                result = total_connection
                print('first loop total_connection is come',total_connection)
                a = a+1
            else:
                print('sec loop total_connection is ',total_connection)
                result = result+total_connection
            skip_connection = 0
            y = Slice_input
        
        y = self.PRelu(total_connection)
        
        # n x 2N x T
        e = th.chunk(self.mask(y), self.num_spks, 1)
        
        if __name__ == "__main__":
            print('after 1x1 Conv mask)', e[0].size())
        
        # n x N x T
        if self.non_linear_type == "softmax":
            m = self.non_linear(th.stack(e, dim=0), dim=0)
        else:
            m = self.non_linear(th.stack(e, dim=0))
        # spks x [n x N x T]
        s = [w * m[n] for n in range(self.num_spks)]
        # spks x n x S
        return [self.decoder_1d(x, squeeze=True) for x in s]
    
    
    
#  *******************************************************   


#**************************************************************

class MB_SpeechComponent(nn.Module):
    def __init__(self,
                 L=16,
                 N=512,
                 X=8,
                 R=1,
                 B=128,
                 Sc=128,
                 Slice=3,
                 H=512,
                 P=3,
                 norm="gLN",
                 num_spks=2,
                 non_linear="sigmoid",
                 causal=False):
        super(MB_SpeechComponent, self).__init__()
        supported_nonlinear = {
            "relu": F.relu,
            "sigmoid": th.sigmoid,
            "softmax": F.softmax
        }
        if non_linear not in supported_nonlinear:
            raise RuntimeError("Unsupported non-linear function: {}",
                               format(non_linear))
        self.non_linear_type = non_linear
        self.non_linear = supported_nonlinear[non_linear]
        # n x S => n x N x T, S = 4s*8000 = 32000
        self.encoder_1d = Conv1D(1, N, L, stride=L // 2, padding=0)
        # keep T not change
        # T = int((xlen - L) / (L // 2)) + 1
        # before repeat blocks, always cLN
        self.ln = ChannelWiseLayerNorm(N)
        # n x N x T => n x B x T
        self.proj = Conv1D(N, B, 1)
        # repeat blocks
        # n x B x T => n x B x T
        self.slices = self._build_slices(
            Slice,
            R,
            X,
            Sc=Sc,
            in_channels=B,
            conv_channels=H,
            kernel_size=P,
            norm=norm,
            causal=causal)

        # weight for each branch
        # self.wList = self._build_weight(Slice)

        self.PRelu = nn.PReLU()
        # output 1x1 conv
        # n x B x T => n x N x T
        # NOTE: using ModuleList not python list
        # self.conv1x1_2 = th.nn.ModuleList(
        #     [Conv1D(B, N, 1) for _ in range(num_spks)])
        # n x Sc x T => n x 2N x T
        self.mask = Conv1D(Sc, num_spks * N, 1)
        # using ConvTrans1D: n x N x T => n x 1 x To
        # To = (T - 1) * L // 2 + L
        self.decoder_1d = ConvTrans1D(
            N, 1, kernel_size=L, stride=L // 2, bias=True)
        self.num_spks = num_spks
        self.R = R  # numbers of repeat
        self.X = X  # numbers of Conv1Dblock in each repeat
        self.slice = Slice  # numbers of slices

    # def _build_weight(self, Slice):
    #    wList = nn.Parameter(th.randn(Slice,requires_grad=True))
    #    return wList

    def _build_blocks(self, num_blocks, **block_kwargs):
        """
        Build Conv1D block
        """
        blocks = [
            Conv1DBlock(**block_kwargs, dilation=(2 ** b))
            for b in range(num_blocks)
        ]
        return nn.Sequential(*blocks)

    def _build_repeats(self, num_repeats, num_blocks, **block_kwargs):
        """
        Build Conv1D block repeats
        """
        repeats = [
            self._build_blocks(num_blocks, **block_kwargs)
            for r in range(num_repeats)
        ]
        return nn.Sequential(*repeats)

    def _build_slices(self, num_slice, num_repeats, num_blocks, **block_kwargs):
        """
        Build Conv1D block repeats
        """
        slices = [
            self._build_repeats(num_repeats, num_blocks, **block_kwargs)
            for r in range(num_slice)
        ]
        return nn.Sequential(*slices)

    def forward(self, x):

        if __name__ == "__main__":
            print('input size', x.size())
            print("Value of x ", x)
        if x.dim() >= 3:
            raise RuntimeError(
                "{} accept 1/2D tensor as input, but got {:d}".format(
                    self.__name__, x.dim()))
        # when inference, only one utt
        if x.dim() == 1:
            x = th.unsqueeze(x, 0)
            print("Value of x ", x)
        # encoder
        print("Value of x ", x)
        # n x 1 x S => n x N x T
        w = F.relu(self.encoder_1d(x))

        if __name__ == "__main__":
            print('after encoder size', w.size())

        # Seperation
        #   LayerNorm & 1X1 Conv
        # n x B x T
        y = self.proj(self.ln(w))

        if __name__ == "__main__":
            print('after LayerNorm and 1x1 Conv', y.size())

        # Slices of TCN
        # n x B x T
        total_connection = 0
        skip_connection = 0
        Slice_input = y
        # a = 0
        for Slice in range(self.slice):

            # if __name__ == "__main__":
            # print('slice input size', y.size())

            for i in range(self.R):
                for j in range(self.X):
                    # if __name__ == "__main__":
                    # print('1D Conv block input size', y.size())

                    skip, y = self.slices[Slice][i][j](y)
                    skip_connection = skip_connection + skip
                # if __name__ == "__main__":
                #      print('finished 1D Conv block skip_connection size', skip.size())
                #      print('finished 1D Conv blick ouput size', y.size())

            # total_connection = skip_connection * self.wList[Slice] + total_connection
            total_connection = skip_connection + total_connection
            # if __name__ == "__main__":
            # print('slice weight here', self.wList[Slice])
            # print('total_connection', total_connection.size())
            # if a==0:
            # result = total_connection
            # print('first loop total_connection is here ',total_connection)
            # a = a+1
            # else:
            # print('sec loop total_connection is ',total_connection)
            # result = result+total_connection
            skip_connection = 0
            y = Slice_input

        y = self.PRelu(total_connection)

        # n x 2N x T
        e = th.chunk(self.mask(y), self.num_spks, 1)

        if __name__ == "__main__":
            print('after 1x1 Conv mask)', e[0].size())

        # n x N x T
        if self.non_linear_type == "softmax":
            m = self.non_linear(th.stack(e, dim=0), dim=0)
        else:
            m = self.non_linear(th.stack(e, dim=0))
        # spks x [n x N x T]
        s = [w * m[n] for n in range(self.num_spks)]
        # spks x n x S
        return [self.decoder_1d(x, squeeze=True) for x in s]

# *****************************************

class MS_SL2_split_model(nn.Module):
    def __init__(self,
                 L=16, #length of filters(in sample) 
                 N=512, #Number of filters in Autoencoder
                 X=8, #Number of convolution block in each repeat
                 R=1,#Number of repeats
                 B=128,#Number of channels in bottleneck and residual paths' 1 by 1-conv blocks
                 Sc=128,# number of channels in skip-connection paths' 1 by 1-conv blocks
                 Slice=2, #number of slices used in model
                 H=512,#Number of channel in convolution blocks
                 P=1, #kernal size in convolution blocks
                 norm="gLN",
                 num_spks=2,
                 non_linear="sigmoid",
                 causal=False):
        super(MS_SL2_split_model, self).__init__()
        supported_nonlinear = {
            "relu": F.relu,
            "sigmoid": th.sigmoid,
            "softmax": F.softmax
        }
        if non_linear not in supported_nonlinear:
            raise RuntimeError("Unsupported non-linear function: {}",
                               format(non_linear))
        self.non_linear_type = non_linear
        self.non_linear = supported_nonlinear[non_linear]
        # n x S => n x N x T, S = 4s*8000 = 32000
        self.encoder_1d = Conv1D(1, N, L, stride=L // 2, padding=0)
        # keep T not change
        # T = int((xlen - L) / (L // 2)) + 1
        # before repeat blocks, always cLN
        self.ln = ChannelWiseLayerNorm(N)
        # n x N x T => n x B x T
        self.proj = Conv1D(N, B, 1)
        # repeat blocks
        # n x B x T => n x B x T
        self.slices = self._build_slices(
            Slice,
            R,
            X,
            Sc=Sc,
            in_channels=B,
            conv_channels=H,
            kernel_size=P,
            norm=norm,
            causal=causal)
        
        #weight for each branch
        self.wList = nn.Parameter(th.tensor([0.5+0.001, 0.5-0.001,0.4-0.001,0.4+0.001]),requires_grad=True)
        
        self.PRelu = nn.PReLU()
        # output 1x1 conv
        # n x B x T => n x N x T
        # NOTE: using ModuleList not python list
        # self.conv1x1_2 = th.nn.ModuleList(
        #     [Conv1D(B, N, 1) for _ in range(num_spks)])
        # n x Sc x T => n x 2N x T
        self.mask = Conv1D(Sc, num_spks * N, 1)
        # using ConvTrans1D: n x N x T => n x 1 x To
        # To = (T - 1) * L // 2 + L
        self.decoder_1d = ConvTrans1D(
            N, 1, kernel_size=L, stride=L // 2, bias=True)
        self.num_spks = num_spks
        self.R = R #numbers of repeat
        self.X = X #numbers of Conv1Dblock in each repeat
        self.slice = Slice #numbers of slices
    
        
    def _build_blocks(self, num_blocks, **block_kwargs):
        """
        Build Conv1D block
        """
        blocks = [
            Conv1DBlock(**block_kwargs, dilation=(2**b))
            for b in range(num_blocks)
        ]
        return nn.Sequential(*blocks)

    def _build_repeats(self, num_repeats, num_blocks, **block_kwargs):
        """
        Build Conv1D block repeats
        """
        repeats = [
            self._build_blocks(num_blocks, **block_kwargs)
            for r in range(num_repeats)
        ]
        return nn.Sequential(*repeats)
    
    def _build_slices(self, num_slice, num_repeats, num_blocks, **block_kwargs):
        """
        Build Conv1D block repeats
        """
        slices = [
            self._build_repeats(num_repeats, num_blocks, **block_kwargs)
            for r in range(num_slice)
        ]
        return nn.Sequential(*slices)
    def forward(self, x):
        
        if __name__ == "__main__":
            print('input size', x.size())
        
        if x.dim() >= 3:
            raise RuntimeError(
                "{} accept 1/2D tensor as input, but got {:d}".format(
                    self.__name__, x.dim()))
        # when inference, only one utt
        if x.dim() == 1:
            x = th.unsqueeze(x, 0)
        #encoder
        # n x 1 x S => n x N x T
        print(x.dim())
        w = F.relu(self.encoder_1d(x))
        
        if __name__ == "__main__":
            print('after encoder size', w.size())
        
        #Seperation
        #   LayerNorm & 1X1 Conv
        # n x B x T
        y = self.proj(self.ln(w))
        
        if __name__ == "__main__":
            print('after LayerNorm and 1x1 Conv', y.size())
        
        #Slices of TCN
        # n x B x T
        
        total_connection = 0
        skip_connection = 0
        Slice_input = y
        Tcn_into_weight=[]
        
        Tcn_output_result=0
        for Slice in range(self.slice):
            
            if __name__ == "__main__":
                print('slice input size', y.size())
            
            for i in range(self.R):
                for j in range(self.X):
                    if __name__ == "__main__":
                        print('1D Conv block input size', y.size())
                    
                    skip, y = self.slices[Slice][i][j](y)
                    skip_connection = skip_connection + skip
                    #print("Skip connection check here",skip_connection),
                    if __name__ == "__main__":
                         print('finished 1D Conv block skip_connection size', skip.size())
                         print('finished 1D Conv block ouput size', y.size())
                    #     print("Weight lenght ",self.wList)
            
            for i in range (len(self.wList)): 
                #if a==0:  
                print("Weight value1", self.wList[i])
                # a = sigma(w * f(w*input)) 
                # paper name":- Channel-wise and Spatial Feature Modulation Network for Single Image Super-Resolution
                total_connection = th.sigmoid(self.wList[i] * th.relu(skip_connection * self.wList[i]))
                # fca = th.sigmoid(total_connection * skip_connection)
                
                # total_connection = skip_connection * self.wList[i]
                # z = th.sigmoid(total_connection)
                # print("The value of Z", fca)
                Tcn_into_weight.append(total_connection)
                # Tcn_into_weight.append(z)
                
                print("lenght of skip connection TCN :", len(skip_connection))
                #print("Weight value1 after append ", W_firstResult)
                total_connection=0
                
        #     print("Weight lenght ",len(self.wList))
        #     if __name__ == "__main__":
        #         print('slice weight last', self.wList[Slice-2])
             
            
        #     skip_connection = 0
        #     y = Slice_input
        for i in range(len(Tcn_into_weight)):
            Tcn_output_result+=Tcn_into_weight[i]
        #print("TcnResult values", Tcn_output_result)
        
            skip_connection = 0
            y = Slice_input
        # print(" Out put of TcnResult shape", Tcn_output_result.size())
        
             
        y = self.PRelu(Tcn_output_result)
        print("Output of Tcn size after pRelu",y.size())           
        
        
        # n x 2N x T
        e = th.chunk(self.mask(y), self.num_spks, 1)
        print("dimension of mask", e)
        
        if __name__ == "__main__":
            print('after 1x1 Conv mask)', e[0].size())
        
        # n x N x T
        if self.non_linear_type == "softmax":
            m = self.non_linear(th.stack(e, dim=0), dim=0)
        else:
            m = self.non_linear(th.stack(e, dim=0))
        # spks x [n x N x T]
        s = [w * m[n] for n in range(self.num_spks)]
        # spks x n x S
        return [self.decoder_1d(x, squeeze=True) for x in s]


# ******************End of Model*************************     

# ***********************************************

def foo_conv1d_block():
    nnet = Conv1DBlock(256, 512, 3, 20)
    print(param(nnet))
# ***********************************************
def foo_layernorm():
    C, T = 256, 20
    nnet1 = nn.LayerNorm([C, T], elementwise_affine=True)
    print(param(nnet1, Mb=False))
    nnet2 = nn.LayerNorm([C, T], elementwise_affine=False)
    print(param(nnet2, Mb=False))
# ***********************************************
def foo_conv_tas_net():
    x = th.rand(4, 1000)
    nnet = ConvTasNet(norm="cLN", causal=False)
    # print(nnet)
    print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    x = nnet(x)
    s1 = x[0]
    print(s1.shape)    
# ***********************************************    
def foo_MB_ConvTasNet():
    x = th.rand(4, 1000)
    nnet = MB_ConvTasNet(norm="cLN", causal=False)
    print(nnet)
    print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    x = nnet(x)
    s1 = x[0]
    print(s1.shape)
# ***********************************************
def foo_MS_SL2():
    x = th.rand(2, 100)
    nnet = MS_SL2_model(norm="cLN", causal=False)
    print(nnet)
    print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    x = nnet(x)
    s1 = x[0]
    print(s1.shape)

# ********************************************************
# def SL2_split(**nnet_conf):
#     cpt = th.load('/workplace/yxzeng/new/Speech_Denoiser/MS_R1_SL2_TL_AIcenter_saved_models/15.pt.tar')

#     #cpt = th.load('/media/lab70809/Mac-pro2/Speech_Denoiser/MS_R1_SL2_TL_AIcenter_saved_models/15.pt.tar')
#     nnet=MS_SL2_split_model(**nnet_conf)
#     nnet.load_state_dict(cpt["model_state_dict"],strict=False)
#     return nnet
# ********************************************************
# =============================================================================
# def SL2_split(**nnet_conf):
#     cpt_machine = th.load('/media/speech70809/Data02/MS_R1_SL2_machine_300_20220215_saved_models/best.pt.tar')
#     cpt_human = th.load('/media/speech70809/Data02/MS_R1_SL1_human3000121__saved_models/best.pt.tar')
#     # cpt_human_machine = th.add(cpt_machine, cpt_human)
#     nnet=MS_SL2_split_model(**nnet_conf)
#     nnet.load_state_dict(cpt_machine["model_state_dict"],strict=False)
#     nnet.load_state_dict(cpt_human["model_state_dict"],strict=False)
#     x = th.rand(4, 1000)
#     print(nnet)
#     print("ConvTasNet #param: {:.2f}".format(param(nnet)))
#     x = nnet(x)
#     s1 = x[0]
#     print(s1.shape)
# =============================================================================
    # return nnet
#  ******************************************************
def foo_MB_SpeechComponent():
    x = th.rand(4, 1000)
    nnet = MB_SpeechComponent(norm="cLN", causal=False)
    print(nnet)
    print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    x = nnet(x)
    s1 = x[0]
    print(s1.shape)
#  ******************************************************

def MS_SL2_split_channelwise():
    x = th.rand(1,1000)
    nnet = MS_SL2_split_model(norm="cLN", causal=False)
    print(nnet)
    print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    x = nnet(x)
    s1 = x[0]
    print(s1.shape)
    
#  ******************************************************

if __name__ == "__main__":
    # foo_MB_SpeechComponent()
    # foo_MB_ConvTasNet()
    # foo_conv_tas_net()
    # foo_conv1d_block()
    # foo_layernorm()
    # foo_MS_SL2()    
    # cpt = th.load('/workplace/yxzeng/new/Speech_Denoiser/MS_R1_SL2_TL_AIcenter_saved_models/15.pt.tar')
    # cpt = th.load('/media/lab70809/Mac-pro2/Speech_Denoiser/MS_R1_SL2_TL_AIcenter_saved_models/48.pt.tar')
    # nnet=MS_SL2_split_model()    
    # nnet.load_state_dict(cpt["model_state_dict"],strict=False)
    # SL2_split()
    MS_SL2_split_channelwise()
    # x = th.rand(2, 100)
    # x = th.rand(4, 1000)
    # print(nnet)
    # print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    # x = nnet(x)
    # s1 = x[0]
    # print(s1.shape)
