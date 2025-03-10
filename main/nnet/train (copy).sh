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
python /workdir/denoiser/main/nnet/trainnew.py --gpus 0,1 --epochs 50 --checkpoint /workdir/denoiser/MS_SL1_attention_saved_models_test_havedrop_changeChannelWiseLayerNorm --batch-size 8 --num-workers 0 --resume /workdir/denoiser/MS_SL1_attention_saved_models_test_havedrop_changeChannelWiseLayerNorm/20.pt.tar
#python /home/twsnkvj379/Max/main/nnet/trainnew.py --gpus 0,1 --epochs 50 --checkpoint /home/twsnkvj379/Max/MS_SL2_only_attention_saved_models --batch-size 8 --num-workers 0
