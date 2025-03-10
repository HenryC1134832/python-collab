# !/usr/bin/env bash
echo '************************************************************************************************************'		
echo ' Start for 3dB'		
echo '************************************************************************************************************'
echo 'target_noise test dataset BUS' 
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_03/BUStt_03_tt/spk2     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_03/BUStt_03_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_03/BUStt_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_03/BUStt_03_tt/target_noise.scp
echo 'target_noise test dataset PED'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_03/PEDtt_03_tt/spk2    /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_03/PEDtt_03_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_03/PEDtt_03_tt/spk1      /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_03/PEDtt_03_tt/target_noise.scp
# echo 'target_noise test dataset CAF'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_03/CAFtt_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_03/CAFtt_03_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_03/CAFtt_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_03/CAFtt_03_tt/target_noise.scp
echo 'target_noise test dataset STR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_03/STRtt_03_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_03/STRtt_03_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_03/STRtt_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_03/STRtt_03_tt/target_noise.scp
# echo 'target_noise test dataset QUT'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_03/QUTttnew_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_03/QUTttnew_03_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_03/QUTttnew_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_03/QUTttnew_03_tt/target_noise.scp
echo 'target_noise test dataset QUTSTREET'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_03/QUTSTREETttnew_03_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_03/QUTSTREETttnew_03_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_03/QUTSTREETttnew_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_03/QUTSTREETttnew_03_tt/target_noise.scp
echo 'target_noise test dataset QUTREVERB'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_03/QUTREVERBttnew_03_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_03/QUTREVERBttnew_03_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_03/QUTREVERBttnew_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_03/QUTREVERBttnew_03_tt/target_noise.scp
echo 'target_noise test dataset QUTHOME'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_03/QUTHOMEttnew_03_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_03/QUTHOMEttnew_03_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_03/QUTHOMEttnew_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_03/QUTHOMEttnew_03_tt/target_noise.scp
echo 'target_noise test dataset QUTCAR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/target_noise.scp
echo 'target_noise test dataset QUTCAFE'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_03/QUTCAFEttnew_03_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_03/QUTCAFEttnew_03_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_03/QUTCAFEttnew_03_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_03/QUTCAFEttnew_03_tt/target_noise.scp
echo 'denoising testing dataset finished'

echo '************************************************************************************************************'		
echo ' Start for 6dB'		
echo '************************************************************************************************************'
echo 'target_noise test dataset BUS' 
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_06/BUStt_06_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_06/BUStt_06_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_06/BUStt_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_06/BUStt_06_tt/target_noise.scp
echo 'target_noise test dataset PED'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_06/PEDtt_06_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_06/PEDtt_06_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_06/PEDtt_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_06/PEDtt_06_tt/target_noise.scp
# echo 'target_noise test dataset CAF'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_06/CAFtt_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_06/CAFtt_06_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_06/CAFtt_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_06/CAFtt_06_tt/target_noise.scp
echo 'target_noise test dataset STR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_06/STRtt_06_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_06/STRtt_06_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_06/STRtt_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_06/STRtt_06_tt/target_noise.scp
# echo 'target_noise test dataset QUT'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_06/QUTttnew_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_06/QUTttnew_06_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_06/QUTttnew_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_06/QUTttnew_06_tt/target_noise.scp
echo 'target_noise test dataset QUTSTREET'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt/target_noise.scp
echo 'target_noise test dataset QUTREVERB'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt/target_noise.scp
echo 'target_noise test dataset QUTHOME'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt/target_noise.scp
echo 'target_noise test dataset QUTCAR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt/target_noise.scp
echo 'target_noise test dataset QUTCAFE'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt/target_noise.scp
echo 'denoising testing dataset finished'
echo '************************************************************************************************************'		
echo ' Start for 12dB'		
echo '************************************************************************************************************'
echo 'target_noise test dataset BUS' 
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_12/BUStt_12_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_12/BUStt_12_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_12/BUStt_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS/BUStt_12/BUStt_12_tt/target_noise.scp
echo 'target_noise test dataset PED'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_12/PEDtt_12_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_12/PEDtt_12_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_12/PEDtt_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED/PEDtt_12/PEDtt_12_tt/target_noise.scp
# echo 'target_noise test dataset CAF'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_12/CAFtt_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_12/CAFtt_12_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_12/CAFtt_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF/CAFtt_12/CAFtt_12_tt/target_noise.scp
echo 'target_noise test dataset STR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_12/STRtt_12_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_12/STRtt_12_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_12/STRtt_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR/STRtt_12/STRtt_12_tt/target_noise.scp
# echo 'target_noise test dataset QUT'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_12/QUTttnew_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_12/QUTttnew_12_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_12/QUTttnew_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT/QUTttnew_12/QUTttnew_12_tt/target_noise.scp
echo 'target_noise test dataset QUTSTREET'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt/target_noise.scp
echo 'target_noise test dataset QUTREVERB'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt/target_noise.scp
echo 'target_noise test dataset QUTHOME'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt/target_noise.scp
echo 'target_noise test dataset QUTCAR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt/target_noise.scp
echo 'target_noise test dataset QUTCAFE'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt/target_noise.scp
echo 'denoising testing dataset finished'
echo '************************************************************************************************************'		
echo ' Start for -3dB'		
echo '************************************************************************************************************'
echo 'target_noise test dataset BUS' 
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/target_noise.scp
echo 'target_noise test dataset PED'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt/target_noise.scp
# echo 'target_noise test dataset CAF'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF_Vol3/CAFtt_-3dB/CAFtt_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF_Vol3/CAFtt_-3dB/CAFtt_-3dB_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF_Vol3/CAFtt_-3dB/CAFtt_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF_Vol3/CAFtt_-3dB/CAFtt_-3dB_tt/target_noise.scp
echo 'target_noise test dataset STR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt/target_noise.scp
# echo 'target_noise test dataset QUT'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT_Vol3/QUTttnew_-3dB/QUTttnew_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT_Vol3/QUTttnew_-3dB/QUTttnew_-3dB_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT_Vol3/QUTttnew_-3dB/QUTttnew_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT_Vol3/QUTttnew_-3dB/QUTttnew_-3dB_tt/target_noise.scp
echo 'target_noise test dataset QUTSTREET'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt/target_noise.scp
echo 'target_noise test dataset QUTREVERB'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt/target_noise.scp
echo 'target_noise test dataset QUTHOME'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt/target_noise.scp
echo 'target_noise test dataset QUTCAR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt/target_noise.scp
echo 'target_noise test dataset QUTCAFE'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt/target_noise.scp
echo 'denoising testing dataset finished'





echo '************************************************************************************************************'		
echo 'Start for -6dB'		
echo '************************************************************************************************************'
echo 'target_noise test dataset BUS' 
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-6dB/BUStt_-6dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-6dB/BUStt_-6dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-6dB/BUStt_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/BUS_Vol3/BUStt_-6dB/BUStt_-6dB_tt/target_noise.scp
echo 'target_noise test dataset PED'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-6dB/PEDtt_-6dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-6dB/PEDtt_-6dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-6dB/PEDtt_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/PED_Vol3/PEDtt_-6dB/PEDtt_-6dB_tt/target_noise.scp
# echo 'target_noise test dataset CAF'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF_Vol3/CAFtt_-6dB/CAFtt_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF_Vol3/CAFtt_-6dB/CAFtt_-6dB_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF_Vol3/CAFtt_-6dB/CAFtt_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/CAF_Vol3/CAFtt_-6dB/CAFtt_-6dB_tt/target_noise.scp
echo 'target_noise test dataset STR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-6dB/STRtt_-6dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-6dB/STRtt_-6dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-6dB/STRtt_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/STR_Vol3/STRtt_-6dB/STRtt_-6dB_tt/target_noise.scp
# echo 'target_noise test dataset QUT'
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT_Vol3/QUTttnew_-6dB/QUTttnew_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT_Vol3/QUTttnew_-6dB/QUTttnew_-6dB_tt/target_clean.scp
# sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT_Vol3/QUTttnew_-6dB/QUTttnew_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUT_Vol3/QUTttnew_-6dB/QUTttnew_-6dB_tt/target_noise.scp
echo 'target_noise test dataset QUTSTREET'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/QUTSTREETttnew_-6dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/QUTSTREETttnew_-6dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/QUTSTREETttnew_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/QUTSTREETttnew_-6dB_tt/target_noise.scp
echo 'target_noise test dataset QUTREVERB'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/QUTREVERBttnew_-6dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/QUTREVERBttnew_-6dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/QUTREVERBttnew_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/QUTREVERBttnew_-6dB_tt/target_noise.scp
echo 'target_noise test dataset QUTHOME'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-6dB/QUTHOMEttnew_-6dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-6dB/QUTHOMEttnew_-6dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-6dB/QUTHOMEttnew_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTHOME_Vol3/QUTHOMEttnew_-6dB/QUTHOMEttnew_-6dB_tt/target_noise.scp
echo 'target_noise test dataset QUTCAR'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-6dB/QUTCARttnew_-6dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-6dB/QUTCARttnew_-6dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-6dB/QUTCARttnew_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAR_Vol3/QUTCARttnew_-6dB/QUTCARttnew_-6dB_tt/target_noise.scp
echo 'target_noise test dataset QUTCAFE'
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/QUTCAFEttnew_-6dB_tt/spk2   /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/QUTCAFEttnew_-6dB_tt/target_clean.scp
sh gen_scp.sh  /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/QUTCAFEttnew_-6dB_tt/spk1     /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/CHM_FS_SC4/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/QUTCAFEttnew_-6dB_tt/target_noise.scp
echo 'denoising testing dataset finished'

# sh gen_scp.sh /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/Far_Eastern_Hosp/Dataset_16k /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/Far_Eastern_Hosp/Dataset_16k.scp

