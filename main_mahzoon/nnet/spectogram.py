import torch
import torchaudio
import requests
import matplotlib.pyplot as plt

# Test music
mix_speech = 'datasets/ner-300hr/BUS/BUStt_03/mix/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav'
noise_speech = 'datasets/ner-300hr/BUS/BUStt_03/s1/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav'
enhance_speech = 'datasets/ner-300hr/MS_SL2_R1/BUS/BUStt_03/BUStt_03_tt/spk2/BW_20171124_020_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr3_fileid_154.wav'
# url = "https://pytorch.org/tutorials//_static/img/steam-train-whistle-daniel_simon-converted-from-mp3.wav"
# r = requests.get(url)

# # Save
# with open(fileName, 'wb') as f:
#     f.write(r.content)
# print('Shape of waveform: {}'.format(waveform.size()))
# print('Sample rate of waveform: {}'.format(sample_rate))
# plt.figure()
# plt.plot(waveform.t().numpy())
# plt.show()

waveform_mix, sample_rate_mix = torchaudio.load(mix_speech)
waveform_noise, sample_rate_noise = torchaudio.load(noise_speech)
waveform_enhance, sample_rate_enhance = torchaudio.load(enhance_speech)
# Spectrogram
# specgram_mix = torchaudio.transforms.Spectrogram()(waveform_mix)
# print('Shape of noisy speech spectrogram :', specgram_mix.size())
# plt.figure()
# plt.imshow(specgram_mix.log2()[0, :, :].numpy())
# plt.ylabel('Frequency')
# plt.xlabel('Time')
# plt.show()
# plt.savefig('mix_speech1.png')  

# specgram_noise = torchaudio.transforms.Spectrogram()(waveform_noise)
# print('Shape of enhanced speech spectrogram:', specgram_noise.size())
# plt.figure()
# plt.imshow(specgram_noise.log2()[0, :, :].numpy())
# plt.show()
# plt.ylabel('Frequency')
# plt.xlabel('Time')
# plt.savefig('target_speech.png')

specgram_enhance = torchaudio.transforms.Spectrogram()(waveform_enhance)
print('Shape of enhanced speech spectrogram:', specgram_enhance.size())
plt.figure()
plt.imshow(specgram_enhance.log2()[0, :, :].numpy())
plt.show()
plt.ylabel('Frequency')
plt.xlabel('Time')
plt.savefig('ehnance_speech.pdf')