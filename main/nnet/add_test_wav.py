import os
from pydub import AudioSegment



os.chdir('/media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/s1')
dir_path = os.path.dirname(os.path.realpath('/media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/s1/*.wav'))
all_file_name = os.listdir(dir_path)
#print(all_file_name)
print(all_file_name[0])
count = 0
num = 0
num_str = str(num)
for i in range(1800):
    os.chdir('/media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt/s1')
    song1 = AudioSegment.from_wav(all_file_name[count])
    os.chdir('/media/speechsever/66270bea-3081-4132-b76d-84f0ac1e156e/speech_donoiser_new/datasets/ner-300hr/tt')
    song2 = AudioSegment.from_wav('zero.wav')
    count = count + 1
    output = song2 + song1 + song2 
    output.export('output_test_'+num_str+'.mp3')
    num = num + 1
    num_str = str(num)

#song1 = AudioSegment.from_wav('BW_20171124_033_7b5VMyyIweM-42IEJWuMv1k-squeak_squeakyChair_Freesound_validated_414083_11_snr17_fileid_565.wav')
#song2 = AudioSegment.from_wav('BW_20171124_033_8nW2wQ3d3W8-fan_Freesound_validated_139970_0-MgJowBSeKQc_snr16_fileid_1166.wav')
#output = song1 + song2
#output.export('output_test_1.wav')
