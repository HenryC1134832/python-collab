echo "start";

echo "1.Do sh model_denoise_test.sh";
#cd /workdir/denoiser/datasets;
cd /media/speech70809/Data01/speech_donoiser_new/main;
sh model_denoise_test.sh;
#python createtestnoise.py;
#sh train_test_split.sh

echo "\n2.Do denoised_scp.sh"
cd /media/speech70809/Data01/speech_donoiser_new/main;
sh denoised_scp.sh;

echo "\n3.Do compute_snr_based_dB.sh";
cd /media/speech70809/Data01/speech_donoiser_new;
sh compute_snr_based_dB.sh;


#rm -r /workdir/denoiser/datasets/ner-300hr/
#unzip /workdir/denoiser/datasets/data.zip
#mv /workdir/denoiser/ner-300hr/ /workdir/denoiser/datasets/ner-300hr/
#nvidia-smi;
#mv /workdir/denoiser/media/lab70809/Data01/speech_donoiser_new/datasets/ner-300hr/ /workdir/denoiser/datasets/ner-300hr/

