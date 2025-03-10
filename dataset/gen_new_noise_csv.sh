#!/usr/bin/env bash

noise_file=$1
echo $noise_file
if [ -f $noise_file ]; then
    echo 'rm existed '$noise_file
    rm  $noise_file
fi

echo 'generate QUT-NOISE list'
sh gen_noisefiles.sh $noise_file CAFE /media/kaldi/D/speech_donoiser_new/datasets/QUT-NOISE/QUT-NOISE/CAFE
sh gen_noisefiles.sh $noise_file CAR /media/kaldi/D/speech_donoiser_new/datasets/QUT-NOISE/QUT-NOISE/CAR
sh gen_noisefiles.sh $noise_file HOME /media/kaldi/D/speech_donoiser_new/datasets/QUT-NOISE/QUT-NOISE/HOME
sh gen_noisefiles.sh $noise_file REVERB /media/kaldi/D/speech_donoiser_new/datasets/QUT-NOISE/QUT-NOISE/REVERB
sh gen_noisefiles.sh $noise_file STREET /media/kaldi/D/speech_donoiser_new/datasets/QUT-NOISE/QUT-NOISE/STREET
