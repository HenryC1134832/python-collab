#!/usr/bin/env bash
# sh main/tools/gen_scp_all.sh /workdir/denoiser/datasets/ner-humannoise /workdir/denoiser/main
# python main/nnet/trainnew.py --gpus 0, 1 --epochs 50 --checkpoint /workdir/denoiser/MS_R1_SL1_humanspeech__saved_models --batch-size 4 --num-workers 0


# sh main/tools/gen_scp_all.sh /media/speech70809/Data01/speech_donoiser_new/datasets/ner-human300 /media/speech70809/Data01/speech_donoiser_new/main
#python main/nnet/trainnew.py --gpus 0 --epochs 50 --checkpoint /media/speech70809/Data02/MS_R1_SL2_human3000121__saved_models --batch-size 4 --num-workers 0

# sh main/tools/gen_scp_all.sh /media/speech70809/Data01/speech_donoiser_new/datasets/ner-human300 /media/speech70809/Data01/speech_donoiser_new/main
# python main/nnet/trainnew.py --gpus 0 --epochs 50 --checkpoint /media/speech70809/Data02/MS_R1_SL2_humannoise300hr__saved_models --batch-size 4 --num-workers 0

#sh main/tools/gen_scp_all.sh /media/speech70809/Data01/speech_donoiser_new/datasets/ner-braodnoise300hr /media/speech70809/Data01/speech_donoiser_new/main
# python main/nnet/trainnew.py --gpus 0 --epochs 50 --checkpoint /media/speech70809/Data02/MS_R1_SL2_braodnoise300hr__saved_models --batch-size 4 --num-workers 0


#sh main/tools/gen_scp_all.sh /media/speech70809/Data01/speech_donoiser_new/datasets/ner-300hr /media/speech70809/Data01/speech_donoiser_new/main
#python /workdir/denoiser/main/nnet/trainnew_blue.py --gpus 0,1  --epochs 50 --checkpoint /workdir/denoiser/MS_SL1_1DBPF_new1  --batch-size 8 --num-workers 0 --resume  /workdir/denoiser/MS_SL1_1DBPF_new1/19.pt.tar
#python /workdir/denoiser/main/nnet/trainnew_blue.py --gpus 0,1 --epochs 50 --checkpoint /workdir/denoiser/MS_SL2_BPF_CH  --batch-size 8 --num-workers 0 --resume  /workdir/denoiser/MS_SL2_BPF_CH/33.pt.tar
#python main/nnet/trainnew.py --gpus 0 --epochs 50 --checkpoint /media/denoiser/Toshibha-3.0TB/convTasnet --batch-size 4 --num-workers 0
#python /workdir/denoiser/main/nnet/trainnew.py --gpus 0,1 --epochs 50 --checkpoint /workdir/denoiser/MS_SL1_mulit_attention_test_head16 --batch-size 8 --num-workers 0 --resume  /workdir/denoiser/MS_SL1_mulit_attention_test_head16/39.pt.tar
# python /media/denoiser/Toshiba-4TB/speech_donoiser_new/main/nnet/trainnew_blue.py --gpus 0 --epochs 50 --checkpoint /media/denoiser/Toshiba-4TB/datasettemp/model_SC_CHM_Fusion_core_32hr --batch-size 4 --num-workers 0 --resume  /media/denoiser/Toshibha-3.0TB1/model_SC_CHM_Fusion4/best.pt.tar

python /media/denoiser/Toshiba-4TB/speech_donoiser_new/main/nnet/trainnew_jeffri.py --gpus 0 --epochs 50 --checkpoint /media/denoiser/Toshiba-4TB/datasettemp/model_SC_CHM_Fusion_Embedding_32hr --batch-size 4 --num-workers 0 --resume  /media/denoiser/Toshibha-3.0TB1/model_SC_CHM_Fusion4/best.pt.tar