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


class Conv1DBlock(nn.Module):
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
                 causal=False):
        super(Conv1DBlock, self).__init__()
        # 1x1 conv nxBxT -> nXHXT
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
        #1x1 conv skip-connection
        self.skip_out = nn.Conv1d(conv_channels, Sc, 1, bias=True)
        # different padding way
        self.causal = causal
        self.dconv_pad = dconv_pad

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
        skip = self.skip_out(y)
        x = x + out

        return skip, x

#*********************************************************************************************************************
class ConvTasNet(nn.Module):
    '''
       ConvTasNet module
       N	Number of ﬁlters in autoencoder
       L	Length of the ﬁlters (in samples)
       B	Number of channels in bottleneck and the residual paths’ 1 × 1-conv blocks
       Sc	Number of channels in skip-connection paths’ 1 × 1-conv blocks
       H	Number of channels in convolutional blocks
       P	Kernel size in convolutional blocks
       X	Number of convolutional blocks in each repeat
       R	Number of repeats
    '''

    def __init__(self,
                 N=512,
                 L=16,
                 B=128,
                 H=512,
                 P=3,
                 X=8,
                 R=3,
                 norm="gln",
                 num_spks=2,
                 activate="relu",
                 causal=False):
        super(ConvTasNet, self).__init__()
        # n x 1 x T => n x N x T
        self.encoder = Conv1D(1, N, L, stride=L // 2, padding=0)
        # n x N x T  Layer Normalization of Separation
        self.LayerN_S = build_norm('cln', N)
        # n x B x T  Conv 1 x 1 of  Separation
        self.BottleN_S = Conv1D(N, B, 1)
        # Separation block
        # n x B x T => n x B x T
        self.separation = self._Sequential_repeat(
            R, X, in_channels=B, out_channels=H, kernel_size=P, norm=norm, causal=causal)
        # n x B x T => n x 2*N x T
        self.gen_masks = Conv1D(B, num_spks*N, 1)
        # n x N x T => n x 1 x L
        self.decoder = ConvTrans1D(N, 1, L, stride=L//2)
        # activation function
        active_f = {
            'relu': nn.ReLU(),
            'sigmoid': nn.Sigmoid(),
            'softmax': nn.Softmax(dim=0)
        }
        self.activation_type = activate
        self.activation = active_f[activate]
        self.num_spks = num_spks

    def _Sequential_block(self, num_blocks, **block_kwargs):
        '''
           Sequential 1-D Conv Block
           input:
                 num_block: how many blocks in every repeats
                 **block_kwargs: parameters of Conv1D_Block
        '''
        Conv1D_Block_lists = [Conv1DBlock(
            **block_kwargs, dilation=(2**i)) for i in range(num_blocks)]

        return nn.Sequential(*Conv1D_Block_lists)

    def _Sequential_repeat(self, num_repeats, num_blocks, **block_kwargs):
        '''
           Sequential repeats
           input:
                 num_repeats: Number of repeats
                 num_blocks: Number of block in every repeats
                 **block_kwargs: parameters of Conv1D_Block
        '''
        repeats_lists = [self._Sequential_block(
            num_blocks, **block_kwargs) for i in range(num_repeats)]
        return nn.Sequential(*repeats_lists)

    def forward(self, x):
        if x.dim() >= 3:
            raise RuntimeError(
                "{} accept 1/2D tensor as input, but got {:d}".format(
                    self.__name__, x.dim()))
        if x.dim() == 1:
            x = th.unsqueeze(x, 0)
        # x: n x 1 x L => n x N x T
        w = self.encoder(x)
        # n x N x L => n x B x L
        e = self.LayerN_S(w)
        e = self.BottleN_S(e)
        # n x B x L => n x B x L
        e = self.separation(e)
        # n x B x L => n x num_spk*N x L
        m = self.gen_masks(e)
        # n x N x L x num_spks
        m = th.chunk(m, chunks=self.num_spks, dim=1)
        # num_spks x n x N x L
        m = self.activation(th.stack(m, dim=0))
        d = [w*m[i] for i in range(self.num_spks)]
        # decoder part num_spks x n x L
        s = [self.decoder(d[i], squeeze=True) for i in range(self.num_spks)]
        return s
#*********************************************************************************************************************

# class ConvTasNet(nn.Module):
#     def __init__(self,
#                  L=16,
#                  N=512,
#                  X=8,
#                  R=3,
#                  B=128,
#                  Sc=128,
#                  H=512,
#                  P=3,
#                  norm="cLN",
#                  num_spks=2,
#                  non_linear="sigmoid",
#                  causal=False):
#         super(ConvTasNet, self).__init__()
#         supported_nonlinear = {
#             "relu": F.relu,
#             "sigmoid": th.sigmoid,
#             "softmax": F.softmax
#         }
#         if non_linear not in supported_nonlinear:
#             raise RuntimeError("Unsupported non-linear function: {}",
#                                format(non_linear))
#         self.non_linear_type = non_linear
#         self.non_linear = supported_nonlinear[non_linear]
#         # n x S => n x N x T, S = 4s*8000 = 32000
#         self.encoder_1d = Conv1D(1, N, L, stride=L // 2, padding=0)
#         # keep T not change
#         # T = int((xlen - L) / (L // 2)) + 1
#         # before repeat blocks, always cLN
#         self.ln = ChannelWiseLayerNorm(N)
#         # n x N x T => n x B x T
#         self.proj = Conv1D(N, B, 1)
#         # repeat blocks
#         # n x B x T => n x B x T
#         self.repeats = self._build_repeats(
#             R,
#             X,
#             Sc=Sc,
#             in_channels=B,
#             conv_channels=H,
#             kernel_size=P,
#             norm=norm,
#             causal=causal)
#         self.PRelu = nn.PReLU()
#         # output 1x1 conv
#         # n x B x T => n x N x T
#         # NOTE: using ModuleList not python list
#         # self.conv1x1_2 = th.nn.ModuleList(
#         #     [Conv1D(B, N, 1) for _ in range(num_spks)])
#         # n x Sc x T => n x 2N x T
#         self.mask = Conv1D(Sc, num_spks * N, 1)
#         # using ConvTrans1D: n x N x T => n x 1 x To
#         # To = (T - 1) * L // 2 + L
#         self.decoder_1d = ConvTrans1D(
#             N, 1, kernel_size=L, stride=L // 2, bias=True)
#         self.num_spks = num_spks
#         self.R = R #numbers of repeat
#         self.X = X #numbers of Conv1Dblock in each repeat

#     def _build_blocks(self, num_blocks, **block_kwargs):
#         """
#         Build Conv1D block
#         """
#         blocks = [
#             Conv1DBlock(**block_kwargs, dilation=(2**b))
#             for b in range(num_blocks)
#         ]
#         return nn.Sequential(*blocks)

#     def _build_repeats(self, num_repeats, num_blocks, **block_kwargs):
#         """
#         Build Conv1D block repeats
#         """
#         repeats = [
#             self._build_blocks(num_blocks, **block_kwargs)
#             for r in range(num_repeats)
#         ]
#         return nn.Sequential(*repeats)

#     def forward(self, x):
#         if x.dim() >= 3:
#             raise RuntimeError(
#                 "{} accept 1/2D tensor as input, but got {:d}".format(
#                     self.__name__, x.dim()))
#         # when inference, only one utt
#         if x.dim() == 1:
#             x = th.unsqueeze(x, 0)
#         #encoder
#         # n x 1 x S => n x N x T
#         w = F.relu(self.encoder_1d(x))
        
#         #Seperation
#         #   LayerNorm & 1X1 Conv
#         # n x B x T
#         y = self.proj(self.ln(w))
        
#         #TCN
#         # n x B x T
#         skip_connection = 0
#         for i in range(self.R):
#             for j in range(self.X):
#                 skip, y = self.repeats[i][j](y)
#                 skip_connection = skip_connection + skip
        
#         y = self.PRelu(skip_connection)
#         # n x 2N x T
#         e = th.chunk(self.mask(y), self.num_spks, 1)
#         # n x N x T
#         if self.non_linear_type == "softmax":
#             m = self.non_linear(th.stack(e, dim=0), dim=0)
#         else:
#             m = self.non_linear(th.stack(e, dim=0))
#         # spks x [n x N x T]
#         s = [w * m[n] for n in range(self.num_spks)]
#         # spks x n x S
#         return [self.decoder_1d(x, squeeze=True) for x in s]
    
    
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
        cpt = th.load('/media/HDD10TB/wthong_DATA/iptcloud_denoiser/MS_R1_SL1_saved_models/48.pt.tar')
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
    
    
    
    
class MS_SL2_split_model(nn.Module):
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
        self.wList = nn.Parameter(th.tensor([0.5+0.001, 0.5-0.001]),requires_grad=True)
        
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
    
    
def foo_MB_ConvTasNet():
    x = th.rand(4, 1000)
    nnet = MB_ConvTasNet(norm="cLN", causal=False)
    print(nnet)
    print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    x = nnet(x)
    s1 = x[0]
    print(s1.shape)

def foo_MS_SL2():
    x = th.rand(4, 1000)
    nnet = MS_SL2_model(norm="cLN", causal=False)
    print(nnet)
    print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    x = nnet(x)
    s1 = x[0]
    print(s1.shape)
    
def SL2_split(**nnet_conf):
    cpt = th.load('/media/HDD10TB/wthong_DATA/iptcloud_denoiser/MS_R1_SL2_TL_AIcenter_saved_models/15.pt.tar')
    nnet=MS_SL2_split_model(**nnet_conf)
    nnet.load_state_dict(cpt["model_state_dict"],strict=False)
    return nnet

if __name__ == "__main__":
    # foo_MB_ConvTasNet()
    #foo_conv_tas_net()
    #foo_conv1d_block()
    #foo_layernorm()
    foo_MS_SL2()
    # cpt = th.load('/media/HDD10TB/wthong_DATA/iptcloud_denoiser/MS_R1_SL2_TL_AIcenter_saved_models/48.pt.tar')
    # nnet=MS_SL2_split_model()
    # nnet.load_state_dict(cpt["model_state_dict"],strict=False)
    # x = th.rand(4, 1000)
    # print(nnet)
    # print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    # x = nnet(x)
    # s1 = x[0]
    # print(s1.shape)
