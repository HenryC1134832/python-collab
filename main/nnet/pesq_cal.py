from pesq import pesq, pesq_batch, NoUtterancesError, PesqError
import os, glob
import soundfile
from tqdm import tqdm

refs = sorted(glob.glob("/media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/BUS/BUStt_03/s1/*.wav"))
evals = sorted(glob.glob("/media/kaldi/D/speech_donoiser_new/datasets/ner-300hr/MS_SL2_R1_03dB_06dB_12dB/QUTCAR/QUTCARttnew_03/QUTCARttnew_03_tt/spk1/*.wav"))

results = dict()
for i, (ref, eval) in tqdm(enumerate(zip(refs, evals))):
    assert os.path.basename(ref) == os.path.basename(eval)
    y, sr = soundfile.read(ref)
    y_hat, sr = soundfile.read(eval)

    results[os.path.basename(ref)] = pesq(y, y_hat, sr)

# print(results)
print(sum(results.values())/len(results))