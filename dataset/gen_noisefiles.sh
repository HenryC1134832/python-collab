#!/usr/bin/env bash

find $3 -type f -name '*.wav' -exec echo $2,{} >> $1 \;