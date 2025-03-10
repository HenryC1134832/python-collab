import subprocess
import os



os.chdir('/media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/max_data/s1_add_zero')
dir_path = os.path.dirname(os.path.realpath('/media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/max_data/s1_add_zero/*.mp3'))
all_file_name = os.listdir(dir_path)
num = 0
num_str = str(num)
for i in range(1800):
    subprocess.call(['ffmpeg', '-i', all_file_name[i], 'output_test_'+num_str+'.wav'])
    num = num + 1
    num_str = str(num)
