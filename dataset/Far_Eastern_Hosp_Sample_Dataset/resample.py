# -*- coding: utf-8 -*-
"""
Created on Thu Mar 16 13:54:42 2023

@author: Ted
"""

import librosa
import soundfile as sf
import os 

# os.chdir(r"/media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/Far_Eastern_Hosp_Sample_Dataset")

target_path = r"/media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/Far_Eastern_Dataset_16k"


for wav in os.listdir(target_path):
    target = target_path+"//"+wav
    audio, sr = librosa.load(target, 48000)
    audio_16k = librosa.resample(y=audio, orig_sr=sr, target_sr=16000)
    sf.write(wav, audio_16k, 16000)