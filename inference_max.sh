echo "start"


echo "\n 0. Inference"
#***************************************************************
# python tools/align_audio_level.py --inDir /media/lab70809/Data01/speech_donoiser_new/datasets/ner-300hr/tt/mix

# python tools/align_audio_level.py --inDir /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix_add
# python tools/align_audio_level.py --inDir /media/speech70809/Data01/speech_donoiser_new/datasets/ner-machinenoise300hr/tr/s1
# python tools/align_audio_level.py --inDir /media/speech70809/Data01/speech_donoiser_new/datasets/ner-machinenoise300hr/tr/s2




#***********************************************************************
echo "\n 1. create input.scp"

# sh gen_scp.sh /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/max_data_-30dB/mix /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/max_data_-30dB/mix.scp

echo "\n . create denoised list spk1.scp"
# sh gen_scp.sh /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/max_data_-30dB/s1 /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/max_data_-30dB/s1.scp

#*****************************************************************
echo "\n 2. denoise test dataset"
python nnet/separate_new.py /media/denoiser/Toshibha-3.0TB/MS_SL1_mulit_attention_test_head16 --input /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/max_data/2time_3db_mix.scp --gpu 0 --fs 16000 --dump-dir /media/denoiser/Toshibha-3.0TB/MS_SL1_mulit_attention_test_head16/2time_3db

#*************************************************************************************
echo "\n 3. create target list target.scp"
sh gen_scp.sh /media/denoiser/Toshibha-3.0TB/MS_SL1_mulit_attention_test_head16/2time_3db/spk2 /media/denoiser/Toshibha-3.0TB/MS_SL1_mulit_attention_test_head16/2time_3db/target.scp

#*************************************************
# echo "\n 4. compute Si-SDR"

nnet/compute_si_snr.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/max_data/2time_3db_s1.scp /media/denoiser/Toshibha-3.0TB/MS_SL1_mulit_attention_test_head16/2time_3db/target.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/max_data/2time_3db_mix.scp




# #*******************************************************************

# nnet/compute_si_snr.py /media/denoiser/Toshibha-3.0TB/ai_MS_SL2_only_attention_saved_models/target.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt_max_ori/s1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt_max_ori/mix.scp






