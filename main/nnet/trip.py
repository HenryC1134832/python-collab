import os
import shutil
# fullpath = '/media/speech70809/Data01/datasets/vox1_test_wav/cafe/vox1_test_wav_cafe_3db/s1/id10270___5r0dWxy17C8___00007_BGD_150204_030_CAF.CH5_snr3_fileid_1088.wav'

def sep_filename(path, save_path):
    file = os.listdir(path)

    for file in file:
        x = file.split("___")
        file_path = os.path.join(path, file)
        backup_folder_path = os.path.join(save_path, x[0], x[1])
        backup_file_path = os.path.join(save_path, x[0], x[1], x[2])
        if not os.path.isdir(backup_folder_path):
            os.makedirs(backup_folder_path)
        shutil.copy(file_path, backup_file_path)
        print(file_path)
        print(backup_file_path)


path = '/media/speech70809/Data01/datasets/vox1_test_wav/cafe/vox1_test_wav_cafe_3db/s1'
new_path = '/media/speech70809/Data01/new_data'

a = sep_filename(path,new_path)
print(a)

# python predict.py --batch_size 2 --gpu 0  --resume /media/speech70809/Data01/speaker-diarization-master/Speaker-Diarization/ghostvlad/pretrained/weights.h5 --vlad_cluster 8 --data_path /media/speech70809/Data01/project/SpeakerDiarization/wavs/id_111000/camera_1/test.wav