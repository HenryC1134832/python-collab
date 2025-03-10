!/usr/bin/env bash
echo 'STOI calculation Start for 3dB'		
echo 'STOI calculation for BUS'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_03/BUStt_03_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/spk1.scp
echo 'STOI calculation finished for BUS'
echo 'STOI calculation for PED'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_03/PEDtt_03_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_03/spk1.scp
echo 'STOI calculation finished for PED'
echo 'STOI calculation for STR'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_03/STRtt_03_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_03/spk1.scp
echo 'STOI calculation finished for STR'
echo 'STOI calculation for QUTSTREET'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_03/QUTSTREETttnew_03_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_03/spk1.scp
echo 'STOI calculation finished for QUTSTREET'
echo 'STOI calculation for QUTREVERB'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_03/QUTREVERBttnew_03_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_03/spk1.scp
echo 'STOI calculation finished for QUTREVERB'
echo 'STOI calculation for QUTHOME'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_03/QUTHOMEttnew_03_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_03/spk1.scp
echo 'STOI calculation finished for QUTHOME'
echo 'STOI calculation for QUTCAR'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/spk1.scp
echo 'STOI calculation finished for QUTCAR'
echo 'STOI calculation for QUTCAFE'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_03/QUTCAFEttnew_03_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_03/spk1.scp
echo 'STOI calculation finished for QUTCAFE'
echo '************************************************************************************************************'		
echo 'STOI calculation Start for 6dB'		
echo '************************************************************************************************************'		
echo 'STOI calculation for BUS'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_06/BUStt_06_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/spk1.scp
echo 'STOI calculation finished for BUS'
echo 'STOI calculation for PED'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_06/PEDtt_06_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/spk1.scp
echo 'STOI calculation finished for PED'
echo 'STOI calculation for STR'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_06/STRtt_06_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/spk1.scp
echo 'STOI calculation finished for STR'
echo 'STOI calculation for QUTSTREET'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/spk1.scp
echo 'STOI calculation finished for QUTSTREET'
echo 'STOI calculation for QUTREVERB'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_06/spk1.scp
echo 'STOI calculation finished for QUTREVERB'
echo 'STOI calculation for QUTHOME'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/spk1.scp
echo 'STOI calculation finished for QUTHOME'
echo 'STOI calculation for QUTCAR'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/spk1.scp
echo 'STOI calculation finished for QUTCAR'
echo 'STOI calculation for QUTCAFE'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/spk1.scp
echo 'STOI calculation finished for QUTCAFE'
echo '************************************************************************************************************'		
echo 'STOI calculation Start for 12dB'		
echo '************************************************************************************************************'		
echo 'STOI calculation for BUS'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_12/BUStt_12_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/spk1.scp
echo 'STOI calculation finished for BUS'
echo 'STOI calculation for PED'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_12/PEDtt_12_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/spk1.scp
echo 'STOI calculation finished for PED'
echo 'STOI calculation for STR'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_12/STRtt_12_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/spk1.scp
echo 'STOI calculation finished for STR'
echo 'STOI calculation for QUTSTREET'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/spk1.scp
echo 'STOI calculation finished for QUTSTREET'
echo 'STOI calculation for QUTREVERB'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_12/spk1.scp
echo 'STOI calculation finished for QUTREVERB'
echo 'STOI calculation for QUTHOME'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/spk1.scp
echo 'STOI calculation finished for QUTHOME'
echo 'STOI calculation for QUTCAR'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/spk1.scp
echo 'STOI calculation finished for QUTCAR'
echo 'STOI calculation for QUTCAFE'		
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/spk1.scp
echo 'STOI calculation finished for QUTCAFE'
echo '************************************************************************************************'






echo '************************************************************************************************'
echo 'STOI calculation Start for -3dB'		
echo '************************************************************************************************'
echo 'STOI calculation for BUS'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/spk1.scp
echo 'STOI calculation finished for BUS'

echo 'STOI calculation for PED'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/spk1.scp 
echo 'STOI calculation finished for PED'

echo 'STOI calculation for STR'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/spk1.scp 
echo 'STOI calculation finished for STR'

echo 'STOI calculation for QUTSTREET'
python main/nnet/compute_stoi.py  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/spk1.scp 
echo 'STOI calculation finished for QUTSTREET'

echo 'STOI calculation for QUTREVERB'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/spk1.scp  
echo 'STOI calculation finished for QUTREVERB'

echo 'STOI calculation for QUTHOME'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/spk1.scp 
echo 'STOI calculation finished for QUTHOME'

echo 'STOI calculation for QUTCAR'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/spk1.scp 
echo 'STOI calculation finished for QUTCAR'

echo 'STOI calculation for QUTCAFE'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt/target_clean.scp  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/spk1.scp
echo 'STOI calculation finished for QUTCAFE'




echo '************************************************************************************************'
echo 'STOI calculation Start for -6dB'		
echo '************************************************************************************************'
echo 'STOI calculation for BUS'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-6dB/BUStt_-6dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/spk1.scp
echo 'STOI calculation finished for BUS'

echo 'STOI calculation for PED'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-6dB/PEDtt_-6dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-6dB/spk1.scp 
echo 'STOI calculation finished for PED'

echo 'STOI calculation for STR'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-6dB/STRtt_-6dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-6dB/spk1.scp 
echo 'STOI calculation finished for STR'

echo 'STOI calculation for QUTSTREET'
python main/nnet/compute_stoi.py  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/QUTSTREETttnew_-6dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/spk1.scp 
echo 'STOI calculation finished for QUTSTREET'

echo 'STOI calculation for QUTREVERB'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/QUTREVERBttnew_-6dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/spk1.scp  
echo 'STOI calculation finished for QUTREVERB'

echo 'STOI calculation for QUTHOME'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-6dB/QUTHOMEttnew_-6dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-6dB/spk1.scp 
echo 'STOI calculation finished for QUTHOME'

echo 'STOI calculation for QUTCAR'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-6dB/QUTCARttnew_-6dB_tt/target_clean.scp /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-6dB/spk1.scp 
echo 'STOI calculation finished for QUTCAR'

echo 'STOI calculation for QUTCAFE'
python main/nnet/compute_stoi.py /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/QUTCAFEttnew_-6dB_tt/target_clean.scp  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/spk1.scp
echo 'STOI calculation finished for QUTCAFE'



