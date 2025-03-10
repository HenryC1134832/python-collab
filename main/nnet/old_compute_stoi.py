import os
import pydub
import numpy as np
from pystoi import stoi

clean_dir = '/media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS_Vol3/BUStt_-3dB/s1'
enhanced_dir = '/media/kaldi/Toshibha-3.0TB/MS_SL1_Slice_Based/BUS_Vol3/BUStt_-3dB/BUStt_-3dB_tt/spk1'

clean_files = os.listdir(clean_dir)
enhanced_files = os.listdir(enhanced_dir)

scores = []

for i, clean_file in enumerate(clean_files):
    # Load clean and enhanced audio files
    clean_audio = pydub.AudioSegment.from_wav(os.path.join(clean_dir, clean_file))
    enhanced_audio = pydub.AudioSegment.from_wav(os.path.join(enhanced_dir, enhanced_files[i]))
    end = min(clean_audio.duration_seconds, enhanced_audio.duration_seconds)
    clean_audio = clean_audio[:end]
    enhanced_audio = enhanced_audio[:end]
    
    # Convert to numpy arrays
    clean = np.array(clean_audio.get_array_of_samples())
    enhanced = np.array(enhanced_audio.get_array_of_samples())

    # Calculate STOI score
    score = stoi(clean, enhanced, fs=clean_audio.frame_rate)
    scores.append(score)

# Print the average STOI score
print('Average STOI score:', sum(scores) / len(scores))
