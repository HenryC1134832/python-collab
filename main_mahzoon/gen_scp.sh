#!/usr/bin/env bash

# count=0
for file in $1/*.wav
do
    echo $(basename -s .wav ${file}) ${file} >> $2
    # echo $count ${file} >> $2
    # count=$(($count+1))
done