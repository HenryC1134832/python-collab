#!/bin/bash

# find $1/*.mp4 -type f -exec sox {} -r 8k -c1 {}|sed "s/mp3/wav/" \;

for file in $1/*.mp4
do
    ffmpeg -i $file -ar 16000 -ac 1 $(echo $(dirname $file)/$(basename -s .mp4 $file).wav)
done