echo 'model denoising for 3dB'
echo 'denoise test dataset BUS' 
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS/BUStt_03/BUStt_03_tt
echo 'denoise test dataset PED'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_03/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED/PEDtt_03/PEDtt_03_tt
echo 'denoise test dataset STR'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_03/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR/STRtt_03/STRtt_03_tt
echo 'denoise test dataset QUTSTREET'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_03/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET/QUTSTREETttnew_03/QUTSTREETttnew_03_tt
echo 'denoise test dataset QUTREVERB'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_03/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB/QUTREVERBttnew_03/QUTREVERBttnew_03_tt
echo 'denoise test dataset QUTHOME'                                                            
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_03/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME/QUTHOMEttnew_03/QUTHOMEttnew_03_tt
echo 'denoise test dataset QUTCAR'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt
echo 'denoise test dataset QUTCAFE'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_03/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE/QUTCAFEttnew_03/QUTCAFEttnew_03_tt
echo 'denoising testing dataset finished'
echo '************************************************************************************************************'
echo 'model denoising for 6dB'
echo 'denoise test dataset BUS' 
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_06/mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS/BUStt_06/BUStt_06_tt
echo 'denoise test dataset PED'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED/PEDtt_06/PEDtt_06_tt
echo 'denoise test dataset STR'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR/STRtt_06/STRtt_06_tt
echo 'denoise test dataset QUTSTREET'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET/QUTSTREETttnew_06/QUTSTREETttnew_06_tt
echo 'denoise test dataset QUTREVERB'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB/QUTREVERBttnew_06/QUTREVERBttnew_06_tt
echo 'denoise test dataset QUTHOME'                                                            
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME/QUTHOMEttnew_06/QUTHOMEttnew_06_tt
echo 'denoise test dataset QUTCAR'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR/QUTCARttnew_06/QUTCARttnew_06_tt
echo 'denoise test dataset QUTCAFE'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_06/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE/QUTCAFEttnew_06/QUTCAFEttnew_06_tt
echo 'denoising testing dataset finished'
# echo '************************************************************************************************************'
echo 'model denoising for 12dB'
echo 'denoise test dataset BUS' 
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_12/mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS/BUStt_12/BUStt_12_tt
echo 'denoise test dataset PED'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED/PEDtt_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED/PEDtt_12/PEDtt_12_tt
echo 'denoise test dataset STR'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR/STRtt_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR/STRtt_12/STRtt_12_tt
echo 'denoise test dataset QUTSTREET'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET/QUTSTREETttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET/QUTSTREETttnew_12/QUTSTREETttnew_12_tt
echo 'denoise test dataset QUTREVERB'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB/QUTREVERBttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB/QUTREVERBttnew_12/QUTREVERBttnew_12_tt
echo 'denoise test dataset QUTHOME'                                                            
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME/QUTHOMEttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME/QUTHOMEttnew_12/QUTHOMEttnew_12_tt
echo 'denoise test dataset QUTCAR'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR/QUTCARttnew_12/QUTCARttnew_12_tt
echo 'denoise test dataset QUTCAFE'
python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE/QUTCAFEttnew_12/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE/QUTCAFEttnew_12/QUTCAFEttnew_12_tt
echo 'denoising testing dataset finished'
# echo '************************************************************************************************************'
# echo 'model denoising for -3dB'
# echo 'denoise test dataset BUS' 
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt
# echo 'denoise test dataset PED'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt
# echo 'denoise test dataset STR'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt
# echo 'denoise test dataset QUTSTREET'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt
# echo 'denoise test dataset QUTREVERB'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt
# echo 'denoise test dataset QUTHOME'                                                            
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt
# echo 'denoise test dataset QUTCAR'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt
# echo 'denoise test dataset QUTCAFE'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt
# echo 'denoising testing dataset finished'
# echo '************************************************************************************************************'

# echo 'model denoising for -6dB'
# echo 'denoise test dataset BUS' 
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/BUS_Vol3/BUStt_-6dB/BUStt_-6dB_tt
# echo 'denoise test dataset PED'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-6dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/PED_Vol3/PEDtt_-6dB/PEDtt_-6dB_tt
# echo 'denoise test dataset STR'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-6dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/STR_Vol3/STRtt_-6dB/STRtt_-6dB_tt
# echo 'denoise test dataset QUTSTREET'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTSTREET_Vol3/QUTSTREETttnew_-6dB/QUTSTREETttnew_-6dB_tt
# echo 'denoise test dataset QUTREVERB'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTREVERB_Vol3/QUTREVERBttnew_-6dB/QUTREVERBttnew_-6dB_tt
# echo 'denoise test dataset QUTHOME'                                                            
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-6dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTHOME_Vol3/QUTHOMEttnew_-6dB/QUTHOMEttnew_-6dB_tt
# echo 'denoise test dataset QUTCAR'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-6dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAR_Vol3/QUTCARttnew_-6dB/QUTCARttnew_-6dB_tt
# echo 'denoise test dataset QUTCAFE'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/mix.scp --gpu 0 --fs 16000 --dump-dir  /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH/QUTCAFE_Vol3/QUTCAFEttnew_-6dB/QUTCAFEttnew_-6dB_tt
# echo 'denoising testing dataset finished'



# echo 'Speech Denoiseing of Far Eastern Hospital'
# python nnet/separate_blue.py /media/denoiser/Toshibha-3.0TB/MS_SL2_BPF_CH --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_BPF_CH