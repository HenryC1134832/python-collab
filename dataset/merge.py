import shutil
import os
import glob
  
# Define the source and destination path
source = "/media/speech70809/Data01/datasets/NERS-Trs-Vol1/Eval/Clean/Wav/WJ/20170101"
destination = "/media/speech70809/Data01/speech_donoiser_new/datasets/NER/Eval"
# def create_path(source, destination):
#     """
#     create path column and fill na for no data
#     """
#     filelist = glob.glob(os.path.join(noisedir, '*.wav'))
#     path = os.path.join(noisedir, filename+'.wav')
#     if path in filelist:
#         return path
#     else:
#         return None
# code to move the files from sub-folder to main folder.
# files = os.listdir(source)
files = glob.glob(os.path.join(source, '*.wav'))
for file in files:
    file_name = os.path.join(source, file)
    # shutil.move(file_name, destination)
    shutil.copy(file_name, destination)
print("Files Moved")