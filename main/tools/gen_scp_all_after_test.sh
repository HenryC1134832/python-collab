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

gen_scp $gen_scpfolder $datasetfolder/result/spk1 $datasetfolder/result/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result/spk2 $datasetfolder/result/target.scp

echo 'start generate .scp in birdtt'

gen_scp $gen_scpfolder $datasetfolder/result_bird/spk1 $datasetfolder/result_bird/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_bird/spk2 $datasetfolder/result_bird/target.scp


echo 'start generate .scp in doortt'
gen_scp $gen_scpfolder $datasetfolder/result_door/spk1 $datasetfolder/result_door/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_door/spk2 $datasetfolder/result_door/target.scp

echo 'start generate .scp in drumtt'
gen_scp $gen_scpfolder $datasetfolder/result_drum/spk1 $datasetfolder/result_drum/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_drum/spk2 $datasetfolder/result_drum/target.scp

echo 'start generate .scp in fantt'
gen_scp $gen_scpfolder $datasetfolder/result_fan/spk1 $datasetfolder/result_fan/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_fan/spk2 $datasetfolder/result_fan/target.scp

echo 'start generate .scp in fowltt'
gen_scp $gen_scpfolder $datasetfolder/result_fowl/spk1 $datasetfolder/result_fowl/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_fowl/spk2 $datasetfolder/result_fowl/target.scp
echo 'start generate .scp in guitartt'
gen_scp $gen_scpfolder $datasetfolder/result_guitar/spk1 $datasetfolder/result_guitar/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_guitar/spk2 $datasetfolder/result_guitar/target.scp

echo 'start generate .scp in musictt'
gen_scp $gen_scpfolder $datasetfolder/result_music/spk1 $datasetfolder/result_music/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_music/spk2 $datasetfolder/result_music/target.scp

echo 'start generate .scp in vehiclett'
gen_scp $gen_scpfolder $datasetfolder/result_vehicle/spk1 $datasetfolder/result_vehicle/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_vehicle/spk2 $datasetfolder/result_vehicle/target.scp

echo 'start generate .scp in squeaktt'
gen_scp $gen_scpfolder $datasetfolder/result_squeak/spk1 $datasetfolder/result_squeak/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_squeak/spk2 $datasetfolder/result_squeak/target.scp

echo 'start generate .scp in typingtt'
gen_scp $gen_scpfolder $datasetfolder/result_typing/spk1 $datasetfolder/result_typing/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_typing/spk2 $datasetfolder/result_typing/target.scp

echo 'start generate .scp in CAFtt'
gen_scp $gen_scpfolder $datasetfolder/result_CAF/spk1 $datasetfolder/result_CAF/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_CAF/spk2 $datasetfolder/result_CAF/target.scp

echo 'start generate .scp in BUStt'
gen_scp $gen_scpfolder $datasetfolder/result_BUS/spk1 $datasetfolder/result_BUS/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_BUS/spk2 $datasetfolder/result_BUS/target.scp

echo 'start generate .scp in PEDtt'
gen_scp $gen_scpfolder $datasetfolder/result_PED/spk1 $datasetfolder/result_PED/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_PED/spk2 $datasetfolder/result_PED/target.scp

echo 'start generate .scp in STRtt'
gen_scp $gen_scpfolder $datasetfolder/result_STR/spk1 $datasetfolder/result_STR/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_STR/spk2 $datasetfolder/result_STR/target.scp

echo 'start generate .scp in QUTtt'
gen_scp $gen_scpfolder $datasetfolder/result_QUT/spk1 $datasetfolder/result_QUT/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_QUT/spk2 $datasetfolder/result_QUT/target.scp

echo 'start generate .scp in QUTSTREETtt'
gen_scp $gen_scpfolder $datasetfolder/result_QUTSTREET/spk1 $datasetfolder/result_QUTSTREET/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_QUTSTREET/spk2 $datasetfolder/result_QUTSTREET/target.scp
echo 'start generate .scp in QUTREVERBtt'
gen_scp $gen_scpfolder $datasetfolder/result_QUTREVERB/spk1 $datasetfolder/result_QUTREVERB/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_QUTREVERB/spk2 $datasetfolder/result_QUTREVERB/target.scp

echo 'start generate .scp in QUTHOMEtt'
gen_scp $gen_scpfolder $datasetfolder/result_QUTHOME/spk1 $datasetfolder/result_QUTHOME/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_QUTHOME/spk2 $datasetfolder/result_QUTHOME/target.scp

echo 'start generate .scp in QUTCARtt'
gen_scp $gen_scpfolder $datasetfolder/result_QUTCAR/spk1 $datasetfolder/result_QUTCAR/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_QUTCAR/spk2 $datasetfolder/result_QUTCAR/target.scp

echo 'start generate .scp in QUTCAFEtt'
gen_scp $gen_scpfolder $datasetfolder/result_QUTCAFE/spk1 $datasetfolder/result_QUTCAFE/targetnoise.scp
gen_scp $gen_scpfolder $datasetfolder/result_QUTCAFE/spk2 $datasetfolder/result_QUTCAFE/target.scp

