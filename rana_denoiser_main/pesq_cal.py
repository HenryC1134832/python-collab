# import os
# # import soundfile as sf
# import pesq
# # from pesq import pesq

# # Set the directory path
# dir_path = '/media/kaldi/'
# clean ="/media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1"
# enhanced = "/media/kaldi/Toshibha-3.0TB/MS_SL2_TCN_FUSION/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/spk1"
# # # Initialize PESQ object
# # pesq_obj = pesq()

# # # Loop over all WAV files in the directory
# # # for filename in os.listdir(dir_path):
# for filename in os.listdir(clean):
# #    print(filename)
    
#     if filename.endswith('.wav'):
#      file_path = os.path.join(clean,filename)
#      print(file_path)
        
#         # Load the reference (clean) and degraded (enhanced) signals
#     clean_signal, fs_clean = pesq_obj.load_audio(file_path)
#     enhanced_signal, fs_enhanced = pesq_obj.load_audio('enhanced_' + filename)
        
#         # Match the lengths of the signals
#     min_len = min(len(clean_signal), len(enhanced_signal))
#     clean_signal = clean_signal[:min_len]
#     enhanced_signal = enhanced_signal[:min_len]
        
#         # Calculate the PESQ score
#     score = pesq_obj.calc_pesq(clean_signal, enhanced_signal, fs_clean)
        
#         # Print the score for the current file
#     print(filename, score)


import os
from pesq import pesq, pesq_batch, NoUtterancesError, PesqError
import librosa
import scipy.io.wavfile as wf
# set the paths to the directories containing the reference and degraded speech files
ref_dir = '/media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1'
# enhanced = "/media/kaldi/Toshibha-3.0TB/MS_SL2_TCN_FUSION/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/spk1"'
deg_dir = '/media/kaldi/Toshibha-3.0TB/MS_SL2_TCN_FUSION/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/spk1'

# loop through the speech files in the directories
pesq_scores = []
desired_fs = 16000
for ref_file in os.listdir(ref_dir):
    for deg_file in os.listdir(deg_dir):
    # if ref_file.endswith('.wav'):
        # get the corresponding degraded speech file
        deg_file = os.path.join(deg_dir, deg_file)
        ref_file = os.path.join(ref_dir, ref_file)
        if not os.path.exists(deg_file):
            print('Degraded file {} does not exist'.format(deg_file))
            continue
        # deg =  os.path.basename(deg_file)
        samp_rate, data1 = wf.read(deg_file)
        samp_rate, data2 = wf.read(ref_file)
        min_len = min(len(data1), len(data2))
        clean_signal = data1[:min_len]
        enhanced_signal = data2[:min_len]

        print(clean_signal)
        print(samp_rate)
        print(clean_signal.size)
        print(enhanced_signal)
        print(samp_rate)
        print(enhanced_signal.size)

        # calculate the PESQ score for the pair of speech files
        score = pesq(ref=clean_signal, deg=enhanced_signal, fs=samp_rate, mode='nb')
        pesq_scores.append(score)

# compute the average PESQ score
if pesq_scores:
    avg_pesq_score = sum(pesq_scores) / len(pesq_scores)
    print('Average PESQ score:', avg_pesq_score)
else:
    print('No speech files found')


# clean ="/media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1/CX_20160429_001_aligned_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr-3_fileid_482.wav"
# enhanced = "/media/kaldi/Toshibha-3.0TB/MS_SL2_TCN_FUSION/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/spk1/CX_20160429_001_aligned_zaIfiS5-WiA-BGD_150204_040_BUS.CH2_snr-3_fileid_482.wav"
# # # Initialize PESQ object
# samplerate = 16000
# ref, _ = sf.read(clean)
# deg, _ = sf.read(enhanced)
# min_len = min(len(ref), len(deg))
# #     clean_signal = clean_signal[:min_len]
# ref = ref[:min_len]
# deg = deg[:min_len]
# score = pesq.pesq(samplerate, ref, deg, 'wb')