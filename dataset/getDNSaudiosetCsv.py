import pandas as pd
import json
import os
import argparse
import glob

def create_path(filename, noisedir):
    """
    create path column and fill na for no data
    """
    filelist = glob.glob(os.path.join(noisedir, '*.wav'))
    path = os.path.join(noisedir, filename+'.wav')
    if path in filelist:
        return path
    else:
        return None

def main(args):
    unbalanced = os.path.join(args.dir, 'unbalanced_train_segments.csv')
    df_unbalanced = pd.read_csv(unbalanced, names=['YTID', 'start_seconds', 'end_seconds', 'positive_labels', 'positive_labels_1','positive_labels_2', 'positive_labels_3','positive_labels_4'],error_bad_lines=False)
    balanced = os.path.join(args.dir, 'balanced_train_segments.csv')
    df_balanced = pd.read_csv(balanced, names=['YTID', 'start_seconds', 'end_seconds', 'positive_labels', 'positive_labels_1', 'positive_labels_2', 'positive_labels_3', 'positive_labels_4'],error_bad_lines=False)
    eval_segments = os.path.join(args.dir, 'eval_segments.csv')
    df_eval_segments = pd.read_csv(eval_segments, names=['YTID', 'start_seconds', 'end_seconds', 'positive_labels', 'positive_labels_1', 'positive_labels_2', 'positive_labels_3', 'positive_labels_4'],error_bad_lines=False)
    noise_16 = os.path.join(args.dir, 'noise_16000.csv')
    df_noise = pd.read_csv(noise_16, names=['YTID'])
    class_labels_indices = os.path.join(args.dir, 'class_labels_indices.csv')
    df_class_labels_indices = pd.read_csv(class_labels_indices, skiprows=1, names=['index','positive_labels','display_name'])
    df_audioset = pd.concat([df_unbalanced, df_balanced, df_eval_segments], ignore_index=True)
    df_audioset = df_audioset.replace({'positive_labels': r'"'}, {'positive_labels': ''}, regex=True)
    df_noise_labels = pd.merge(df_noise, df_audioset[['YTID', 'positive_labels']], how='left', on='YTID')
    df_noise_labels = df_noise_labels.replace({'positive_labels': r' '}, {'positive_labels': ''}, regex=True)
    df_noise_classes = pd.merge(df_noise_labels, df_class_labels_indices[['positive_labels', 'display_name']], how='left', on='positive_labels')
    df_noise_classes['path'] = df_noise_classes['YTID'].apply(create_path, args=(args.noisedir,))
    # df_noise_classes['path'] = args.noisedir + df_noise_classes['YTID'] + '.wav'
    df_noise_classes_nonone = df_noise_classes.dropna()
    nosieTypes = os.path.join(args.dir, 'noise_types_16k_audioset.csv')
    df_noise_classes_nonone[['display_name', 'path']].to_csv(nosieTypes, index=False, header=False)

if __name__ == "__main__":
    parser = argparse.ArgumentParser("noisy data generator")
    parser.add_argument('--dir', type=str, default='/media/kaldi/D/speech_donoiser_new/datasets',
                        help='Directory path of the audio files')
    parser.add_argument('--noisedir', type=str, default='/media/kaldi/D/speech_donoiser_new/datasets/noise/',
                        help='Directory path of the audio files')
    args = parser.parse_args()
    print(args)
    main(args)