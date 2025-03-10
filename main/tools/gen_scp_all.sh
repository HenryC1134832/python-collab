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
echo 'start generate .scp in tt'
# if [ -d $datasetfolder/tt/mix ]; then
#     if [ -f $datasetfolder/tt/mix.scp ]; then
#         rm $datasetfolder/tt/mix.scp
#     fi
#     sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tt/mix $datasetfolder/tt/mix.scp
# fi
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tt/mix $datasetfolder/tt/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tt/s1 $datasetfolder/tt/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tt/s2 $datasetfolder/tt/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/tt/mix $datasetfolder/tt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/tt/s1 $datasetfolder/tt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/tt/s2 $datasetfolder/tt/spk2.scp

echo 'start generate .scp in cv'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/cv/mix $datasetfolder/cv/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/cv/s1 $datasetfolder/cv/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/cv/s2 $datasetfolder/cv/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/cv/mix $datasetfolder/cv/mix.scp
gen_scp $gen_scpfolder $datasetfolder/cv/s1 $datasetfolder/cv/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/cv/s2 $datasetfolder/cv/spk2.scp

echo 'start generate .scp in tr'
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
# sh /asr_denoiser/main/gen_scp.sh $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp
gen_scp $gen_scpfolder $datasetfolder/tr/mix $datasetfolder/tr/mix.scp
gen_scp $gen_scpfolder $datasetfolder/tr/s1 $datasetfolder/tr/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/tr/s2 $datasetfolder/tr/spk2.scp