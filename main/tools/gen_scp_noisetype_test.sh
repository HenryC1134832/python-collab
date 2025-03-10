#!/usr/bin/env bash

# /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr=1
# gen_scpfolder=2
# gen_scp(){
#     if [ -d 2 ]; then
#         if [ -f 3 ]; then
#             rm 3
#         fi
#         sh 1/gen_scp.sh 2 3
#     fi
# }


echo 'start generate .scp in tt'
# if [ -d /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix ]; then
#     if [ -f /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp ]; then
#         rm /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
#     fi
#     sh /asr_denoiser/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# fi
# sh /asr_denoiser/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# sh /asr_denoiser/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/spk2.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/spk2.scp

#echo 'start generate .scp in birdtt'
# if [ -d /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix ]; then
#     if [ -f /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp ]; then
#         rm /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
#     fi
#     sh /asr_denoiser/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# fi
# sh /asr_denoiser/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# sh /asr_denoiser/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/tt/spk2.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/birdtt/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/birdtt/mix.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/birdtt/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/birdtt/spk1.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/birdtt/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/birdtt/spk2.scp

#echo 'start generate .scp in doortt'
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/doortt/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/doortt/mix.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/doortt/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/doortt/spk1.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/doortt/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/doortt/spk2.scp

#echo 'start generate .scp in drumtt'
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/drumtt/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/drumtt/mix.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/drumtt/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/drumtt/spk1.scp
#sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/drumtt/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/drumtt/spk2.scp



# echo 'start generate .scp in CAFtt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/CAF_Vol3/CAFtt_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/CAF_Vol3/CAFtt_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/CAF_Vol3/CAFtt_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/CAF_Vol3/CAFtt_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/CAF_Vol3/CAFtt_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/CAF_Vol3/CAFtt_-3dB/spk2.scp

# echo 'start generate .scp in PEDtt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/spk2.scp

# echo 'start generate .scp in STRtt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/spk2.scp

# echo 'start generate .scp in BUStt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/spk2.scp


# echo 'start generate .scp in kaldi train, eval and test'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /home/kaldi/Desktop/noisy_data/Eval /home/kaldi/Desktop/noisy_data/Eval.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /home/kaldi/Desktop/noisy_data/Test /home/kaldi/Desktop/noisy_data/test.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /home/kaldi/Desktop/noisy_data/Train /home/kaldi/Desktop/noisy_data/train.scp

echo 'start generate .scp in kaldi train, eval and test'
sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/sp_dn_MAX /media/kaldi/D/sd_dn_Max.scp


# echo 'start generate .scp in QUTtt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUT/QUTttnew_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUT/QUTttnew_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUT/QUTttnew_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUT/QUTttnew_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUT/QUTttnew_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUT/QUTttnew_-3dB/spk2.scp

# echo 'start generate .scp in QUTSTREETtt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/spk2.scp

# echo 'start generate .scp in QUTREVERBtt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/spk2.scp

# echo 'start generate .scp in QUTHOMEtt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/spk2.scp

# echo 'start generate .scp in QUTCARtt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/spk2.scp

# echo 'start generate .scp in QUTCAFEtt'
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/mix /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/mix.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/s1 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/spk1.scp
# sh /media/kaldi/D/speech_donoiser_new/main/gen_scp.sh /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/s2 /media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/spk2.scp
