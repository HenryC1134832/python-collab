#!/usr/bin/env bash
echo 'PESQ calculation for BUS' 
python nnet/compute_pesq.py /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/MS_SL3_splite_fusion_expo_group/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1.scp
echo 'PESQ calculation finished for BUS'

echo 'PESQ calculation for PED'
python nnet/compute_pesq.py /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_-3dB/MS_SL3_splite_fusion_expo_group/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_-3dB/s1.scp
echo 'PESQ calculation finished for PED'

echo 'PESQ calculation for STR'
python nnet/compute_pesq.py /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_-3dB/MS_SL3_splite_fusion_expo_group/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_-3dB/s1.scp
echo 'PESQ calculation finished for STR'

echo 'PESQ calculation for QUTSTREET'
python nnet/compute_pesq.py  /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_-3dB/MS_SL3_splite_fusion_expo_group/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_-3dB/s1.scp 
echo 'PESQ calculation finished for QUTSTREET'

echo 'PESQ calculation for QUTREVERB'
python nnet/compute_pesq.py /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_-3dB/MS_SL3_splite_fusion_expo_group/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_-3dB/s1.scp  
echo 'PESQ calculation finished for QUTREVERB'

echo 'PESQ calculation for QUTHOME'
python nnet/compute_pesq.py /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_-3dB/MS_SL3_splite_fusion_expo_group/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_-3dB/s1.scp 
echo 'PESQ calculation finished for QUTHOME'

echo 'PESQ calculation for QUTCAR'
python nnet/compute_pesq.py /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_-3dB/MS_SL3_splite_fusion_expo_group/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_-3dB/s1.scp 
echo 'PESQ calculation finished for QUTCAR'

echo 'PESQ calculation for QUTCAFE'
python nnet/compute_pesq.py /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_-3dB/MS_SL3_splite_fusion_expo_group/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_-3dB/s1.scp
echo 'PESQ calculation finished for QUTCAFE'

