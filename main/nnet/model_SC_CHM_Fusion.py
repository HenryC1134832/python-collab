from tokenize import group
import torch as th
from torch._C import Size
import torch.nn as nn
# import librosa
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
        print(x)
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
                 groups=16,
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
        # shuflling 
        
        groups= (dilation * (kernel_size - 1)) // 2 if not causal else (
           dilation* (kernel_size - 1))
        # shuflling 
        #outchannl=(conv_channels//groups)
        # shuflled conv
        groupoutchnl=256
        dcon_group_output= groupoutchnl+groupoutchnl
        # shuflled conv
        self.shuffgroupconv=nn.Conv1d(
            conv_channels,
            groupoutchnl,
            kernel_size,
            groups=groups,
            padding=dconv_pad,
            dilation=dilation,
            bias=True)
        # depthwise conv 
        self.tanh1 = nn.Tanh()
        self.dconv = nn.Conv1d(
            conv_channels,
            conv_channels,
            kernel_size,
            groups=conv_channels,
            padding=dconv_pad,
            dilation=dilation,
            bias=True)
        self.shuffgroup=ChannelShuffle(conv_channels,groups)
        self.conv1x1_2 = Conv1D(conv_channels, groupoutchnl, 1)    
        self.sigmoid1 = nn.Sigmoid()   
        #self.conv1x1_2 = Conv1D(dcon_group_output, dcon_group_output, 1)    
        self.prelu2 = nn.PReLU()
        self.lnorm2 = build_norm(norm, groupoutchnl*2)
        # 1x1 conv cross channel
        self.sconv = nn.Conv1d(groupoutchnl*2, in_channels, 1, bias=True)
        #1x1 conv skip-connection
        self.skip_out = nn.Conv1d(groupoutchnl*2, Sc, 1, bias=True)
        self.causal = causal
        self.dconv_pad = dconv_pad






    # def __init__(self,
    #              in_channels=256,
    #              outputchannel=64,
    #              conv_channels=512,
    #              Sc = 512,
    #              kernel_size=3,
    #              dilation=1,
    #              norm="cLN",
    #              causal=False):
    #     super(Conv1DBlock, self).__init__()
    #     # 1x1 conv nxBxT -> nXHXT
    #     self.conv1x1 = Conv1D(in_channels, conv_channels, 1)
    #     self.prelu1 = nn.PReLU()
    #     self.lnorm1 = build_norm(norm, conv_channels)
    #     self.shuffgroup=channel_shuffleforsound()
    #     dconv_pad = (dilation * (kernel_size - 1)) // 2 if not causal else (
    #         dilation * (kernel_size - 1))
    #     # # depthwise conv 
    #     self.dconv = nn.Conv1d(
    #         conv_channels,
    #         outputchannel,
    #         kernel_size,
            
    #         padding=dconv_pad,
    #         dilation=dilation,
    #         groups=16,
    #         bias=True)
    #     self.prelu2 = nn.PReLU()
    #     self.lnorm2 = build_norm(norm, outputchannel)
    #     # 1x1 conv cross channel
    #     self.sconv = nn.Conv1d(outputchannel, in_channels, 1, bias=True)
    #     #1x1 conv skip-connection
    #     self.skip_out = nn.Conv1d(outputchannel, Sc, 1, bias=True)
    #     # different padding way
    #     self.causal = causal
    #     self.dconv_pad = dconv_pad

    def forward(self, x):
        y = self.conv1x1(x)
        
        if __name__ == "__main__":
            print('1D blick after fist 1x1Conv size', y.size())
            
        y = self.lnorm1(self.prelu1(y))
        sh=self.shuffgroup(y)
        shuffcov=self.shuffgroupconv(sh)
        shufftan=self.tanh1(shuffcov)
        shuffsigm=self.sigmoid1(shuffcov)
       
        print("shape after shuffle",sh.size())
        print("shape of shuffle groupe conv",shuffcov.size())
        
        y = self.dconv(y)
        y=self.conv1x1_2(y)
        depsigm=self.sigmoid1(y)
        deptan=self.tanh1(y)
        _x_up=shufftan*depsigm
        _x_down=shuffsigm*deptan
        y = th.cat((_x_up, _x_down), axis=1) # type: ignore
        #y=y+shuffcov
        #x_out = self.Multiply()([x_sigmoid, x_tanh])
       # y = th.cat(( y, shuffcov), axis=1)

        print("shape before 1x1",  y.size())
       # y=self.conv1x1_2(y)
       
       # newArray= self.conv1x1(newArray)
        print("shape after 1x1",  y.size())
        if __name__ == "__main__":
            print('1D Conv block after group cov size', y.size())
        
        if self.causal:
            y = y[:, :, :-self.dconv_pad]
        y = self.lnorm2(self.prelu2(y))
        out = self.sconv(y)
        skip = self.skip_out(y)
        x = x + out

        return skip, x
def channel_shuffle(x,
                    groups):
    """
    Channel shuffle operation from 'ShuffleNet: An Extremely Efficient Convolutional Neural Network for Mobile Devices,'
    https://arxiv.org/abs/1707.01083.
    Parameters:
    ----------
    x : Tensor
        Input tensor.
    groups : int
        Number of groups.
    Returns
    -------
    Tensor
        Resulted tensor.
    """
    batch, channels, height = x.size()
    # assert (channels % groups == 0)
    channels_per_group = channels // groups
    x = x.view(batch, groups, channels_per_group, height)
    x = th.transpose(x, 1, 2).contiguous()
    x = x.view(batch, channels, height)
    return x



class ChannelShuffle(nn.Module):
    """
    Channel shuffle layer. This is a wrapper over the same operation. It is designed to save the number of groups.
    Parameters:
    ----------
    channels : int
        Number of channels.
    groups : int
        Number of groups.
    """


    
    def __init__(self,
                 channels,
                 groups):
        super(ChannelShuffle, self).__init__()
        # assert (channels % groups == 0)
        if channels % groups != 0:
            raise ValueError('channels must be divisible by groups')
        self.groups = groups

    def forward(self, x):
        return channel_shuffleforsound(x, self.groups)





def channel_shuffleforsound(x,
                     groups):
    """
    Channel shuffle operation from 'ShuffleNet: An Extremely Efficient Convolutional Neural Network for Mobile Devices,'
    https://arxiv.org/abs/1707.01083. The alternative version.
    Parameters:
    ----------
    x : Tensor
        Input tensor.
    groups : int
        Number of groups.
    Returns
    -------
    Tensor
        Resulted tensor.
    """
    batch, inchannel, height =x.size()
    channels_per_group = inchannel // groups
    
    print("size of x",x.size())
    # assert (channels % groups == 0)
    
    x = x.view(batch, channels_per_group, groups, height)
    x = th.transpose(x, 1, 2).contiguous()
    x = x.view(batch, inchannel, height)
    return x



def channel_shuffle2(x,
                     groups):
    """
    Channel shuffle operation from 'ShuffleNet: An Extremely Efficient Convolutional Neural Network for Mobile Devices,'
    https://arxiv.org/abs/1707.01083. The alternative version.
    Parameters:
    ----------
    x : Tensor
        Input tensor.
    groups : int
        Number of groups.
    Returns
    -------
    Tensor
        Resulted tensor.
    """
    batch, channels, height = x.size()
    # assert (channels % groups == 0)
    channels_per_group = channels // groups
    x = x.view(batch, channels_per_group, groups, height)
    x = th.transpose(x, 1, 2).contiguous()
    x = x.view(batch, channels, height)
    return x


class ChannelShuffle2(nn.Module):
    """
    Channel shuffle layer. This is a wrapper over the same operation. It is designed to save the number of groups.
    The alternative version.
    Parameters:
    ----------
    channels : int
        Number of channels.
    groups : int
        Number of groups.
    """
    def __init__(self,
                 channels,
                 groups):
        super(ChannelShuffle2, self).__init__()
        # assert (channels % groups == 0)
        if channels % groups != 0:
            raise ValueError('channels must be divisible by groups')
        self.groups = groups

    def forward(self, x):
        return channel_shuffle2(x, self.groups)

class BPFModule(nn.Module):
    def __init__(self, num_channels):
    # def __init__(self, num_channels, CE):
        super().__init__()
        # self.CE = CE
        self.conv_time_cat = nn.Sequential(
            nn.Conv1d(num_channels, num_channels, kernel_size=1),
            nn.BatchNorm1d(num_channels),
            nn.ReLU(),
        )
        self.conv_tifr_cat = nn.Sequential(
            nn.Conv1d(num_channels, num_channels, kernel_size=1),
            nn.BatchNorm1d(num_channels),
            nn.ReLU(),
        )
        self.conv_cat = nn.Sequential(
            nn.Conv1d(num_channels, num_channels, kernel_size=1),
            nn.BatchNorm1d(num_channels),
            nn.ReLU(),
        )
    
    def forward(self, time, tifr):
        time = time
        # time = th.as_tensor(time)
        print(time.shape)
        tifr = tifr
        # tifr = th.as_tensor(tifr)
        print(tifr.shape)
        # f_cube = self.CE.C2E(cube)
        f_cat = th.cat((time, tifr),1)
        # f_equi = f_equi + self.conv_equi_cat(f_cat)
        # f_cube = f_cube + self.conv_cube_cat(f_cat)
        # f_fusion = self.conv_cat(f_cat)

        return  f_cat



#  *******************************************************  



class MS_SL2_split_model(nn.Module):
    def __init__(self,
                 L=16, #length of filters(in sample) 
                 N=512, #Number of filters in Autoencoder
                 X=8, #Number of convolution block in each repeat
                 R=1,#Number of repeats
                 B=256,#Number of channels in bottleneck and residual paths' 1 by 1-conv blocks
                 Sc=256,# number of channels in skip-connection paths' 1 by 1-conv blocks
                 Slice=2,
                 H=512,#Number of channel in convolution blocks
                 P=3, #kernal size in convolution blocks
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
        # self.bpf_module = BPFModule(256)
        self.a =nn.Conv1d(in_channels=N,out_channels=257, kernel_size =1)
        # keep T not change
        # self.a =nn.Conv1d(in_channels=N,out_channels=512, kernel_size =1)
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
        # ----------------------Generating Weight based on channel-----------------
        # -----------------Using in channelwise-------------------------------------
        max = 0.07331312
        min = -0.0814228
        # #create tensor with random values in range (min, max)
        rand_tensor = (max-min)*th.rand((4)) + min
        # #weight for each branch
        # #print("rand_tensor",rand_tensor)
        
        self.wList = nn.Parameter((max-min)*th.rand(4)+min,requires_grad=True) 
        print("rand_tensor",self.wList )
        #self.wList = nn.Parameter(((max-min)*th.rand(4)))
        
        # self.wList = nn.Parameter(th.tensor([0.5+0.001, 0.5-0.001, 0.4+0.001, 0.4-0.001], requires_grad=True))
        
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

    def unfreeze_fusion_core(self):
        """
        解凍 Fusion-Core 相關的參數
        """
        # 凍結所有參數
        for param in self.parameters():
            param.requires_grad = False

        # 解凍 Fusion-Core 的參數
        for slice_block in self.slices:
            for repeat_block in slice_block:
                for conv_block in repeat_block:
                    if hasattr(conv_block, 'shuffgroupconv'):
                        conv_block.shuffgroupconv.weight.requires_grad = True
                        conv_block.shuffgroupconv.bias.requires_grad = True

                    if hasattr(conv_block, 'dconv'):
                        conv_block.dconv.weight.requires_grad = True
                        conv_block.dconv.bias.requires_grad = True

                    if hasattr(conv_block, 'conv1x1_2'):
                        conv_block.conv1x1_2.weight.requires_grad = True
                        conv_block.conv1x1_2.bias.requires_grad = True

                    if hasattr(conv_block, 'shuffgroup'):
                        for param in conv_block.shuffgroup.parameters():
                            param.requires_grad = True

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
            print("Value of x ", x)
        
        #encoder
        # print("Value of x ", x)
        # print("Value of x ", x.shape)
        w = self.encoder_1d(x)
        print('after encoder 1-D size', w.size())
        w = th.unsqueeze(w,2)
        w = th.squeeze(w,2)
        w = w[:, :256, :] 
        print('after stft_tensor N size', w.size())
        out = th.stft(x, n_fft=512, hop_length=8, win_length=64, return_complex=True)
        out = out.real
        print("value of out",out)
        out=out[:, :256, :-2] 
        print('after STFT size', out.size())
        w = th.cat((w,out),1)
        # w = self.bpf_module(w,out)
        print("output shape", w.shape)
       
     
        if __name__ == "__main__":
            print('after encoder size', w.size())
        
        #Seperation
        #   LayerNorm & 1X1 Conv
        # n x B x T
        # ln=self.ln(c)
        # print("layer norm shape",  ln.shape)
        # print("value of layer norm",ln)
        # y = self.proj(w)
        # print("y shape",  y.shape)
        # print("value of y",y)
        # y = self.proj(self.ln(c))
        y = self.proj(self.ln(w))
        if __name__ == "__main__":
            print('after LayerNorm and 1x1 Conv', y.size())
        
        #Slices of TCN
        # n x B x T
        # Search for occurrences of "9999" in the code snippet
    
        skip_into_weight = 0
        skip_into_weight_sum = 0
        skip_connection = 0
        Slice_input = y
        Tcn_into_weight=[]
        Slices_Output=0
        Tcn_output_result=0
        for Slice in range(self.slice):
            print("Value of Slice Number: ",Slice)
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
                         print('finished 1D Conv block ouput size', y.size())
                         print("Weight values",self.wList)
            # print("Skip_connection_size",skip_connection.size())       
            # print("Skip_connection_value",skip_connection)
            # print("weights_value",len(self.wList))
            #for i in range (len(self.wList)): 
                #if a==0:  
                #print("Weight value1", self.wList[i])
                #f = open(filename,'w')
                #print('whatever', file=f)
                # th.skip_into_weight = skip_connection *self.wList[i]
                # th.skip_into_weight_sum=th.skip_into_weight+th.skip_into_weight_sum
            if Slice== 0:
                slic1_into_weight=th.einsum('i,jkl->ijkl', [self.wList, skip_connection])
                Slices_Output=th.einsum('ijkl->jkl', [slic1_into_weight])
                print("Slice 1 output dim",Slices_Output.dim())
            elif Slice == 1:
                slic2_into_weight=th.einsum('i,jkl->ijkl', [self.wList, skip_connection])
                Slice2_row_sum=th.einsum('ijkl->jkl', [slic2_into_weight])
                print("Slice number",slice)
                Slices_Output= th.add(Slices_Output,  Slice2_row_sum)
                print("Slice 2 output dim",Slices_Output.dim())
            else:
                print("Slice number",slice)
                slic3_into_weight=th.einsum('i,jkl->ijkl', [self.wList, skip_connection])
                Slice3_row_sum=th.einsum('ijkl->jkl', [slic3_into_weight])
                Slices_Output= th.add(Slices_Output, Slice3_row_sum)
                print("Slice 3 output dim",Slices_Output.dim())
                #Tcn_into_weight.append(kip_into_weight)
                #print("lenght of skip connection TCN :", len(skip_connection))
                #print("Weight value1 after append ", W_firstResult)
                # th.skip_into_weight=0
                
        #     print("Weight lenght ",len(self.wList))
        #     if __name__ == "__main__":
        #         print('slice weight last', self.wList[Slice-2])
             
            
            skip_connection = 0
            y = Slice_input
        # for i in range(len(Tcn_into_weight)):
        #     Tcn_output_result+=Tcn_into_weight[i]
        #print("TcnResult values", Tcn_output_result)
        #print(" Out put of TcnResult shape", Tcn_output_result.size())
        
        y = self.PRelu(Slices_Output)
        #print("Output of Tcn size after pRelu",y.size())
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





#***********************End
# *****************************************





# ***********************************************

def foo_conv1d_block():
    nnet = Conv1DBlock(256, 512, 3, 20)
    print(param(nnet))


def foo_layernorm():
    C, T = 256, 20
    nnet1 = nn.LayerNorm([C, T], elementwise_affine=True)
    print(param(nnet1, Mb=False))
    nnet2 = nn.LayerNorm([C, T], elementwise_affine=False)
    print(param(nnet2, Mb=False))





def SL2_split():
    x = th.rand(4, 1000)
    nnet = MS_SL2_split_model(norm="cLN", causal=False)
    # print(nnet)
    print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    # x = nnet(x)
    # s1 = x[0]
    # print(s1.shape)

if __name__ == "__main__":
    SL2_split()
  
    # x = th.rand(4,1000)
    # nnet = MS_SL2_split_model(norm="cLN", causal=False)
    # #print("Here is param",(nnet))self.num_trainable_params
    # print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    # x = nnet(x)
   
    # #print("ConvTasNet #param: {:.2f}".format(param(nnet)))
    # print(nnet)
    # s1 = x[0]
    # print(s1.shape)

   #cpt = th.load('/media/lab70809/Mac-pro/Speech_Denoiser/MS_R1_SL2_TL_AIcenter_saved_models/48.pt.tar')
    
    #cpt = th.load('/home/lab70809/Trained_Models_Channel_Wise/MS_SL1_split_256channelWise_w4_16batch_models/best.pt.tar' ,map_location='cuda:0')
    
    # for name, param in cpt.named_parameters():
    #     print('name: ', name)
    #     print(type(param))
    #     print('param.shape: ', param.shape)
    #     print('param.requires_grad: ', param.requires_grad)
    #     print('=====')
    # nnet=MS_SL2_split_model()
    # nnet.load_state_dict(cpt["model_state_dict"],strict=False)
    #x = th.rand(2, 100)
    #x = th.rand(4, 1000)
   
    # for name, param in nnet.named_parameters():
    #     print('name: ', name)
    #     print(type(param))
    #     print('param.shape: ', param.shape)
    #     print('param.value: ', param.shape)
    #     print('param.requires_grad: ', param.requires_grad)
    #     print('=====')
   


   # print("ConvTasNet #param: {:.2f}".format(param(nnet)))
   # print("ConvTasNet #param: {:.2f}".format(param(nnet.wList)))
    #for layer in model.layers: print(layer.get_config(), layer.get_weights())
    # x = nnet(x)
    # s1 = x[0]
    # print(s1.shape)

