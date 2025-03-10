import pandas as pd
from sklearn.model_selection import train_test_split
import argparse
import os

def main(args):
    noise = args.noise
    df_noise = pd.read_csv(noise, names=['type', 'filepath'], header=None)
    train_noise, val_noise = train_test_split(df_noise, test_size=args.valRatio, random_state=42)
    val_noise, test_noise = train_test_split(val_noise, test_size=args.testRatio, random_state=42)
    
    train_noise_file = os.path.join(os.path.dirname(args.noise), os.path.basename(args.noise).split('.')[0]+'_tr.csv')# os.path.join(args.outDir, 'ner-1000hr_noise_tr.csv')
    train_noise.to_csv(train_noise_file, header=False, index=False)
    
    val_noise_file = os.path.join(os.path.dirname(args.noise), os.path.basename(args.noise).split('.')[0]+'_cv.csv')
    val_noise.to_csv(val_noise_file, header=False, index=False)
    
    test_noise_file = os.path.join(os.path.dirname(args.noise), os.path.basename(args.noise).split('.')[0]+'_tt.csv')
    test_noise.to_csv(test_noise_file, header=False, index=False)

if __name__ == "__main__":
    parser = argparse.ArgumentParser("noisy data generator")
    parser.add_argument('--noise', type=str, default='/media/speech70809/Data01/speech_donoiser_new/datasets/hexagon_noise_300hr.csv',
                        help='Csv file of the audio files')
    parser.add_argument('--valRatio', type=float, default=0.3,
                        help='Directory path of the audio files to store')
    parser.add_argument('--testRatio', type=float, default=0.3,
                        help='Directory path of the audio files to store')
    args = parser.parse_args()
    print(args)
    main(args)
# =============================================================================
# def main(args):
#     noise = args.noise
#     df_noise = pd.read_csv(noise, names=['type', 'filepath'], header=None)
#     train_noise, val_noise = train_test_split(df_noise, test_size=args.valRatio, random_state=42)
#     #val_noise, test_noise = train_test_split(val_noise, test_size=args.testRatio, random_state=42)
#     
#     train_noise_file = os.path.join(os.path.dirname(args.noise), os.path.basename(args.noise).split('.')[0]+'_tr.csv')# os.path.join(args.outDir, 'ner-1000hr_noise_tr.csv')
#     train_noise.to_csv(train_noise_file, header=False, index=False)
#     
#     val_noise_file = os.path.join(os.path.dirname(args.noise), os.path.basename(args.noise).split('.')[0]+'_cv.csv')
#     val_noise.to_csv(val_noise_file, header=False, index=False)
#     
#     test_noise_file = os.path.join(os.path.dirname(args.noise), os.path.basename(args.noise).split('.')[0]+'_tt.csv')
#     test_noise.to_csv(test_noise_file, header=False, index=False)
# 
# if __name__ == "__main__":
#     parser = argparse.ArgumentParser("noisy data generator")
#     parser.add_argument('--noise', type=str, default='/workspace/Liam/dataset/ner_noise.csv',
#                         help='Csv file of the audio files')
#     parser.add_argument('--valRatio', type=float, default=0.3,
#                         help='Directory path of the audio files to store')
#     # parser.add_argument('--testRatio', type=float, default=0.3,
#                         # help='Directory path of the audio files to store')
#     args = parser.parse_args()
#     print(args)
#     main(args)
# =============================================================================
