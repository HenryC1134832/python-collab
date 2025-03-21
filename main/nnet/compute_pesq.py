#!/usr/bin/env python

# wujian@2018
"""
Compute SI-SDR as the evaluation metric
"""

import argparse

from tqdm import tqdm

from collections import defaultdict
from libs.metric import si_snr, permute_si_snr, cal_SISNRi
from libs.audio import WaveReader, Reader
import os
from pesq import pesq, pesq_batch, NoUtterancesError, PesqError
import librosa




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
        self.pesq= defaultdict(float)
        # self.inputsnr = defaultdict(float)
        # self.pesqi = defaultdict(float)
        self.cnt = defaultdict(int)
        # self.pesqicnt = defaultdict(int)

    # def add(self, key, pesqval, inputVal, snrival):
    def add(self, key, pesqval):
        gender = "NG"
        if self.s2g:
            gender = self.s2g[key] 
        self.pesq[gender] += pesqval
        # self.inputsnr[gender] += inputVal
        # self.pesq[gender] += snrival
        self.cnt[gender] += 1

    def report(self):
        print("PESQ(dB) Report: ")
        for gender in self.pesq:
            tot_pesq = self.pesq[gender]
            # tot_inputpesq = self.inputsnr[gender]
            num_utts = self.cnt[gender]
            print('tot_pesq: ', tot_pesq)
            # print('tot_inputSNR: ', tot_inputpesq)
            print('num_utts: ', num_utts)
            print("{}: {:d}/{:.3f}".format(gender, num_utts,
                                           tot_pesq / num_utts))
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
            
            pesq_score = pesq(ref=ref, deg=sep, fs=16000,mode='nb')
            # pesq_score[key] = pesq_score
            # inputpesq[key] = inputsnr
            # sisnris[key]= snri
            reporter.add(key,  pesq_score)
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
            snr = permute_si_snr(sep_list, ref_list)
            # snr = si_snr_avg(sep_list, ref_list)
            pesq_score[key] = pesq_score
            reporter.add(key, pesq_score)
    
    if args.print_all == 'yes':
        print('\npesq : ', pesq_score)
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
        "(support multi-speaker, egs: spk1.scp,spk2.scp)")
    parser.add_argument(
        "ref_scp",
        type=str,
        help="Reference speech scripts, as ground truth for"
        " SI-SDR computation")
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
