echo "start";

#echo "1.Do gen_data.sh";
#cd /workdir/denoiser/datasets;
#sh gen_data.sh;

#echo "\n2.Do synthesize_data.sh"
cd /workdir/denoiser/synthesizer;
sh synthesize_data.sh;

echo "\n3.Do train.sh";
cd /workdir/denoiser;
sh train.sh;


#rm -r /workdir/denoiser/datasets/ner-300hr/
#unzip /workdir/denoiser/datasets/data.zip
#mv /workdir/denoiser/ner-300hr/ /workdir/denoiser/datasets/ner-300hr/
#nvidia-smi;
#mv /workdir/denoiser/media/lab70809/Data01/speech_donoiser_new/datasets/ner-300hr/ /workdir/denoiser/datasets/ner-300hr/



