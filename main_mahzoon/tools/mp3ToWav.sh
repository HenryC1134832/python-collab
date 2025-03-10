#!/bin/bash

# #for list in ./$1/*.mp3; do sox "$list" -r 8k -c1 `echo $list|sed "s/.mp3/.wav/"|sed "s/ $1 $2`; done
# find ./$1/*.mp3 -type f -exec sox {} -r 8k -c1 {}|sed "s/mp3/wav/" \;
# files = $1/*
for file in $1/*.mp3
do
    # echo $file
    # echo $(dirname "$file")
    # echo $(dirname "$file")
    echo "$(basename -s .mp3 "$file").wav"
    ffmpeg -i "$file" -ar 16000 -ac 1 "$(echo "$(dirname "$file")"/"$(basename -s .mp3 "$file").wav")"
done