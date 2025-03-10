from collections import namedtuple
import json
from pathlib import Path
import math
import os
import sys
from matplotlib.pyplot import get

import torchaudio
from torch.nn import functional as F

#from .dsp import convert_audio

Info = namedtuple("Info", ["length", "sample_rate", "channels"])


def get_info(path):
    info = torchaudio.info(path)
    if hasattr(info, 'num_frames'):
        # new version of torchaudio
        return Info(info.num_frames, info.sample_rate, info.num_channels)
    else:
        siginfo = info[0]
        return Info(siginfo.length // siginfo.channels, siginfo.rate, siginfo.channels)


path1 = "/media/kaldi/D/Ted_kaldi/Paper_information/addn/noisy_data/Train/"
# path1 = "/media/kaldi/D/speech_donoiser_new/datasets/NER_clean/"
# corr_path = "/media/speech70809/Data01/speech_donoiser_new/datasets/NER_clean_cv_old/CS_20160519_102.wav"
audio_files = []
for files in os.listdir(path1):
    new_path = os.path.join(path1,files)
    audio_files.append(str(new_path))
    
print(len(audio_files))           
get_pathinfo = get_info(audio_files[-1])
print(get_pathinfo)