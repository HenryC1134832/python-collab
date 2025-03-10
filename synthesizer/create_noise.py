#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jun  2 13:25:20 2022

@author: speech70809
"""
"""
@author: chkarada
"""

# Note that this file picks the clean speech files randomly, so it does not guarantee that all
# source files will be used


import os
import glob
import argparse
import ast
import configparser as CP
from itertools import repeat
import multiprocessing
from multiprocessing import Pool
import random
from random import shuffle
import librosa
import numpy as np
from audiolib import is_clipped, audioread, audiowrite, snr_mixer, activitydetector
import utils
import pandas as pd
import time


PROCESSES = multiprocessing.cpu_count()-1
MAXTRIES = 50
MAXFILELEN = 100

np.random.seed(2)
random.seed(3)

def build_audio(is_clean, params, filenum, audio_samples_length=-1, silence_length = 0.2, fs_output=10, audio_length=10):
    '''Construct an audio signal from source files'''

    # fs_output = params['fs']
    fs_output = fs_output
    #silence_length = params['silence_length']
    silence_length = silence_length
    
    if audio_samples_length == -1:
        # audio_samples_length = int(params['audio_length']*params['fs'])
        audio_samples_length = int(audio_length*fs_output)

    output_audio = np.zeros(0)
    remaining_length = audio_samples_length
    files_used = []
    clipped_files = []

    global clean_counter, noise_counter
    if is_clean:
        source_files = params['cleanfilenames']
        idx_counter = clean_counter
    else:    
        # # source_files = params['noisefilenames']
        # noisedirs = params['noisedirs']
        # noisefiles = params['noisefiles']
        # noisetypes = noisedirs
        # # print('len of noisetypes: ', len(noisetypes))
        # # pick a noise category randomly
        # # idx_n_dir = np.random.randint(0, np.size(noisedirs))
        # idx_n_dir = random.randint(0, len(noisetypes)-1)
        # # print('idx_n_dir: ', idx_n_dir)
        # # print('noisetypes[idx_n_dir]: ', noisetypes[idx_n_dir])
        # selectedType = str(noisetypes[idx_n_dir])
        # # source_files = glob.glob(os.path.join(noisedirs[idx_n_dir], 
        # #                                       params['audioformat']))
        # noisefilesSelected = noisefiles.query('type==@selectedType')
        source_files = np.array(params['noisefilenames'])
        idx_counter = noise_counter

    # initialize silence
    silence = np.zeros(int(fs_output*silence_length))

    # iterate through multiple clips until we have a long enough signal
    tries_left = MAXTRIES
    while remaining_length > 0 and tries_left > 0:

        # read next audio file and resample if necessary
        with idx_counter.get_lock():
            idx_counter.value += 1
            idx = idx_counter.value % np.size(source_files)

        input_audio, fs_input = audioread(source_files[idx])
        if fs_input != fs_output:
            input_audio = librosa.resample(input_audio, fs_input, fs_output)

        # if current file is longer than remaining desired length, and this is
        # noise generation or this is training set, subsample it randomly
        if len(input_audio) > remaining_length and (not is_clean or not params['is_test_set']):
            idx_seg = np.random.randint(0, len(input_audio)-remaining_length)
            input_audio = input_audio[idx_seg:idx_seg+remaining_length]

        # check for clipping, and if found move onto next file
        if is_clipped(input_audio):
            clipped_files.append(source_files[idx])
            tries_left -= 1
            continue

        # concatenate current input audio to output audio stream
        files_used.append(source_files[idx])
        output_audio = np.append(output_audio, input_audio)
        remaining_length -= len(input_audio)

        # add some silence if we have not reached desired audio length
        if remaining_length > 0:
            silence_len = min(remaining_length, len(silence))
            output_audio = np.append(output_audio, silence[:silence_len])
            remaining_length -= silence_len

    if tries_left == 0:
        print("Audio generation failed for filenum " + str(filenum))
        return [], [], clipped_files

    return output_audio, files_used, clipped_files