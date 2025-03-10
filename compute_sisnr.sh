#!/usr/bin/env bash

saperatefolder=$1
datasetfolder=$2

echo $saperatefolder
echo $datasetfolder

# echo "\n 4. compute  Si-SNR"

# echo "\n total \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result/target.scp $datasetfolder/tt/spk1.scp $datasetfolder/tt/mix.scp


# echo "\n bird \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_bird/target.scp $datasetfolder/birdtt/spk1.scp $datasetfolder/birdtt/mix.scp


# echo "\n door \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_door/target.scp $datasetfolder/doortt/spk1.scp $datasetfolder/doortt/mix.scp

# echo "\n  drum \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_drum/target.scp $datasetfolder/drumtt/spk1.scp $datasetfolder/drumtt/mix.scp

# echo "\n fan \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_fan/target.scp $datasetfolder/fantt/spk1.scp $datasetfolder/fantt/mix.scp

# echo "\n fowl \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_fowl/target.scp $datasetfolder/fowltt/spk1.scp $datasetfolder/fowltt/mix.scp

# echo "\n guitar \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_guitar/target.scp /$datasetfolder/guitartt/spk1.scp $datasetfolder/guitartt/mix.scp

# echo "\n music \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_music/target.scp $datasetfolder/musictt/spk1.scp $datasetfolder/musictt/mix.scp

# echo "\n squeak \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_squeak/target.scp $datasetfolder/squeaktt/spk1.scp $datasetfolder/squeaktt/mix.scp

# echo "\n typing \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_typing/target.scp $datasetfolder/typingtt/spk1.scp $datasetfolder/typingtt/mix.scp

# echo "\n vehicle \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_vehicle/target.scp $datasetfolder/vehiclett/spk1.scp $datasetfolder/vehiclett/mix.scp

# echo "\n QUT \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_QUT/target.scp $datasetfolder/QUTtt/spk1.scp $datasetfolder/QUTtt/mix.scp

# echo "\n QUTCAFE \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_QUTCAFE/target.scp $datasetfolder/QUTCAFEtt/spk1.scp $datasetfolder/QUTCAFEtt/mix.scp

# echo "\n QUTCAR \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_QUTCAR/target.scp $datasetfolder/QUTCARtt/spk1.scp $datasetfolder/QUTCARtt/mix.scp

# echo "\n QUTHOME \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_QUTHOME/target.scp $datasetfolder/QUTHOMEtt/spk1.scp $datasetfolder/QUTHOMEtt/mix.scp

# echo "\n QUTREVERB \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_QUTREVERB/target.scp $datasetfolder/QUTREVERBtt/spk1.scp $datasetfolder/QUTREVERBtt/mix.scp

# echo "\n QUTSTREET \n"
# python main/nnet/compute_si_snr.py $saperatefolder/result_QUTSTREET/target.scp $datasetfolder/QUTSTREETtt/spk1.scp $datasetfolder/QUTSTREETtt/mix.scp

# echo 'SNR calculation for non-slice model(MS-TCN1)'
# python main/nnet/compute_si_snr.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL1_saved_models_New/tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# echo 'SNR calculation for slice-based model (MS-TCN3)'
# python main/nnet/compute_si_snr.py /media/denoiser/Toshibha-3.0TB/MS_R1_SL3_saved_models_New/tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# echo 'SNR calculation for channelwise non-slice model(CWM-TCN1)'
# python main/nnet/compute_si_snr.py /media/denoiser/Toshibha-3.0TB/MS_SL1_Channel_Based_Slice_New/tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp
# echo 'SNR calculation for channelwise non-slice model (CWM-TCN3) '
# python main/nnet/compute_si_snr.py /media/denoiser/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice_New/tt/target_clean.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp


echo 'SNR calculation for channelwise non-slice model (CWM-TCN3) '
python main/nnet/compute_si_snr.py /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BPF-2/target.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/spk1.scp /media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/mix.scp