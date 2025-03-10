
echo 'stoi calculation for BUS' 
python nnet/compute_stoi.py /media/speechsever/Toshibha-3.0TB/MS_SL2_Channel_Based_Slice_New/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1.scp
echo 'stoi calculation finished for BUS'

echo 'stoi calculation for PED'
python nnet/compute_stoi.py /media/speechsever/Toshibha-3.0TB/MS_SL2_Channel_Based_Slice_New/PED_Vol3/PEDtt_-3dB/PEDtt_-3dB_tt/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/PED_Vol3/PEDtt_-3dB/spk1.scp 
echo 'stoi calculation finished for PED'

echo 'stoi calculation for STR'
python nnet/compute_stoi.py /media/speechsever/Toshibha-3.0TB/MS_SL2_Channel_Based_Slice_New/STR_Vol3/STRtt_-3dB/STRtt_-3dB_tt/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/STR_Vol3/STRtt_-3dB/spk1.scp 
echo 'stoi calculation finished for STR'

echo 'stoi calculation for QUTSTREET'
python nnet/compute_stoi.py  /media/speechsever/Toshibha-3.0TB/MS_SL2_Channel_Based_Slice_New/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/QUTSTREETttnew_-3dB_tt/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTSTREET_Vol3/QUTSTREETttnew_-3dB/spk1.scp 
echo 'stoi calculation finished for QUTSTREET'

echo 'stoi calculation for QUTREVERB'
python nnet/compute_stoi.py /media/speechsever/Toshibha-3.0TB/MS_SL2_Channel_Based_Slice_New/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/QUTREVERBttnew_-3dB_tt/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTREVERB_Vol3/QUTREVERBttnew_-3dB/spk1.scp  
echo 'stoi calculation finished for QUTREVERB'

echo 'stoi calculation for QUTHOME'
python nnet/compute_stoi.py /media/speechsever/Toshibha-3.0TB/MS_SL2_Channel_Based_Slice_New/QUTHOME_Vol3/QUTHOMEttnew_-3dB/QUTHOMEttnew_-3dB_tt/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTHOME_Vol3/QUTHOMEttnew_-3dB/spk1.scp 
echo 'stoi calculation finished for QUTHOME'

echo 'stoi calculation for QUTCAR'
python nnet/compute_stoi.py /media/speechsever/Toshibha-3.0TB/MS_SL2_Channel_Based_Slice_New/QUTCAR_Vol3/QUTCARttnew_-3dB/QUTCARttnew_-3dB_tt/target_clean.scp /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAR_Vol3/QUTCARttnew_-3dB/spk1.scp 
echo 'stoi calculation finished for QUTCAR'

echo 'stoi calculation for QUTCAFE'
python nnet/compute_stoi.py /media/speechsever/Toshibha-3.0TB/MS_SL2_Channel_Based_Slice_New/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/QUTCAFEttnew_-3dB_tt/target_clean.scp  /media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/QUTCAFE_Vol3/QUTCAFEttnew_-3dB/spk1.scp
echo 'stoi calculation finished for QUTCAFE'
