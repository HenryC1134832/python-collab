#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug 17 16:30:10 2022

@author: speech70809


"""
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
#from audiolib import is_clipped, audioread, audiowrite, snr_mixer, activitydetector
#import utils
import pandas as pd
import time

PROCESSES = multiprocessing.cpu_count()-1
MAXTRIES = 50
MAXFILELEN = 100
EPS = np.finfo(float).eps
np.random.seed(0)
fs =16000

def is_clipped(audio, clipping_threshold=0.99):
    return any(abs(audio) > clipping_threshold)

def normalize(audio, target_level=-25):
    '''Normalize the signal to the target level'''
    rms = (audio ** 2).mean() ** 0.5
    scalar = 10 ** (target_level / 20) / (rms+EPS)
    audio = audio * scalar
    return audio

def normalize_segmental_rms(audio, rms, target_level=-25):
    '''Normalize the signal to the target level
    based on segmental RMS'''
    scalar = 10 ** (target_level / 20) / (rms+EPS)
    audio = audio * scalar
    return audio

def audioread(path, norm=False, start=0, stop=None, target_level=-25):
    '''Function to read audio'''

    path = os.path.abspath(path)
    if not os.path.exists(path):
        raise ValueError("[{}] does not exist!".format(path))
    try:
        audio, sample_rate = sf.read(path, start=start, stop=stop)
    except RuntimeError:  # fix for sph pcm-embedded shortened v2
        print('WARNING: Audio type not supported')

    if len(audio.shape) == 1:  # mono
        if norm:
            rms = (audio ** 2).mean() ** 0.5
            scalar = 10 ** (target_level / 20) / (rms+EPS)
            audio = audio * scalar
    else:  # multi-channel
        audio = audio.T
        audio = audio.sum(axis=0)/audio.shape[0]
        if norm:
            audio = normalize(audio, target_level)

    return audio, sample_rate


def audiowrite(destpath, audio, sample_rate=16000, norm=False, target_level=-25, \
                clipping_threshold=0.99, clip_test=False):
    '''Function to write audio'''

    if clip_test:
        if is_clipped(audio, clipping_threshold=clipping_threshold):
            raise ValueError("Clipping detected in audiowrite()! " + \
                            destpath + " file not written to disk.")

    if norm:
        audio = normalize(audio, target_level)
        max_amp = max(abs(audio))
        if max_amp >= clipping_threshold:
            audio = audio/max_amp * (clipping_threshold-EPS)

    destpath = os.path.abspath(destpath)
    destdir = os.path.dirname(destpath)

    if not os.path.exists(destdir):
        os.makedirs(destdir)

    sf.write(destpath, audio, sample_rate)
    return


def add_reverb(sasxExe, input_wav, filter_file, output_wav):
    ''' Function to add reverb'''
    command_sasx_apply_reverb = "{0} -r {1} \
        -f {2} -o {3}".format(sasxExe, input_wav, filter_file, output_wav)
                                                               
    subprocess.call(command_sasx_apply_reverb)
    return output_wav


def add_clipping(audio, max_thresh_perc=0.8):
    '''Function to add clipping'''
    threshold = max(abs(audio))*max_thresh_perc
    audioclipped = np.clip(audio, -threshold, threshold)
    return audioclipped


def adsp_filter(Adspvqe, nearEndInput, nearEndOutput, farEndInput):

    command_adsp_clean = "{0} --breakOnErrors 0 --sampleRate 16000 --useEchoCancellation 0 \
                    --operatingMode 2 --useDigitalAgcNearend 0 --useDigitalAgcFarend 0 \
                    --useVirtualAGC 0 --useComfortNoiseGenerator 0 --useAnalogAutomaticGainControl 0 \
                    --useNoiseReduction 0 --loopbackInputFile {1} --farEndInputFile {2} \
                    --nearEndInputFile {3} --nearEndOutputFile {4}".format(Adspvqe,
                                farEndInput, farEndInput, nearEndInput, nearEndOutput)
    subprocess.call(command_adsp_clean)


def snr_mixer(params, clean, noise, snr, target_level=-25, clipping_threshold=0.99):
    '''Function to mix clean speech and noise at various SNR levels'''
    cfg = params['cfg']
    if len(clean) > len(noise):
        noise = np.append(noise, np.zeros(len(clean)-len(noise)))
    else:
        clean = np.append(clean, np.zeros(len(noise)-len(clean)))

    # Normalizing to -25 dB FS
    clean = clean/(max(abs(clean))+EPS)
    clean = normalize(clean, target_level)
    rmsclean = (clean**2).mean()**0.5

    noise = noise/(max(abs(noise))+EPS)
    noise = normalize(noise, target_level)
    rmsnoise = (noise**2).mean()**0.5

    # Set the noise level for a given SNR
    noisescalar = rmsclean / (10**(snr/20)) / (rmsnoise+EPS)
    noisenewlevel = noise * noisescalar

    # Mix noise and clean speech
    noisyspeech = clean + noisenewlevel
    
    # Randomly select RMS value between -15 dBFS and -35 dBFS and normalize noisyspeech with that value
    # There is a chance of clipping that might happen with very less probability, which is not a major issue. 
    if params['target_level_lower']==params['target_level_upper']:
        noisy_rms_level = params['target_level_lower']
    else:
        noisy_rms_level = np.random.randint(params['target_level_lower'], params['target_level_upper'])
    rmsnoisy = (noisyspeech**2).mean()**0.5
    scalarnoisy = 10 ** (noisy_rms_level / 20) / (rmsnoisy+EPS)
    noisyspeech = noisyspeech * scalarnoisy
    clean = clean * scalarnoisy
    noisenewlevel = noisenewlevel * scalarnoisy

    # Final check to see if there are any amplitudes exceeding +/- 1. If so, normalize all the signals accordingly
    if is_clipped(noisyspeech):
        noisyspeech_maxamplevel = max(abs(noisyspeech))/(clipping_threshold-EPS)
        noisyspeech = noisyspeech/noisyspeech_maxamplevel
        clean = clean/noisyspeech_maxamplevel
        noisenewlevel = noisenewlevel/noisyspeech_maxamplevel
        noisy_rms_level = int(20*np.log10(scalarnoisy/noisyspeech_maxamplevel*(rmsnoisy+EPS)))

    return clean, noisenewlevel, noisyspeech, noisy_rms_level


def segmental_snr_mixer(params, clean, noise, snr, target_level=-25, clipping_threshold=0.99):
    '''Function to mix clean speech and noise at various segmental SNR levels'''
    cfg = params['cfg']
    if len(clean) > len(noise):
        noise = np.append(noise, np.zeros(len(clean)-len(noise)))
    else:
        clean = np.append(clean, np.zeros(len(noise)-len(clean)))
    clean = clean/(max(abs(clean))+EPS)
    noise = noise/(max(abs(noise))+EPS)
    rmsclean, rmsnoise = active_rms(clean=clean, noise=noise)
    clean = normalize_segmental_rms(clean, rms=rmsclean, target_level=target_level)
    noise = normalize_segmental_rms(noise, rms=rmsnoise, target_level=target_level)
    # Set the noise level for a given SNR
    noisescalar = rmsclean / (10**(snr/20)) / (rmsnoise+EPS)
    noisenewlevel = noise * noisescalar

    # Mix noise and clean speech
    noisyspeech = clean + noisenewlevel
    # Randomly select RMS value between -15 dBFS and -35 dBFS and normalize noisyspeech with that value
    # There is a chance of clipping that might happen with very less probability, which is not a major issue. 
    noisy_rms_level = np.random.randint(params['target_level_lower'], params['target_level_upper'])
    rmsnoisy = (noisyspeech**2).mean()**0.5
    scalarnoisy = 10 ** (noisy_rms_level / 20) / (rmsnoisy+EPS)
    noisyspeech = noisyspeech * scalarnoisy
    clean = clean * scalarnoisy
    noisenewlevel = noisenewlevel * scalarnoisy
    # Final check to see if there are any amplitudes exceeding +/- 1. If so, normalize all the signals accordingly
    if is_clipped(noisyspeech):
        noisyspeech_maxamplevel = max(abs(noisyspeech))/(clipping_threshold-EPS)
        noisyspeech = noisyspeech/noisyspeech_maxamplevel
        clean = clean/noisyspeech_maxamplevel
        noisenewlevel = noisenewlevel/noisyspeech_maxamplevel
        noisy_rms_level = int(20*np.log10(scalarnoisy/noisyspeech_maxamplevel*(rmsnoisy+EPS)))

    return clean, noisenewlevel, noisyspeech, noisy_rms_level
    

def active_rms(clean, noise, fs=16000, energy_thresh=-50):
    '''Returns the clean and noise RMS of the noise calculated only in the active portions'''
    window_size = 100 # in ms
    window_samples = int(fs*window_size/1000)
    sample_start = 0
    noise_active_segs = []
    clean_active_segs = []

    while sample_start < len(noise):
        sample_end = min(sample_start + window_samples, len(noise))
        noise_win = noise[sample_start:sample_end]
        clean_win = clean[sample_start:sample_end]
        noise_seg_rms = 20*np.log10((noise_win**2).mean()+EPS)
        # Considering frames with energy
        if noise_seg_rms > energy_thresh:
            noise_active_segs = np.append(noise_active_segs, noise_win)
            clean_active_segs = np.append(clean_active_segs, clean_win)
        sample_start += window_samples

    if len(noise_active_segs)!=0:
        noise_rms = (noise_active_segs**2).mean()**0.5
    else:
        noise_rms = EPS
        
    if len(clean_active_segs)!=0:
        clean_rms = (clean_active_segs**2).mean()**0.5
    else:
        clean_rms = EPS

    return clean_rms, noise_rms


def activitydetector(audio, fs=16000, energy_thresh=0.13, target_level=-25):
    '''Return the percentage of the time the audio signal is above an energy threshold'''

    audio = normalize(audio, target_level)
    window_size = 50 # in ms
    window_samples = int(fs*window_size/1000)
    sample_start = 0
    cnt = 0
    prev_energy_prob = 0
    active_frames = 0

    a = -1
    b = 0.2
    alpha_rel = 0.05
    alpha_att = 0.8

    while sample_start < len(audio):
        sample_end = min(sample_start + window_samples, len(audio))
        audio_win = audio[sample_start:sample_end]
        frame_rms = 20*np.log10(sum(audio_win**2)+EPS)
        frame_energy_prob = 1./(1+np.exp(-(a+b*frame_rms)))

        if frame_energy_prob > prev_energy_prob:
            smoothed_energy_prob = frame_energy_prob*alpha_att + prev_energy_prob*(1-alpha_att)
        else:
            smoothed_energy_prob = frame_energy_prob*alpha_rel + prev_energy_prob*(1-alpha_rel)

        if smoothed_energy_prob > energy_thresh:
            active_frames += 1
        prev_energy_prob = frame_energy_prob
        sample_start += window_samples
        cnt += 1

    perc_active = active_frames/cnt
    return perc_active


def build_audio(is_clean, params, filenum, audio_samples_length=-1,silence_length = 0.2,audio_length = 0.6):
    '''Construct an audio signal from source files'''

    fs_output = fs
    silence_length = silence_length
    if audio_samples_length == -1:
        audio_samples_length = int(audio_length*fs)

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



def gen_audio(is_clean, filenum, audio_samples_length=-1, audio_length=10, fs=16000, clean_activity_threshold= 0.6, noise_activity_threshold=0.0):
    '''Calls build_audio() to get an audio signal, and verify that it meets the
       activity threshold'''

    clipped_files = []
    low_activity_files = []
    if audio_samples_length == -1:
        audio_samples_length = int(audio_length*fs)
    if is_clean:
        activity_threshold = clean_activity_threshold
    else:
        activity_threshold = noise_activity_threshold

    while True:
        audio, source_files, new_clipped_files = \
            build_audio(is_clean, params, filenum, audio_samples_length)

        clipped_files += new_clipped_files
        if len(audio) < audio_samples_length:
            continue

        if activity_threshold == 0.0:
            break

        # percactive = activitydetector(audio=audio)
        # if percactive > activity_threshold:
        #     break
        # else:
        #     low_activity_files += source_files

    return audio, source_files, clipped_files, low_activity_files