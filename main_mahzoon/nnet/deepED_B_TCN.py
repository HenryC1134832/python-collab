# wujian@2018

import torch as th
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
    
class Encoder(nn.Module):

    def __init__(self, in_channels, out_channels, kernel_size, stride):
        super(Encoder, self).__init__()
        self.sequential = nn.Sequential(
            Conv1D(in_channels, out_channels, kernel_size, stride=stride),
            Conv1D(out_channels, out_channels, kernel_size=3, stride=1, dilation=1, padding=1),
            nn.PReLU(),
            Conv1D(out_channels, out_channels, kernel_size=3, stride=1, dilation=2, padding=2),
            nn.PReLU(),
            Conv1D(out_channels, out_channels, kernel_size=3, stride=1, dilation=4, padding=4),
            nn.PReLU(),
            Conv1D(out_channels, out_channels, kernel_size=3, stride=1, dilation=8, padding=8),
            nn.PReLU()
        )
    def forward(self, x):
        '''
           x: [B, T]
           out: [B, N, T]
        '''
        x = self.sequential(x)
        return x

class Decoder(nn.Module):
    '''
        Decoder
        This module can be seen as the gradient of Conv1d with respect to its input. 
        It is also known as a fractionally-strided convolution 
        or a deconvolution (although it is not an actual deconvolution operation).
    '''

    def __init__(self, N, kernel_size=16, stride=16 // 2):
        super(Decoder, self).__init__()
        self.sequential = nn.Sequential(
            nn.ConvTranspose1d(N, N, kernel_size=3, stride=1, dilation=8, padding=8),
            nn.PReLU(),
            nn.ConvTranspose1d(N, N, kernel_size=3, stride=1, dilation=4, padding=4),
            nn.PReLU(),
            nn.ConvTranspose1d(N, N, kernel_size=3, stride=1, dilation=2, padding=2),
            nn.PReLU(),
            nn.ConvTranspose1d(N, N, kernel_size=3, stride=1, dilation=1, padding=1),
            nn.PReLU(),
            nn.ConvTranspose1d(N, 1, kernel_size=kernel_size, stride=stride, bias=True)
        )

    def forward(self, x):
        """
        x: N x L or N x C x L
        """
        x = self.sequential(x)
        if th.squeeze(x).dim() == 1:
            x = th.squeeze(x, dim=1)
        else:
            x = th.squeeze(x)

        return x


class Conv1DBlock(nn.Module):
    """
    1D convolutional block:
        Conv1x1 - PReLU - Norm - DConv - PReLU - Norm - SConv
    """

    def __init__(self,
                 in_channels=256,
                 conv_channels=512,
                 kernel_size=3,
                 dilation=1,
                 norm="cLN",
                 causal=False):
        super(Conv1DBlock, self).__init__()
        # 1x1 conv
        self.conv1x1 = Conv1D(in_channels, conv_channels, 1)
        self.prelu1 = nn.PReLU()
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
        # different padding way
        self.causal = causal
        self.dconv_pad = dconv_pad

    def forward(self, x):
        y = self.conv1x1(x)
        y = self.lnorm1(self.prelu1(y))
        y = self.dconv(y)
        if self.causal:
            y = y[:, :, :-self.dconv_pad]
        y = self.lnorm2(self.prelu2(y))
        y = self.sconv(y)
        x = x + y
        return x


class ConvTasNet(nn.Module):
    def __init__(self,
                 L=20,
                 N=256,
                 X=8,
                 R=1,
                 B=256,
                 H=512,
                 P=3,
                 norm="cLN",
                 num_spks=2,
                 non_linear="relu",
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
        self.encoder_1d = Encoder(1, N, L, stride=L // 2)
        # keep T not change
        # T = int((xlen - L) / (L // 2)) + 1
        # before repeat blocks, always cLN
        self.ln = ChannelWiseLayerNorm(N)
        # n x N x T => n x B x T
        self.proj = Conv1D(N, B, 1)
        # repeat blocks
        # n x B x T => n x B x T
        self.repeats1 = self._build_repeats(
            R,
            X,
            in_channels=B,
            conv_channels=H,
            kernel_size=P,
            norm=norm,
            causal=causal).to('cuda:0')
        self.repeats2 = self._build_repeats(
            R,
            X,
            in_channels=B,
            conv_channels=H,
            kernel_size=P,
            norm=norm,
            causal=causal).to('cuda:1')
        self.repeats3 = self._build_repeats(
            R,
            X,
            in_channels=B,
            conv_channels=H,
            kernel_size=P,
            norm=norm,
            causal=causal).to('cuda:2')
        self.repeats4 = self._build_repeats(
            R,
            X,
            in_channels=B,
            conv_channels=H,
            kernel_size=P,
            norm=norm,
            causal=causal).to('cuda:3')
        
        self.w1 = nn.Parameter(th.randn(1,requires_grad=True)).to('cuda:0')
        self.w2 = nn.Parameter(th.randn(1,requires_grad=True)).to('cuda:1')
        self.w3 = nn.Parameter(th.randn(1,requires_grad=True)).to('cuda:2')
        self.w4 = nn.Parameter(th.randn(1,requires_grad=True)).to('cuda:3')
        # output 1x1 conv
        # n x B x T => n x N x T
        # NOTE: using ModuleList not python list
        # self.conv1x1_2 = th.nn.ModuleList(
        #     [Conv1D(B, N, 1) for _ in range(num_spks)])
        # n x B x T => n x 2N x T
        self.mask = Conv1D(B, num_spks * N, 1)
        # using ConvTrans1D: n x N x T => n x 1 x To
        # To = (T - 1) * L // 2 + L
        self.decoder_1d = Decoder(
            N, kernel_size=L, stride=L // 2)
        self.num_spks = num_spks

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
        # n x 1 x S => n x N x T
        w = F.relu(self.encoder_1d(x))
        # n x B x T
        y = self.proj(self.ln(w))
        # n x B x T
        y1 = self.repeats1(y.to('cuda:0'))
        y2 = self.repeats2(y.to('cuda:1'))
        y3 = self.repeats3(y.to('cuda:2'))
        y4 = self.repeats4(y.to('cuda:3'))
        y = y1.cuda()*self.w1.cuda() + y2.cuda()*self.w2.cuda() + \
             y3.cuda()*self.w3.cuda() + y4.cuda()*self.w4.cuda()
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
        return [self.decoder_1d(x) for x in s]

def foo_encoder():
    nnet = Conv1D(1, 256, 20, stride=10, padding=0)
    print("conv1D Param:", param(nnet))
    x = th.rand(4, 1000)
    x = nnet(x)
    print(x.shape)
    
    nnet = Encoder(1, 256, 20, stride=10)
    print("Deep encoder param:", param(nnet))
    x = th.rand(4, 1000)
    x = nnet(x)
    print(x.shape)

def foo_conv1d_block():
    nnet = Conv1DBlock(256, 512, 3, 20)
    print(param(nnet))


def foo_layernorm():
    C, T = 256, 20
    nnet1 = nn.LayerNorm([C, T], elementwise_affine=True)
    print(param(nnet1, Mb=False))
    nnet2 = nn.LayerNorm([C, T], elementwise_affine=False)
    print(param(nnet2, Mb=False))


def foo_conv_tas_net():
    x = th.rand(4, 1000)
    nnet = ConvTasNet(norm="cLN", causal=False)
    # print(nnet)
    print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    x = nnet(x)
    s1 = x[0]
    print(s1.shape)



if __name__ == "__main__":
    foo_conv_tas_net()
    #foo_conv1d_block()
    #foo_encoder()
    # foo_layernorm()
