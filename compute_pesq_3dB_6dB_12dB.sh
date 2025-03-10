#!/usr/bin/env bash
echo 'PESQ calculation Start for 3dB'		
echo 'PESQ calculation for BUS'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS/BUStt_03/BUStt_03_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/spk1.scp   
echo 'PESQ calculation finished for BUS'

echo 'PESQ calculation for PED'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED/PEDtt_03/PEDtt_03_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_03/spk1.scp   
echo 'PESQ calculation finished for PED'

echo 'PESQ calculation for STR'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR/STRtt_03/STRtt_03_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_03/spk1.scp   
echo 'PESQ calculation finished for STR'

echo 'PESQ calculation for QUTSTREET'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET/QUTSTREETttnew_03/QUTSTREETttnew_03_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_03/spk1.scp   
echo 'PESQ calculation finished for QUTSTREET'

echo 'PESQ calculation for QUTREVERB'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB/QUTREVERBttnew_03/QUTREVERBttnew_03_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_03/spk1.scp   
echo 'PESQ calculation finished for QUTREVERB'

echo 'PESQ calculation for QUTHOME'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME/QUTHOMEttnew_03/QUTHOMEttnew_03_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_03/spk1.scp   
echo 'PESQ calculation finished for QUTHOME'

echo 'PESQ calculation for QUTCAR'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/spk1.scp   
echo 'PESQ calculation finished for QUTCAR'

echo 'PESQ calculation for QUTCAFE'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE/QUTCAFEttnew_03/QUTCAFEttnew_03_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_03/spk1.scp   
echo 'PESQ calculation finished for QUTCAFE'

echo '************************************************************************************************************'		
echo 'PESQ calculation Start for 6dB'		
echo '************************************************************************************************************'		
echo 'PESQ calculation for BUS'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS/BUStt_06/BUStt_06_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/spk1.scp   
echo 'PESQ calculation finished for BUS'

echo 'PESQ calculation for PED'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED/PEDtt_06/PEDtt_06_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/spk1.scp   
echo 'PESQ calculation finished for PED'

echo 'PESQ calculation for STR'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR/STRtt_06/STRtt_06_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/spk1.scp   
echo 'PESQ calculation finished for STR'

echo 'PESQ calculation for QUTSTREET'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/spk1.scp   
echo 'PESQ calculation finished for QUTSTREET'

echo 'PESQ calculation for QUTREVERB'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_06/spk1.scp   
echo 'PESQ calculation finished for QUTREVERB'

echo 'PESQ calculation for QUTHOME'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/spk1.scp   
echo 'PESQ calculation finished for QUTHOME'

echo 'PESQ calculation for QUTCAR'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/spk1.scp   
echo 'PESQ calculation finished for QUTCAR'

echo 'PESQ calculation for QUTCAFE'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/spk1.scp   
echo 'PESQ calculation finished for QUTCAFE'

echo '************************************************************************************************************'		
echo 'PESQ calculation Start for 12dB'		
echo '************************************************************************************************************'		
echo 'PESQ calculation for BUS'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS/BUStt_12/BUStt_12_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/spk1.scp   
echo 'PESQ calculation finished for BUS'

echo 'PESQ calculation for PED'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED/PEDtt_12/PEDtt_12_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/spk1.scp   
echo 'PESQ calculation finished for PED'

echo 'PESQ calculation for STR'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR/STRtt_12/STRtt_12_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/spk1.scp   
echo 'PESQ calculation finished for STR'

echo 'PESQ calculation for QUTSTREET'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/spk1.scp   
echo 'PESQ calculation finished for QUTSTREET'

echo 'PESQ calculation for QUTREVERB'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_12/spk1.scp   
echo 'PESQ calculation finished for QUTREVERB'

echo 'PESQ calculation for QUTHOME'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/spk1.scp   
echo 'PESQ calculation finished for QUTHOME'

echo 'PESQ calculation for QUTCAR'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/spk1.scp   
echo 'PESQ calculation finished for QUTCAR'

echo 'PESQ calculation for QUTCAFE'		
python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt/target_clean.scp   /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/spk1.scp   
echo 'PESQ calculation finished for QUTCAFE'

# echo '************************************************************************************************************'		
# echo 'PESQ calculation Start for -3dB'		
# echo '************************************************************************************************************'	
# echo 'PESQ calculation for BUS' 
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1.scp   
# echo 'PESQ calculation finished for BUS'

# echo 'PESQ calculation for PED'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/spk1.scp    
# echo 'PESQ calculation finished for PED'

# echo 'PESQ calculation for STR'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/spk1.scp    
# echo 'PESQ calculation finished for STR'

# echo 'PESQ calculation for QUTSTREET'
# python main/nnet/compute_pesq.py  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/spk1.scp    
# echo 'PESQ calculation finished for QUTSTREET'

# echo 'PESQ calculation for QUTREVERB'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/spk1.scp     
# echo 'PESQ calculation finished for QUTREVERB'

# echo 'PESQ calculation for QUTHOME'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/spk1.scp    
# echo 'PESQ calculation finished for QUTHOME'

# echo 'PESQ calculation for QUTCAR'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/spk1.scp    
# echo 'PESQ calculation finished for QUTCAR'

# echo 'PESQ calculation for QUTCAFE'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt/target_clean.scp     /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/spk1.scp   
# echo 'PESQ calculation finished for QUTCAFE'

# echo '************************************************************************************************************'		
# echo 'PESQ calculation Start for -6dB'		
# echo '************************************************************************************************************'	
# echo 'PESQ calculation for BUS' 
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS_Vol3/BUStt_-6dB/BUStt_-6dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/s1.scp   
# echo 'PESQ calculation finished for BUS'

# echo 'PESQ calculation for PED'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED_Vol3/PEDtt_-6dB/PEDtt_-6dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-6dB/spk1.scp    
# echo 'PESQ calculation finished for PED'

# echo 'PESQ calculation for STR'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR_Vol3/STRtt_-6dB/STRtt_-6dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-6dB/spk1.scp    
# echo 'PESQ calculation finished for STR'

# echo 'PESQ calculation for QUTSTREET'
# python main/nnet/compute_pesq.py  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/QUTSTREETttnew_-6dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/spk1.scp    
# echo 'PESQ calculation finished for QUTSTREET'

# echo 'PESQ calculation for QUTREVERB'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/QUTREVERBttnew_-6dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/spk1.scp     
# echo 'PESQ calculation finished for QUTREVERB'

# echo 'PESQ calculation for QUTHOME'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME_Vol3/QUTHOMEttnew_-6dB/QUTHOMEttnew_-6dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-6dB/spk1.scp    
# echo 'PESQ calculation finished for QUTHOME'

# echo 'PESQ calculation for QUTCAR'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR_Vol3/QUTCARttnew_-6dB/QUTCARttnew_-6dB_tt/target_clean.scp    /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-6dB/spk1.scp    
# echo 'PESQ calculation finished for QUTCAR'

# echo 'PESQ calculation for QUTCAFE'
# python main/nnet/compute_pesq.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/QUTCAFEttnew_-6dB_tt/target_clean.scp     /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/spk1.scp   
# echo 'PESQ calculation finished for QUTCAFE'
