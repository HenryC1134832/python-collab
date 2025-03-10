# import librosa
import audio_metadata
import glob
import os
# from os import walk
# from os.path import join
import argparse
import sys
import pyloudnorm as pyln
import soundfile as sf
import shutil

# def parse_csv(csv_path, num_tokens=2):
#     """
#     Parse csv file
#     If num_tokens >= 2, function will check token number
#     """
#     noise_dict = dict()
#     line = 0
#     with open(csv_path, "r") as f:
#         for raw_line in f:
#             noise_tokens = raw_line.strip().split(',')
#             line += 1
#             if num_tokens >= 2 and len(noise_tokens) != num_tokens or len(
#                     noise_tokens) < 2:
#                 raise RuntimeError(
#                     "For {}, format error in line[{:d}]: {}".format(
#                         csv_path, line, raw_line))
#             if num_tokens == 2:
#                 key, value = noise_tokens
#             else:
#                 key, value = noise_tokens[0], noise_tokens[1:]
#             if key in noise_dict:
#                 raise ValueError("Duplicated key \'{0}\' exists in {1}".format(
#                     key, csv_path))
#             if noise_dict[key] == None:
#                 noise_dict[key] = [value]
#             else:
#                 noise_dict[key].append(value)
#     return noise_dict

def main(args):
    if args.recursiveAll:
        files = []
        for root, _, filenames in os.walk(args.dir):
            for f in filenames:
                if f.lower().endswith('.wav'):
                    fullpath = os.path.join(root, f)
                    files.append(fullpath)
    else:
        files = glob.glob(args.dir + '/*.wav')
    durations = 0
    sampleRateCounts = {} #{'8000':0, '16000':0}
    bitRateCounts = {} #{'16':0, '32':0}
    durationMax = 0
    durationMin = sys.float_info.max
    sound_levels = []
    for File in files:
        # duration = librosa.get_duration(filename=file)
        metadata = audio_metadata.load(File)
        duration = metadata.streaminfo['duration']
        if duration > durationMax:
            durationMax = duration
            durationMaxFile = File
        if duration < durationMin:
            durationMin = duration
            durationMinFile = File
        durations = durations + duration
        sampleRate = metadata.streaminfo['sample_rate']
        sampleRateCounts.setdefault(str(sampleRate), 0)
        sampleRateCounts[str(sampleRate)] = sampleRateCounts[str(sampleRate)] + 1
        if args.srDir:
            fileName = os.path.basename(File)
            if not os.path.isdir(os.path.join(args.srDir, str(sampleRate))):
                os.makedirs(os.path.join(args.srDir, str(sampleRate)))
            shutil.move(File, os.path.join(args.srDir, str(sampleRate), fileName))

        bitRate = metadata.streaminfo['bit_depth']
        bitRateCounts.setdefault(str(bitRate), 0)
        bitRateCounts[str(bitRate)] = bitRateCounts[str(bitRate)] + 1
        if args.getSoundLevel:
            sound, sample_rate = sf.read(File)
            loudness_meter = pyln.Meter(sample_rate)
            sound_level = loudness_meter.integrated_loudness(sound)
            sound_levels.append(sound_level)
        
    print('total files: ', len(files))
    print('total hr: ', durations/3600)
    print('sampleRate: ', sampleRateCounts)
    print('bitRate: ', bitRateCounts)
    print('durationMax(min): ', durationMaxFile, durationMax/60)
    print('dirationMin(min): ', durationMinFile, durationMin/60)
    print('dirationMean(min): ', (durations/len(files))/60)
    if args.getSoundLevel:
        sound_level_avg = sum(sound_levels)/len(sound_levels)
        print('sound level max: ', max(sound_levels))
        print('sound level min: ', min(sound_levels))
        print('sound level avg: ', sound_level_avg)

if __name__ == "__main__":
    parser = argparse.ArgumentParser("noisy data generator")
    parser.add_argument('--dir', type=str, default='/Documents/datasets/cnn-audio-denoiser/zh-TW/clips_train',
                        help='Directory path of clean audio')
    parser.add_argument('--recursiveAll', action='store_true',
                        help='Directory path of clean audio')
    parser.add_argument('--getSoundLevel', action='store_true',
                        help='Directory path of clean audio')
    parser.add_argument('--srDir', type=str, default='',
                        help='Directory path of clean audio')
    args = parser.parse_args()
    print(args)
    main(args)