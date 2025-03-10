#!/usr/bin/env bash
echo 'model denoising for 3dB'
echo 'denoise test dataset BUS' 
sh gen_scp.sh   /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/BUS/BUStt_03/BUStt_03_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/BUS/BUStt_03/BUStt_03_tt/target.scp
echo 'denoise test dataset PED'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/PED/PEDtt_03/PEDtt_03_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/PED/PEDtt_03/PEDtt_03_tt/target.scp
echo 'denoise test dataset STR'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/STR/STRtt_03/STRtt_03_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/STR/STRtt_03/STRtt_03_tt/target.scp
echo 'denoise test dataset QUTSTREET'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTSTREET/QUTSTREETttnew_03/QUTSTREETttnew_03_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTSTREET/QUTSTREETttnew_03/QUTSTREETttnew_03_tt/target.scp
echo 'denoise test dataset QUTREVERB'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTREVERB/QUTREVERBttnew_03/QUTREVERBttnew_03_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTREVERB/QUTREVERBttnew_03/QUTREVERBttnew_03_tt/target.scp
echo 'denoise test dataset QUTHOME'                                                            
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTHOME/QUTHOMEttnew_03/QUTHOMEttnew_03_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTHOME/QUTHOMEttnew_03/QUTHOMEttnew_03_tt/target.scp
echo 'denoise test dataset QUTCAR'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/target.scp
echo 'denoise test dataset QUTCAFE'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAFE/QUTCAFEttnew_03/QUTCAFEttnew_03_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAFE/QUTCAFEttnew_03/QUTCAFEttnew_03_tt/target.scp
echo 'denoising testing dataset finished'
echo '************************************************************************************************************'
echo 'model denoising for 6dB'
echo 'denoise test dataset BUS' 
sh gen_scp.sh   /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/BUS/BUStt_06/BUStt_06_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/BUS/BUStt_06/BUStt_06_tt/target.scp
echo 'denoise test dataset PED'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/PED/PEDtt_06/PEDtt_06_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/PED/PEDtt_06/PEDtt_06_tt/target.scp
echo 'denoise test dataset STR'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/STR/STRtt_06/STRtt_06_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/STR/STRtt_06/STRtt_06_tt/target.scp
echo 'denoise test dataset QUTSTREET'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt/target.scp
echo 'denoise test dataset QUTREVERB'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt/target.scp
echo 'denoise test dataset QUTHOME'                                                            
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt/target.scp
echo 'denoise test dataset QUTCAR'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt/target.scp
echo 'denoise test dataset QUTCAFE'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt/target.scp
echo 'denoising testing dataset finished' 
echo '************************************************************************************************************'
echo 'model denoising for 12dB'
echo 'denoise test dataset BUS' 
sh gen_scp.sh   /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/BUS/BUStt_12/BUStt_12_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/BUS/BUStt_12/BUStt_12_tt/target.scp
echo 'denoise test dataset PED'
sh gen_scp.sh   /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/PED/PEDtt_12/PEDtt_12_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/PED/PEDtt_12/PEDtt_12_tt/target.scp
echo 'denoise test dataset STR'
sh gen_scp.sh   /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/STR/STRtt_12/STRtt_12_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/STR/STRtt_12/STRtt_12_tt/target.scp
echo 'denoise test dataset QUTSTREET'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt/target.scp
echo 'denoise test dataset QUTREVERB'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt/target.scp
echo 'denoise test dataset QUTHOME'                                                            
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt/target.scp
echo 'denoise test dataset QUTCAR'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt/target.scp
echo 'denoise test dataset QUTCAFE'
sh gen_scp.sh  /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt/spk2 /media/kaldi/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt/target.scp
echo 'denoising testing dataset finished'
echo '************************************************************************************************************'




