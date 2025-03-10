#!/usr/bin/env bash

# echo 'SNR calculation for non-slice model(MS-TCN1)'
# python main/nnet/compute_si_snr.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL1_saved_models_New/tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# echo 'SNR calculation for slice-based model (MS-TCN3)'
# python main/nnet/compute_si_snr.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# echo 'SNR calculation for channelwise non-slice model(CWM-TCN1)'
# python main/nnet/compute_si_snr.py /media/denoiser/Toshibha-3.0TB/MS_SL1_Channel_Based_Slice_New/tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# echo 'SNR calculation for channelwise non-slice model (CWM-TCN3) '
# python main/nnet/compute_si_snr.py /media/denoiser/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice_New/tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp


echo 'SNR calculation for channelwise non-slice model (CWM-TCN3) '
python main/nnet/compute_si_snr.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/MS_SL2_Fusion_chw/target.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp              