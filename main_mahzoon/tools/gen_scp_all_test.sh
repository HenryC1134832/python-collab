#!/usr/bin/env bash

datasetfolder=$1
gen_scpfolder=$2
gen_scp(){
    if [ -d $2 ]; then
        if [ -f $3 ]; then
            rm $3
        fi
        sh $1/gen_scp.sh $2 $3
    fi
}
echo 'start generate .scp in birdtt'
# if [ -d $datasetfolder/tt/mix ]; then
#     if [ -f $datasetfolder/tt/mix.scp ]; then
#         rm $datasetfolder/tt/mix.scp
#     fi
#     sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tt/mix $datasetfolder/tt/mix.scp
# fi
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tt/mix $datasetfolder/tt/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tt/s1 $datasetfolder/tt/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tt/s2 $datasetfolder/tt/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/birdtt/mix $datasetfolder/birdtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/birdtt/s1 $datasetfolder/birdtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/birdtt/s2 $datasetfolder/birdtt/spk2.scp

echo 'start generate .scp in doortt'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/cv/mix $datasetfolder/cv/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/cv/s1 $datasetfolder/cv/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/cv/s2 $datasetfolder/cv/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/doortt/mix $datasetfolder/doortt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/doortt/s1 $datasetfolder/doortt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/doortt/s2 $datasetfolder/doortt/spk2.scp

echo 'start generate .scp in drumtt'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/drumtt/mix $datasetfolder/drumtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/drumtt/s1 $datasetfolder/drumtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/drumtt/s2 $datasetfolder/drumtt/spk2.scp

echo 'start generate .scp in fantt'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/fantt/mix $datasetfolder/fantt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/fantt/s1 $datasetfolder/fantt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/fantt/s2 $datasetfolder/fantt/spk2.scp

echo 'start generate .scp in fowltt'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/fowltt/mix $datasetfolder/fowltt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/fowltt/s1 $datasetfolder/fowltt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/fowltt/s2 $datasetfolder/fowltt/spk2.scp

echo 'start generate .scp in guitartt'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/guitartt/mix $datasetfolder/guitartt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/guitartt/s1 $datasetfolder/guitartt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/guitartt/s2 $datasetfolder/guitartt/spk2.scp

echo 'start generate .scp in musictt'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/musictt/mix $datasetfolder/musictt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/musictt/s1 $datasetfolder/musictt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/musictt/s2 $datasetfolder/musictt/spk2.scp

echo 'start generate .scp in vehiclett'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/vehiclett/mix $datasetfolder/vehiclett/mix.scp
gen_scp $gen_scpfolder $datasetfolder/vehiclett/s1 $datasetfolder/vehiclett/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/vehiclett/s2 $datasetfolder/vehiclett/spk2.scp

echo 'start generate .scp in squeaktt'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/squeaktt/mix $datasetfolder/squeaktt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/squeaktt/s1 $datasetfolder/squeaktt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/squeaktt/s2 $datasetfolder/squeaktt/spk2.scp

echo 'start generate .scp in typingtt'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/mix $datasetfolder/typingtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s1 $datasetfolder/typingtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s2 $datasetfolder/typingtt/spk2.scp

echo 'start generate .scp in QUTtt'
gen_scp $gen_scpfolder $datasetfolder/typingtt/mix $datasetfolder/QUTtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s1 $datasetfolder/QUTtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s2 $datasetfolder/QUTtt/spk2.scp

echo 'start generate .scp in QUTSTREETtt'
gen_scp $gen_scpfolder $datasetfolder/typingtt/mix $datasetfolder/QUTSTREETtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s1 $datasetfolder/QUTSTREETtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s2 $datasetfolder/QUTSTREETtt/spk2.scp

echo 'start generate .scp in QUTREVERBtt'
gen_scp $gen_scpfolder $datasetfolder/typingtt/mix $datasetfolder/QUTREVERBtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s1 $datasetfolder/QUTREVERBtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s2 $datasetfolder/QUTREVERBtt/spk2.scp

echo 'start generate .scp in QUTHOMEtt'
gen_scp $gen_scpfolder $datasetfolder/typingtt/mix $datasetfolder/QUTHOMEtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s1 $datasetfolder/QUTHOMEtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s2 $datasetfolder/QUTHOMEtt/spk2.scp

echo 'start generate .scp in QUTCARtt'
gen_scp $gen_scpfolder $datasetfolder/typingtt/mix $datasetfolder/QUTCARtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s1 $datasetfolder/QUTCARtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s2 $datasetfolder/QUTCARtt/spk2.scp

echo 'start generate .scp in QUTCAFEtt'
gen_scp $gen_scpfolder $datasetfolder/typingtt/mix $datasetfolder/QUTCAFEtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s1 $datasetfolder/QUTCAFEtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s2 $datasetfolder/QUTCAFEtt/spk2.scp
