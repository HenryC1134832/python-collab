#!/usr/bin/env bash
# echo "\n 0. start align aduio level"
# python tools/align_audio_level.py --inDir /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/mix
# python tools/align_audio_level.py --inDir /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/s1
# python tools/align_audio_level.py --inDir /media/speech70809/Data01/speech_donoiser_new/datasets/ner-humannoise/tt/s2

# echo "\n 1. start generate .scp"

# sh gen_scp.sh /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/mix /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# sh gen_scp.sh /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/s1 /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp
# sh gen_scp.sh /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/s2 /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/spk2.scp


# echo "\n 2. denoise test dataset"
# cd /media/speech70809/Data01/speech_donoiser_new/main
# python nnet/separate_new.py /media/speech70809/Data02/MS_SL3_split_256channelWise_w4_16batch_models --input /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp --gpu 0 --fs 16000 --dump-dir /media/speech70809/Data02/MS_SL3_split_256channelWise_w4_16batch_models/channel256_SL3_tt

#******************************************************************************
echo "\n 3. create denoised list spk1.scp"
cd /media/speech70809/Data01/speech_donoiser_new/main
sh gen_scp.sh /media/speech70809/Data02/MS_SL3_split_256channelWise_w4_16batch_models/channel256_SL3_tt/spk1 /media/speech70809/Data02/MS_SL3_split_256channelWise_w4_16batch_models/channel256_SL3_tt/target_clean.scp
sh gen_scp.sh /media/speech70809/Data02/MS_SL3_split_256channelWise_w4_16batch_models/channel256_SL3_tt/spk2 /media/speech70809/Data02/MS_SL3_split_256channelWise_w4_16batch_models/channel256_SL3_tt/target_noise.scp


#*************************************************
echo "\n 4. compute Si-SDR"

                                                                                                                                                                                                            
cd /media/speech70809/Data01/speech_donoiser_new/main
python nnet/compute_si_snr.py /media/speech70809/Data02/MS_SL3_split_256channelWise_w4_16batch_models/channel256_SL3_tt/target_clean.scp /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp  /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp 


#*******************************************************************
