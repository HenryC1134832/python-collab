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


Ch_2 = "/media/speech70809/Data01/Test/new_1.wav"
Ch_1 = "/media/speech70809/TOSHIBA_3TB/project/wavs/test/new_1.wav"
# corr_path = "/media/speech70809/Data01/speech_donoiser_new/datasets/NER_clean_cv_old/CS_20160519_102.wav"
# wav_path = os.listdir(path1)
# new_path = new_path = os.path.join(path1,wav_path[0] )


get_pathinfo = get_info(Ch_2)
print("Channel 2: ",get_pathinfo)
get_pathinfo = get_info(Ch_1)
print("Channel12: ",get_pathinfo)

# def find_audio_files(path, exts=[".wav"], progress=True):
#     audio_files = []
#     for root, folders, files in os.walk(path, followlinks=True):
#         for file in files:
#             file = Path(root) / file
#             if file.suffix.lower() in exts:
#                 audio_files.append(str(file.resolve()))
#                 # print(audio_files)
#     meta = []
#     for idx, file in enumerate(audio_files):
#         info = get_info(file)
#         meta.append((file, info.length))
#         if progress:
#             print(format((1 + idx) / len(audio_files), " 3.1%"), end='\r', file=sys.stderr)
#     meta.sort()
#     return meta

# find_audio = find_audio_files(path1)
# print(find_audio)