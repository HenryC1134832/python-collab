#!/usr/bin/env bash


# data generate for noise.csv file using musan, chime4, wham and dns dataset
python getDNSaudiosetCsv.py --noisedir /media/kaldi/D/speech_donoiser_new/datasets/noise/
python getDNSfreesoundCsv.py --noisedir /media/kaldi/D/speech_donoiser_new/datasets/noise --csvdir /media/kaldi/D/speech_donoiser_new/datasets
sh gen_noise_csv.sh /media/kaldi/D/speech_donoiser_new/datasets/noise.csv
python train_test_split.py --noise /media/kaldi/D/speech_donoiser_new/datasets/noise.csv


#data generate for qut.csv file using qut dataset
sh gen_new_noise_csv.sh /media/kaldi/D/speech_donoiser_new/datasets/qut_noise.csv