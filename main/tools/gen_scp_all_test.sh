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
#gen_scp $gen_scpfolder $datasetfolder/tt/mix $datasetfolder/tt/mix.scp
#gen_scp $gen_scpfolder $datasetfolder/tt/s1 $datasetfolder/tt/spk1.scp
#gen_scp $gen_scpfolder $datasetfolder/tt/s2 $datasetfolder/tt/spk2.scp

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
#gen_scp $gen_scpfolder $datasetfolder/birdtt/mix $datasetfolder/birdtt/mix.scp
#gen_scp $gen_scpfolder $datasetfolder/birdtt/s1 $datasetfolder/birdtt/spk1.scp
#gen_scp $gen_scpfolder $datasetfolder/birdtt/s2 $datasetfolder/birdtt/spk2.scp

#echo 'start generate .scp in doortt'
gen_scp $gen_scpfolder $datasetfolder/doortt/mix $datasetfolder/doortt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/doortt/s1 $datasetfolder/doortt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/doortt/s2 $datasetfolder/doortt/spk2.scp

echo 'start generate .scp in drumtt'
gen_scp $gen_scpfolder $datasetfolder/drumtt/mix $datasetfolder/drumtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/drumtt/s1 $datasetfolder/drumtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/drumtt/s2 $datasetfolder/drumtt/spk2.scp

echo 'start generate .scp in fantt'
gen_scp $gen_scpfolder $datasetfolder/fantt/mix $datasetfolder/fantt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/fantt/s1 $datasetfolder/fantt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/fantt/s2 $datasetfolder/fantt/spk2.scp

echo 'start generate .scp in fowltt'
gen_scp $gen_scpfolder $datasetfolder/fowltt/mix $datasetfolder/fowltt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/fowltt/s1 $datasetfolder/fowltt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/fowltt/s2 $datasetfolder/fowltt/spk2.scp

echo 'start generate .scp in guitartt'

gen_scp $gen_scpfolder $datasetfolder/guitartt/mix $datasetfolder/guitartt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/guitartt/s1 $datasetfolder/guitartt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/guitartt/s2 $datasetfolder/guitartt/spk2.scp

echo 'start generate .scp in musictt'
gen_scp $gen_scpfolder $datasetfolder/musictt/mix $datasetfolder/musictt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/musictt/s1 $datasetfolder/musictt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/musictt/s2 $datasetfolder/musictt/spk2.scp

echo 'start generate .scp in vehiclett'
gen_scp $gen_scpfolder $datasetfolder/vehiclett/mix $datasetfolder/vehiclett/mix.scp
gen_scp $gen_scpfolder $datasetfolder/vehiclett/s1 $datasetfolder/vehiclett/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/vehiclett/s2 $datasetfolder/vehiclett/spk2.scp

echo 'start generate .scp in squeaktt'
gen_scp $gen_scpfolder $datasetfolder/squeaktt/mix $datasetfolder/squeaktt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/squeaktt/s1 $datasetfolder/squeaktt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/squeaktt/s2 $datasetfolder/squeaktt/spk2.scp

echo 'start generate .scp in typingtt'
gen_scp $gen_scpfolder $datasetfolder/typingtt/mix $datasetfolder/typingtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s1 $datasetfolder/typingtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/typingtt/s2 $datasetfolder/typingtt/spk2.scp

echo 'start generate .scp in CAFtt'
gen_scp $gen_scpfolder $datasetfolder/CAFtt/mix $datasetfolder/CAFtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/CAFtt/s1 $datasetfolder/CAFtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/CAFtt/s2 $datasetfolder/CAFtt/spk2.scp

echo 'start generate .scp in PEDtt'
gen_scp $gen_scpfolder $datasetfolder/PEDtt/mix $datasetfolder/PEDtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/PEDtt/s1 $datasetfolder/PEDtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/PEDtt/s2 $datasetfolder/PEDtt/spk2.scp

echo 'start generate .scp in STRtt'
gen_scp $gen_scpfolder $datasetfolder/STRtt/mix $datasetfolder/STRtt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/STRtt/s1 $datasetfolder/STRtt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/STRtt/s2 $datasetfolder/STRtt/spk2.scp

echo 'start generate .scp in BUStt'
gen_scp $gen_scpfolder $datasetfolder/BUStt/mix $datasetfolder/BUStt/mix.scp
gen_scp $gen_scpfolder $datasetfolder/BUStt/s1 $datasetfolder/BUStt/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/BUStt/s2 $datasetfolder/BUStt/spk2.scp


echo 'start generate .scp in QUTtt'
gen_scp $gen_scpfolder $datasetfolder/QUTttnew/mix $datasetfolder/QUTttnew/mix.scp
gen_scp $gen_scpfolder $datasetfolder/QUTttnew/s1 $datasetfolder/QUTttnew/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/QUTttnew/s2 $datasetfolder/QUTttnew/spk2.scp

echo 'start generate .scp in QUTSTREETtt'
gen_scp $gen_scpfolder $datasetfolder/QUTSTREETttnew/mix $datasetfolder/QUTSTREETttnew/mix.scp
gen_scp $gen_scpfolder $datasetfolder/QUTSTREETttnew/s1 $datasetfolder/QUTSTREETttnew/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/QUTSTREETttnew/s2 $datasetfolder/QUTSTREETttnew/spk2.scp

echo 'start generate .scp in QUTREVERBtt'
gen_scp $gen_scpfolder $datasetfolder/QUTREVERBttnew/mix $datasetfolder/QUTREVERBttnew/mix.scp
gen_scp $gen_scpfolder $datasetfolder/QUTREVERBttnew/s1 $datasetfolder/QUTREVERBttnew/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/QUTREVERBttnew/s2 $datasetfolder/QUTREVERBttnew/spk2.scp

echo 'start generate .scp in QUTHOMEtt'
gen_scp $gen_scpfolder $datasetfolder/QUTHOMEttnew/mix $datasetfolder/QUTHOMEttnew/mix.scp
gen_scp $gen_scpfolder $datasetfolder/QUTHOMEttnew/s1 $datasetfolder/QUTHOMEttnew/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/QUTHOMEttnew/s2 $datasetfolder/QUTHOMEttnew/spk2.scp

echo 'start generate .scp in QUTCARtt'
gen_scp $gen_scpfolder $datasetfolder/QUTCARttnew/mix $datasetfolder/QUTCARttnew/mix.scp
gen_scp $gen_scpfolder $datasetfolder/QUTCARttnew/s1 $datasetfolder/QUTCARttnew/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/QUTCARttnew/s2 $datasetfolder/QUTCARttnew/spk2.scp

echo 'start generate .scp in QUTCAFEtt'
gen_scp $gen_scpfolder $datasetfolder/QUTCAFEttnew/mix $datasetfolder/QUTCAFEttnew/mix.scp
gen_scp $gen_scpfolder $datasetfolder/QUTCAFEttnew/s1 $datasetfolder/QUTCAFEttnew/spk1.scp
gen_scp $gen_scpfolder $datasetfolder/QUTCAFEttnew/s2 $datasetfolder/QUTCAFEttnew/spk2.scp
