import pandas as pd
import glob
import argparse
import os

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
    files = glob.glob(args.noisedir + '/*.wav')
    files = [i.split('/')[-1].split('.')[0] for i in files]
    files = [ i for i in files if 'Freesound' in i]
    file_dict = {'files': files}
    df_file = pd.DataFrame(file_dict)
    # print(df_file.head())
    splitedname = df_file.files.str.split('_', expand = True)
    df_file['first_name'] = splitedname[0]
    df_group = df_file.groupby('first_name')
    print(df_group.size())
    # df_file['path'] = args.noisedir + '/' + df_file['files'] + '.wav'
    df_file['path'] = df_file['files'].apply(create_path, args=(args.noisedir,))
    print(df_file['path'][0])
    df_file_nonone = df_file.dropna()
    nosieTypes = os.path.join(args.csvdir, 'noise_types_16k_Freesound.csv')
    df_file_nonone[['first_name', 'path']].to_csv(nosieTypes, index=False, header=False)

if __name__ == "__main__":
    parser = argparse.ArgumentParser("noisy data generator")
    parser.add_argument('--noisedir', type=str, default='',
                        help='Directory path of the audio files')
    parser.add_argument('--csvdir', type=str, default='./',
                        help='Directory path of the audio files')
    args = parser.parse_args()
    print(args)
    main(args)
