fs = 16000
chunk_len = 5  # (s)
chunk_size = chunk_len * fs
num_spks = 2

# network configure
nnet_conf = {
    "L": 16,
    "N": 512,
    "X": 8,
    "R": 1,
    "B": 128,
    "Sc": 128,
    "Slice": 2,
    "H": 512,
    "P": 3,
    "norm": "gLN", #BN, gLN, cLN
    "num_spks": num_spks,
    "non_linear": "sigmoid"
}

# data configure:
train_dir = "/media/HDD10TB/wthong_DATA/Mahzoon/iptcloud_denoiser12/datasets/Mah-300hr/tr/"
dev_dir = "/media/HDD10TB/wthong_DATA/Mahzoon/iptcloud_denoiser12/datasets/Mah-300hr/cv/"

#train_dir = "/media/lab70809/Mac-pro2/Speech_Denoiser/datasets/ner-300hr/tr/"
#dev_dir = "/media/lab70809/Mac-pro2/Speech_Denoiser/datasets/ner-300hr/cv/"

train_data = {
    "mix_scp":
    train_dir + "mix.scp",
    "ref_scp":
    [train_dir + "spk{:d}.scp".format(n) for n in range(1, 1 + num_spks)],
    "sample_rate":
    fs,
}

dev_data = {
    "mix_scp": dev_dir + "mix.scp",
    "ref_scp":
    [dev_dir + "spk{:d}.scp".format(n) for n in range(1, 1 + num_spks)],
    "sample_rate": fs,
}

# trainer config
adam_kwargs = {
    "lr": 1e-3,
    "weight_decay": 1e-5,
}

trainer_conf = {
    "optimizer": "adam",
    "optimizer_kwargs": adam_kwargs,
    "min_lr": 1e-8,
    "patience": 2,
    "factor": 0.5,
    "logging_period": 200,  # batch number
    "no_impr":100,
    "loss_mode": "sisnr"
}
