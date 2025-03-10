#!/usr/bin/env bash
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/target.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp


echo 'PESQ calculation for BUS' 
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1.scp
echo 'PESQ calculation finished for BUS'

echo 'PESQ calculation for PED'
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/spk1.scp 
echo 'PESQ calculation finished for PED'

echo 'PESQ calculation for STR'
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/spk1.scp 
echo 'PESQ calculation finished for STR'

echo 'PESQ calculation for QUTSTREET'
python main/nnet/compute_pesq.py  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/spk1.scp 
echo 'PESQ calculation finished for QUTSTREET'

echo 'PESQ calculation for QUTREVERB'
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/spk1.scp  
echo 'PESQ calculation finished for QUTREVERB'

echo 'PESQ calculation for QUTHOME'
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/spk1.scp 
echo 'PESQ calculation finished for QUTHOME'

echo 'PESQ calculation for QUTCAR'
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/spk1.scp 
echo 'PESQ calculation finished for QUTCAR'

echo 'PESQ calculation for QUTCAFE'
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt/target_clean.scp  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/spk1.scp
echo 'PESQ calculation finished for QUTCAFE'





#!/usr/bin/env bash
# echo 'stoi calculation for BUS' 
# python main/nnet/compute_stoi.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1.scp
# echo 'stoi calculation finished for BUS'

#echo 'stoi calculation for PED'
#python main/nnet/compute_stoi.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/spk1.scp 
#echo 'stoi calculation finished for PED'
# #!/usr/bin/env bash
# echo 'stoi calculation for BUS' 
# python main/nnet/compute_stoi.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1.scp
# ech
# echo 'stoi calculation for STR'
# python main/nnet/compute_stoi.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/spk1.scp 
# echo 'stoicalculation finished for STR'

# echo 'stoi calculation for QUTSTREET'
# python main/nnet/compute_stoi.py  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/spk1.scp 
# echo 'stoi calculation finished for QUTSTREET'

# echo 'stoi calculation for QUTREVERB'
# python main/nnet/compute_stoi.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/spk1.scp  
# echo 'stoi calculation finished for QUTREVERB'

# echo 'stoi calculation for QUTHOME'
# python main/nnet/compute_stoi.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/spk1.scp 
# echo 'stoi calculation finished for QUTHOME'

# echo 'stoi calculation for QUTCAR'
# python main/nnet/compute_stoi.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/spk1.scp 
# echo 'stoi calculation finished for QUTCAR'

# echo 'stoi calculation for QUTCAFE'
# python main/nnet/compute_stoi.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw_conv/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt/target_clean.scp  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/spk1.scp
# echo 'stoi calculation finished for QUTCAFE'
