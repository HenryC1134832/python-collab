import json
import os
from scipy.io import wavfile

def folder_wav_to_json_format(wav_folder_path, json_file_path):
    # List to hold each audio file's path and sample rate as a list of lists
    audio_metadata = []

    # Loop through all files in the folder
    for filename in os.listdir(wav_folder_path):
        # Check if the file is a .wav file
        if filename.endswith(".wav"):
            wav_file_path = os.path.join(wav_folder_path, filename)
            
            # Read the sample rate (we ignore the audio data itself)
            sample_rate, _ = wavfile.read(wav_file_path)
            
            # Append the file path and sample rate as a list to audio_metadata
            audio_metadata.append([wav_file_path, sample_rate])
    
    # Save all metadata to a JSON file
    with open(json_file_path, 'w') as json_file:
        json.dump(audio_metadata, json_file, indent=4)
    
    print(f"Metadata for all .wav files in {wav_folder_path} saved to {json_file_path}")

# Usage
wav_folder_path = 'datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/s1'
json_file_path = 'datasets/ner-300hr/BUS_Vol3/BUStt_-6dB/clean_s1.json'
folder_wav_to_json_format(wav_folder_path, json_file_path)