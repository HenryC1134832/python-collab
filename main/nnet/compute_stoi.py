# import os
# import pydub
# import numpy as np
# from pystoi import stoi
# # from stof_fun import stoi
# clean_dir = '/media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/s1'
# enhanced_dir = '/media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/MS_SL2_R1_03dB_06dB_12dB/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/spk1'

# clean_files = os.listdir(clean_dir)

# enhanced_files = os.listdir(enhanced_dir)

# scores = []

# for i, clean_file in enumerate(clean_files):
#     # Load clean and enhanced audio files
#     clean_audio = pydub.AudioSegment.from_wav(os.path.join(clean_dir, clean_file))
#     # print(clean_audio)
#     enhanced_audio = pydub.AudioSegment.from_wav(os.path.join(enhanced_dir, enhanced_files[i]))

#     # Convert to numpy arrays
#     clean = np.array(clean_audio.get_array_of_samples())
#     enhanced = np.array(enhanced_audio.get_array_of_samples())

#     # Calculate STOI score
#     score = stoi(clean, enhanced, win_len=0.02, hop_len=0.01, extended=True)
#     scores.append(score)

# # Print the average STOI score
# print('Average STOI score:', sum(scores) / len(scores))


# import soundfile as sf
# from pystoi import stoi

# clean, fs = sf.read('/media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/QUTCAR/QUTCARttnew_03/s1/BW_20171124_022_CAR-WINDOWNB-2_snr3_fileid_331.wav')
# denoised, fs = sf.read('/media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/MS_SL2_R1_03dB_06dB_12dB/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/spk1/BW_20171124_022_CAR-WINDOWNB-2_snr3_fileid_331.wav')

# end = min(clean.size, denoised.size)
# clean = clean[:end]
# denoised = denoised[:end]

# # Clean and den should have the same length, and be 1D
# d = stoi(clean, denoised, fs, extended=False)
# print(d)



#!/usr/bin/env python

# wujian@2018
"""
Compute SI-SDR as the evaluation metric
"""

import argparse

from tqdm import tqdm

from collections import defaultdict
# from libs.metric import si_snr, permute_si_snr, cal_SISNRi
from libs.audio import WaveReader, Reader
import os
# from pesq import pesq, pesq_batch, NoUtterancesError, PesqError
import librosa
from pystoi import stoi



class SpeakersReader(object):
    def __init__(self, scps):
        split_scps = scps.split(",")
        if len(split_scps) == 1:
            raise RuntimeError(
                "Construct SpeakersReader need more than one script, got {}".
                format(scps))
        self.readers = [WaveReader(scp) for scp in split_scps]

    def __len__(self):
        first_reader = self.readers[0]
        return len(first_reader)

    def __getitem__(self, key):
        return [reader[key] for reader in self.readers]

    def __iter__(self):
        first_reader = self.readers[0]
        for key in first_reader.index_keys:
            yield key, self[key]


class Report(object):
    def __init__(self, spk2gender=None):
        self.s2g = Reader(spk2gender) if spk2gender else None
        self.stoi= defaultdict(float)
        # self.inputsnr = defaultdict(float)
        # self.pesqi = defaultdict(float)
        self.cnt = defaultdict(int)
        # self.pesqicnt = defaultdict(int)

    # def add(self, key, pesqval, inputVal, snrival):
    def add(self, key, stoival):
        gender = "NG"
        if self.s2g:
            gender = self.s2g[key] 
        self.stoi[gender] += stoival
        # self.inputsnr[gender] += inputVal
        # self.pesq[gender] += snrival
        self.cnt[gender] += 1

    def report(self):
        print("STOI(dB) Report: ")
        for gender in self.stoi:
            tot_stoi = self.stoi[gender]
            # tot_inputpesq = self.inputsnr[gender]
            num_utts = self.cnt[gender]
            print('tot_stoi: ', tot_stoi)
            # print('tot_inputSNR: ', tot_inputpesq)
            print('num_utts: ', num_utts)
            print("{}: {:d}/{:.3f}".format(gender, num_utts,
                                           tot_stoi / num_utts))
            # print("input{}: {:d}/{:.3f}".format(gender, num_utts,
                                        #    tot_inputpesq / num_utts))
            
        # print("SI-SNRi(dB) Report: ")
        # for gender in self.pesqi:
        #     tot_snris = self.pesqi[gender]
        #     print('tot_SNRi: ', tot_snris)
        #     print('num_utts: ', num_utts)
        #     print("{}: {:d}/{:.3f}".format(gender, num_utts,
        #                                    tot_snris / num_utts))


def run(args):
    single_speaker = len(args.sep_scp.split(",")) == 1
    reporter = Report(args.spk2gender)

    #pesq = {}
    # inputpesq = {}
    # sisnris = {}
    
    if single_speaker:
        sep_reader = WaveReader(args.sep_scp)
        ref_reader = WaveReader(args.ref_scp)
        # mix_reader = WaveReader(args.mix_scp)
        for key, sep in tqdm(sep_reader):
            ref = ref_reader[key]
            # mix = mix_reader[key]
            # if sep.size != ref.size or ref.size != mix.size:
            if sep.size != ref.size:
                end = min(sep.size, ref.size)
                sep = sep[:end]
                ref = ref[:end]
                # mix = mix[:end]
            
            # snr = si_snr(sep, ref)
            # inputsnr = si_snr(mix, ref)
            #print(snr)
            # snri = cal_SISNRi(sep, ref, mix)
            #print(snri)
            
            stoi_score = stoi(ref, sep, fs_sig= 16000, extended=False)
            
            # pesq_score[key] = pesq_score
            # inputpesq[key] = inputsnr
            # sisnris[key]= snri
            reporter.add(key,  stoi_score)
    else:
        sep_reader = SpeakersReader(args.sep_scp)
        print('sep_reader: ', sep_reader)
        ref_reader = SpeakersReader(args.ref_scp)
        for key, sep_list in tqdm(sep_reader):
            # print('key: ', key)
            # print('sep_list: ', sep_list)
            ref_list = ref_reader[key]
            if sep_list[0].size != ref_list[0].size:
                end = min(sep_list[0].size, ref_list[0].size)
                sep_list = [s[:end] for s in sep_list]
                ref_list = [s[:end] for s in ref_list]
            # snr = permute_si_snr(sep_list, ref_list)
            # snr = si_snr_avg(sep_list, ref_list)
            stoi_score[key] = stoi_score
            reporter.add(key, stoi_score)
    
    if args.print_all == 'yes':
        print('\n stoi : ', stoi_score)
        # print('\ninput si-snr : ', inputpesq)
        # print('\nsi-snri : ', sisnris)
        

    # maxPESQkey = max(pesq, key=pesq.get)
    # print('\nmax pesq: ', maxPESQkey, pesq[maxPESQkey])
    # #print('max snr array: ',sep_reader[maxSNRkey])
    # minPESQkey = min(pesq, key=pesq.get)
    # print('min pesq: ', minPESQkey, pesq[minPESQkey])
    
    # maxinputSNRkey = max(inputpesq, key=inputpesq.get)
    # print('\nmax input snr: ', maxinputSNRkey, inputpesq[maxinputSNRkey])
    # mininputSNRkey = min(inputpesq, key=inputpesq.get)
    # print('min input snr: ', mininputSNRkey, inputpesq[mininputSNRkey])
    
    # maxSNRikey = max(sisnris, key=sisnris.get)
    # print('\nmax SNRi: ', maxSNRkey, sisnris[maxSNRikey])
    # DiffSNRi = min(sisnris, key=sisnris.get)
    # print('min SNRi: ', DiffSNRi, sisnris[DiffSNRi])

    reporter.report()



if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description=
        "Command to compute SI-SDR, as metric of the separation quality",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument(
        "sep_scp",
        type=str,
        help="Separated speech scripts, waiting for measure"
        "(support multi-speaker, egs: spk1.scp,spk2.scp)/media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/MS_SL2_R1_03dB_06dB_12dB/QUT/QUTttnew_03/QUTttnew_03_tt/target_clean.scp")
    parser.add_argument(
        "ref_scp",
        type=str,
        help="Reference speech scripts, as ground truth for"
        " SI-SDR computation/media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/spk1.scp")
    # parser.add_argument(
    #     "mix_scp",
    #     type=str,
    #     help="mix speech scripts, the model input"
    #     " SI-SDR computation")
    parser.add_argument(
        "--print_all",
        type=str,
        default ="no",
        help="if print all the resault"
        "yes or no")
    parser.add_argument(
        "--spk2gender",
        type=str,
        default="",
        help="If assigned, report results per gender")
    args = parser.parse_args()
    run(args)
