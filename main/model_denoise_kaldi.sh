#!/usr/bin/env bash
echo 'denoise  kaldi training dataset' 
python nnet/separate_new.py /media/kaldi/Toshibha-3.0TB/MS_SL2_splite_fusion_expo_group --input  /home/kaldi/Desktop/noisy_data/train.scp --gpu 0 --fs 16000 --dump-dir /media/kaldi/D/noisy_data/Train_denoise


echo 'denoise  kaldi evaluation dataset' 
python nnet/separate_new.py /media/kaldi/Toshibha-3.0TB/MS_SL2_splite_fusion_expo_group --input  /home/kaldi/Desktop/noisy_data/Eval.scp --gpu 0 --fs 16000 --dump-dir /media/kaldi/D/noisy_data/Eval_denoise


echo 'denoise  kaldi Testing dataset' 
python nnet/separate_new.py /media/kaldi/Toshibha-3.0TB/MS_SL2_splite_fusion_expo_group --input  /home/kaldi/Desktop/noisy_data/test.scp --gpu 0 --fs 16000 --dump-dir /media/kaldi/D/noisy_data/Test_denoise

echo 'speaker diarization'
python nnet/separate_new.py /media/kaldi/Toshibha-3.0TB/MS_SL2_splite_fusion_expo_group --input /media/kaldi/D/sd_dn_Max.scp --gpu 0 --fs 22050 --dump-dir /media/kaldi/D/noisy_data/sd_dn_Max
# echo 'denoising testing dataset finished'




