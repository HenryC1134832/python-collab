#!/usr/bin/env bash

python /media/denoiser/Toshiba-4TB/speech_donoiser_new/main/nnet/trainnew_jeffri.py --gpus 0 --epochs 50 --checkpoint /media/denoiser/Toshiba-4TB/dataset_jeffri/model_SC_CHM_test --batch-size 4 --num-workers 0 --resume  /media/denoiser/Toshibha-3.0TB1/model_SC_CHM_Fusion4/best.pt.tar