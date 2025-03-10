
# from pathlib import Path
# import sox

# files = '/media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/NER_clean_tr/'
# # Initialize the total duration variable
# total_duration = 0

# # Iterate through all WAV files in the directory
# for audio_file in Path(files).glob('*.wav'):
#     # Get the duration of each audio file using SoX
#     duration = sox.file_info.duration(audio_file)
    
#     # Add the duration to the total
#     total_duration += duration

# # Print the total duration in seconds
# print(f'Total Duration: {total_duration} seconds')

# import os
# import wave

# # Define the path to the directory containing your WAV files
# directory_path = "/media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/NER_clean_tr"

# # Initialize a variable to keep track of the total duration
# total_duration = 0

# # Iterate through all files in the directory
# for filename in os.listdir(directory_path):
#     if filename.endswith(".wav"):
#         wav_file_path = os.path.join(directory_path, filename)
#         with wave.open(wav_file_path, 'rb') as wav_file:
#             num_frames = wav_file.getnframes()
#             frame_rate = wav_file.getframerate()
#             duration = num_frames / float(frame_rate)
#             total_duration += duration

# print(f"The total duration of all WAV files in the directory is {total_duration:.2f} seconds.")

import os
from pydub import AudioSegment

# Define the path to the directory containing your WAV files
directory_path = "/media/denoiser/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/NER_clean_cv"

# Initialize a variable to keep track of the total duration in milliseconds
total_duration_ms = 0

# Iterate through all files in the directory
for filename in os.listdir(directory_path):
    if filename.endswith(".wav"):
        wav_file_path = os.path.join(directory_path, filename)
        try:
            audio = AudioSegment.from_file(wav_file_path)
            total_duration_ms += len(audio)
        except Exception as e:
            print(f"Error processing {wav_file_path}: {e}")

# Convert total duration from milliseconds to seconds
total_duration_seconds = total_duration_ms / 1000

print(f"The total duration of all WAV files in the directory is {total_duration_seconds:.2f} seconds.")

# training = The total duration of all WAV files in the directory is 151314.16 seconds.
# testing =The total duration of all WAV files in the directory is 19607.46 seconds.
# validation