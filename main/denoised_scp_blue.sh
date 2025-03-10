!/usr/bin/env bash

echo 'target test dataset tr' 
sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tr/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tr/mix.scp
sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tr/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tr/spk1.scp
sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tr/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tr/spk2.scp
echo 'target test dataset cv'
sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/cv/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/cv/mix.scp
sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/cv/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/cv/spk1.scp
sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/cv/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/cv/spk2.scp
echo 'target test dataset tt'
sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tt/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tt/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp
sh gen_scp.sh /media/denoise/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tt/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/tt/spk2.scp
# echo 'SCP file gererate for 3dB'
# echo 'target test dataset BUS' 
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/spk2.scp
# echo 'target test dataset PED'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_03/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_03/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_03/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_03/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_03/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_03/spk2.scp
# echo 'target test dataset STR'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_03/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_03/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_03/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_03/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_03/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_03/spk2.scp
# echo 'target test dataset QUTSTREET'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_03/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_03/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_03/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_03/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_03/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_03/spk2.scp
# echo 'target test dataset QUTREVERB'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_03/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_03/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_03/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_03/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_033/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_03/spk2.scp
# echo 'target test dataset QUTHOME'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_03/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_03/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_03/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_03/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_03/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_03/spk2.scp
# echo 'target test dataset QUTCAR'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/spk2.scp
# echo 'target test dataset QUTCAFE'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_03/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_03/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_03/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_03/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_03/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_03/spk2.scp

# echo '******************************************************************'
# echo 'SCP file gererate for 6dB'
# echo 'target test dataset BUS' 
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/spk2.scp
# echo 'target test dataset PED'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/spk2.scp
# echo 'target test dataset STR'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/spk2.scp
# echo 'target test dataset QUTSTREET'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/spk2.scp
# echo 'target test dataset QUTREVERB'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_06/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_06/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_06/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_06/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_063/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_06/spk2.scp
# echo 'target test dataset QUTHOME'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/spk2.scp
# echo 'target test dataset QUTCAR'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/spk2.scp
# echo 'target test dataset QUTCAFE'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/spk2.scp



                                                                    
# echo '******************************************************************'
# echo 'SCP file gererate for 12dB'
# echo 'target test dataset BUS' 
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/spk2.scp
# echo 'target test dataset PED'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/spk2.scp
# echo 'target test dataset STR'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/spk2.scp
# echo 'target test dataset QUTSTREET'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/spk2.scp
# echo 'target test dataset QUTREVERB'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_12/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_12/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_12/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_12/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_123/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_12/spk2.scp
# echo 'target test dataset QUTHOME'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/spk2.scp
# echo 'target test dataset QUTCAR'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/spk2.scp
# echo 'target test dataset QUTCAFE'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/spk2.scp



# echo '******************************************************************'
# echo 'SCP file gererate for -3dB'
# echo 'target test dataset BUS_Vol3' 
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/spk2.scp
# echo 'target test dataset PED_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/spk2.scp
# echo 'target test dataset STR_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/spk2.scp
# echo 'target test dataset QUTSTREET_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/spk2.scp
# echo 'target test dataset QUTREVERB_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/spk2.scp
# echo 'target test dataset QUTHOME_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/spk2.scp
# echo 'target test dataset QUTCAR_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/spk2.scp
# echo 'target test dataset QUTCAFE_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/spk2.scp




# echo '******************************************************************'
# echo 'SCP file gererate for -6dB'
# echo 'target test dataset BUS_Vol3' 
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/spk2.scp
# echo 'target test dataset PED_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-6dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-6dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-6dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-6dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-6dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-6dB/spk2.scp
# echo 'target test dataset STR_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-6dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-6dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-6dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-6dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-6dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-6dB/spk2.scp
# echo 'target test dataset QUTSTREET_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/spk2.scp
# echo 'target test dataset QUTREVERB_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/spk2.scp
# echo 'target test dataset QUTHOME_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-6dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-6dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-6dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-6dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-6dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-6dB/spk2.scp
# echo 'target test dataset QUTCAR_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-6dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-6dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-6dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-6dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-6dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-6dB/spk2.scp
# echo 'target test dataset QUTCAFE_Vol3'
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/mix /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/mix.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/s1 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/spk1.scp
# sh gen_scp.sh /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/s2 /media/denoiser/Toshiba-4TB/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/spk2.scp
