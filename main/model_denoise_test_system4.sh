#!/usr/bin/env bash


# echo '************************************************************************************************************'
# echo denoiser overall model performance non-slice, multi-slice, channelwisenon slice and multi-slice channelwise
python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_SL2_splite_fusion_expo_group --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_2024_04_01_fusion_expo_group_New

# echo denoiser overall model performance non-slice, multi-slice, channelwisenon slice and multi-slice channelwise
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New

# echo denoiser overall model performance non-slice, multi-slice, channelwisenon slice and multi-slice channelwise
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_SL1_split_256channelWise_w4_16batch_models --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_SL1_Channel_Based_Slice_New

# echo denoiser overall model performance non-slice, multi-slice, channelwisenon slice and multi-slice channelwise
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_SL3_split_256channelWise_w4_16batch_models --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice_New


# echo '************************************************************************************************************'
# denoiser for speaker diarization (Chen)
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/chen_dataset/type_1_snr_3.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/chen_dataset/type_1_snr_3
# echo'finish model denoising'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/chen_dataset/testPoolAll/type_2_snr_3.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/chen_dataset/type_2_snr_3
# echo'finish model denoising'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/chen_dataset/testPoolAll/type_3_snr_3.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/chen_dataset/type_3_snr_3
# echo'finish model denoising'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/chen_dataset/testPoolAll/type_4_snr_3.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/chen_dataset/type_4_snr_3
# echo'finish model denoising'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/chen_dataset/testPoolAll/type_5_snr_3.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/chen_dataset/type_5_snr_3
# echo'finish model denoising'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/chen_dataset/testPoolAll/type_6_snr_3.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/chen_dataset/type_6_snr_3
# echo'finish model denoising'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/chen_dataset/testPoolAll/type_7_snr_3.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/chen_dataset/type_7_snr_3
# echo'finish model denoising'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/chen_dataset/testPoolAll/type_8_snr_3.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/chen_dataset/type_8_snr_3
# echo'finish model denoising'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/chen_dataset/testPoolAll/type_9_snr_3.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/chen_dataset/type_9_snr_3
# echo'finish model denoising'
# echo '************************************************************************************************************'
# echo 'model denoising for -3dB'
# echo 'denoise test dataset BUS' 
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt
# echo 'denoise test dataset PED'                                                                                 
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_SL3_splite_fusion_expo_group_tranferLearning_34Epoch --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_SL3_TCN_Fusion34_Based_new/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt
# echo 'denoise test dataset STR'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt
# echo 'denoise test dataset QUTSTREET'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt
# echo 'denoise test dataset QUTREVERB'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt
# echo 'denoise test dataset QUTHOME'                                                            
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt
# echo 'denoise test dataset QUTCAR'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_test --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_2021/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt_12
# echo 'denoise test dataset QUTCAFE'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt
# echo 'denoising testing dataset finished'
# echo '************************************************************************************************************'
# echo 'model denoising for 6dB'
# echo 'denoise test dataset BUS' 
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input  /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/BUS/BUStt_06/BUStt_06_tt
# echo 'denoise test dataset PED'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/PED/PEDtt_06/PEDtt_06_tt
# echo 'denoise test dataset STR'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/STR/STRtt_06/STRtt_06_tt
# echo 'denoise test dataset QUTSTREET'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt
# echo 'denoise test dataset QUTREVERB'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt
# echo 'denoise test dataset QUTHOME'                                                            
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt
# echo 'denoise test dataset QUTCAR'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt
# echo 'denoise test dataset QUTCAFE'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt
# echo 'denoising testing dataset finished'
# echo '************************************************************************************************************'
# echo 'model denoising for 12dB'
# echo 'denoise test dataset BUS' 
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input  /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/BUS/BUStt_12/BUStt_12_tt
# echo 'denoise test dataset PED'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/PED/PEDtt_12/PEDtt_12_tt
# echo 'denoise test dataset STR'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/STR/STRtt_12/STRtt_12_tt
# echo 'denoise test dataset QUTSTREET'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt
# echo 'denoise test dataset QUTREVERB'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt
# echo 'denoise test dataset QUTHOME'                                                            
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt
# echo 'denoise test dataset QUTCAR'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt
# echo 'denoise test dataset QUTCAFE'
# python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models --input /media/denoiser/Toshibha-3.0TB/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt
# echo 'denoising testing dataset finished'
# echo '************************************************************************************************************'




