#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jul 25 20:08:36 2021

@author: lab70809
"""
import soundfile as sf
import os
import numpy as np
import pandas as pd


def audioread(path, start=0, stop=None):
    '''Function to read audio'''

    path = os.path.abspath(path)
    if not os.path.exists(path):
        raise ValueError("[{}] does not exist!".format(path))
    try:
        audio, sample_rate = sf.read(path, start=start, stop=stop)
    except RuntimeError:  # fix for sph pcm-embedded shortened v2
        print('WARNING: Audio type not supported.\n path name:',path)
        
    if len(audio.shape) > 1: # multi-channel
          
        audio = audio.T
        audio = audio.sum(axis=0)/audio.shape[0]

    return audio, sample_rate

def audiowrite(destpath, audio, sample_rate=16000):
    '''Function to write audio'''

    destpath = os.path.abspath(destpath)
    destdir = os.path.dirname(destpath)

    if not os.path.exists(destdir):
        os.makedirs(destdir)

    sf.write(destpath, audio, sample_rate)
    return



path = pd.read_csv("/media/kaldi/D/speech_donoiser_new/datasets/qut_noise.csv", header=None, names=['type', 'filepath'])

for Path in path["filepath"]:
    audio, rate = audioread(Path)
    
    audio_name = os.path.basename(Path)
    audio_dir = os.path.dirname(Path)
    audio_dir_type_name = os.path.basename(audio_dir)
    audio_dir = os.path.dirname(audio_dir)
    audio_dir_name = os.path.basename(audio_dir)
    audio_dir = os.path.join(audio_dir,audio_dir_name + "_split",audio_dir_type_name)
    
    time = len(audio)//rate
    sample_index = 0
    name_num = 0
    for i in range(1,time//10):
        output_audio = audio[sample_index:i*rate*10]
        sample_index = sample_index + rate*10
        
        #get audio name
        audio_split_name = list(audio_name)
        audio_split_name.insert(-4,"_"+str(name_num))
        audio_split_name = "".join(audio_split_name)
        audio_path = os.path.join(audio_dir,audio_split_name)
        
        audiowrite(audio_path,output_audio,rate)
        name_num = name_num + 1
        
    if time%10 != 0:
        output_audio = audio[sample_index:]
        sample_index = sample_index + i*rate*10
        audio_split_name = list(audio_name)
        audio_split_name.insert(-4,"_"+str(name_num))
        audio_split_name = "".join(audio_split_name)
        audio_path = os.path.join(audio_dir,audio_split_name)
        audiowrite(audio_path,output_audio,rate)
        name_num = name_num + 1
    
    