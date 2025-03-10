import os

source_file = "datasets/Far_Eastern_Hosp_Sample_Dataset/Far_Eastern_Memorial_Hospital.wav"    # "source_file.wav"
output_file = "datasets/Far_Eastern_Dataset_16k/Far_Eastern_Memorial_Hospital.wav"   # "compressed_output_file.wav"

output_str = f"ffmpeg -i {source_file} -ac 1 -ar 16000 {output_file}"
os.system(output_str)
print(output_str)