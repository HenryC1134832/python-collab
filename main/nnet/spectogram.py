#import the pyplot and wavfile modules 

import matplotlib.pyplot as plot

from scipy.io import wavfile

 

# Read the wav file (mono)

# samplingFrequency, signalData = wavfile.read('y.wav')

samplingFrequency, mix_speech = wavfile.read('/media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/mix/CX_20160429_004_aligned_BGD_150204_020_BUS.CH2_snr-3_fileid_64.wav')
# print(samplingFrequency)
# print(mix_speech)
# print(len(mix_speech))
samplingFrequency, clean_speech = wavfile.read('/media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1/CX_20160429_004_aligned_BGD_150204_020_BUS.CH2_snr-3_fileid_64.wav')
# samplingFrequency, SL1_enhanced_speech = wavfile.read('/media/kaldi/D/speech_donoiser_new/spectogram_scl_paper/bus_ms_sl1/CX_20160429_001_aligned_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr-3_fileid_482.wav')
# samplingFrequency, SL2_enhanced_speech = wavfile.read('/media/speech70809/新增磁碟區/dB_model_backup_data_MS_SL1_SL2/MS_SL2_R1_03dB_06dB_12dB/BUS/BUStt_03/BUStt_03_tt/spk2/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav')
# samplingFrequency, SL3_enhanced_speech = wavfile.read('/media/kaldi/D/speech_donoiser_new/spectogram_scl_paper/bus_ms_sl3/CX_20160429_001_aligned_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr-3_fileid_482.wav')
# samplingFrequency, CH_SL1_enhanced_speech = wavfile.read('/media/kaldi/D/speech_donoiser_new/spectogram_scl_paper/bus_ch_cl1/CX_20160429_001_aligned_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr-3_fileid_482.wav')
# samplingFrequency, CH_SL2_enhanced_speech = wavfile.read('/media/speech70809/新增磁碟區/dB_model_backup_data_MS_SL1_SL2/MS_SL2_split_256channelWise_w4_16batch_models/BUS/BUStt_03/BUStt_03_tt/spk1/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav')
samplingFrequency, CH_SL3_enhanced_speech = wavfile.read('/media/denoiser/Toshibha-3.0TB/MS_SL3_Channel_Based_Slice_New_20230328/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/spk1/CX_20160429_004_aligned_BGD_150204_020_BUS.CH2_snr-3_fileid_64.wav')
#Mahzoon Code
#samplingFrequency, mix_speech = wavfile.read('/media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/mix/CX_20160429_006_aligned_BGD_150204_020_BUS.CH2_snr-3_fileid_1704.wav')
print(samplingFrequency)
print(mix_speech)
print(len(mix_speech))
#samplingFrequency, clean_speech = wavfile.read('/media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/s1/CX_20160429_006_aligned_BGD_150204_020_BUS.CH2_snr-3_fileid_1704.wav')
# samplingFrequency, TCN1_FT_enhanced_speech = wavfile.read('/media/speech70809/TOSHIBA_3TB1/TCN1-FT/SpectogramAudiofiles/TCN1-FT/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav')
# samplingFrequency, TCN2_FT_enhanced_speech = wavfile.read('/media/speech70809/TOSHIBA_3TB1/TCN1-FT/SpectogramAudiofiles/TCN2-FT/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav')
# # samplingFrequency, SL3_enhanced_speech = wavfile.read('/media/speech70809/TOSHIBA_3TB/MS_R1_SL3_saved_models/BUS/BUStt_03/BUStt_03_tt/spk2/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav')
# samplingFrequency, CH_SL1_enhanced_speech = wavfile.read('/media/speech70809/TOSHIBA_3TB/MS_SL1_split_256channelWise_w4_16batch_models/BUS/BUStt_03/BUStt_03_tt/spk1/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav')
# samplingFrequency, CH_SL2_enhanced_speech = wavfile.read('/media/speech70809/新增磁碟區/dB_model_backup_data_MS_SL1_SL2/MS_SL2_split_256channelWise_w4_16batch_models/BUS/BUStt_03/BUStt_03_tt/spk1/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav')
#Mahzoon Code end
plot.subplot(211)
plot.specgram(mix_speech,Fs=samplingFrequency)
plot.title("(a) Noisy Speech")
plot.xlim(0, 5)
plot.xlabel('Time (s)')
plot.ylabel('Frequency (Hz)')
plot.savefig("noisy_speech.pdf", format="pdf", bbox_inches="tight")
plot.show()

plot.subplot(211)
plot.specgram(clean_speech,Fs=samplingFrequency)
plot.title("(b) Clean Speech ")
plot.xlim(0, 5)
plot.xlabel('Time (s)')
plot.ylabel('Frequency  (Hz)')
plot.savefig("clean_speech.pdf", format="pdf", bbox_inches="tight")
plot.show()

# *****************************************************************************
# plot.subplot(211)
# plot.specgram(SL1_enhanced_speech,Fs=samplingFrequency)
# plot.title(" (c) BASE")
# plot.xlim(0, 5)
# plot.xlabel('Time')
# plot.ylabel('Frequency')
# plot.show()

# plot.subplot(211)
# plot.specgram(SL3_enhanced_speech,Fs=samplingFrequency)
# plot.title("(d) BASE-3")
# plot.xlim(0, 5)
# plot.xlabel('Time')
# plot.ylabel('Frequency')
# plot.show()
# *********************************************************************************


# plot.subplot(211)
# plot.specgram(CH_SL1_enhanced_speech,Fs=samplingFrequency)
# plot.title("(f) Enhanced Speech by CW-TCN")
# plot.xlim(0, 5)
# plot.xlabel('Time')
# plot.ylabel('Frequency')
# plot.show()

plot.subplot(211)
plot.specgram(CH_SL3_enhanced_speech,Fs=samplingFrequency)
plot.title("(c) Enhanced Speech by CWM-TCN3")
plot.xlim(0, 5)
plot.xlabel('Time (s)')
plot.ylabel('Frequency (Hz)')
plot.savefig("Enhanced_Speech.pdf", format="pdf", bbox_inches="tight")
plot.show()


# /***********************************************
# plot.subplot(211)
# plot.specgram(TCN1_FT_enhanced_speech,Fs=samplingFrequency)
# plot.title("(h) Enhanced Speech TCN1-FT")
# plot.xlabel('Time')
# plot.ylabel('Frequency')
# plot.show()


# plot.subplot(211)
# plot.specgram(TCN2_FT_enhanced_speech,Fs=samplingFrequency)
# plot.title("(e) Enhanced Speech TCN2-FT")
# plot.xlabel('Time')
# plot.ylabel('Frequency')
# plot.show()

 

