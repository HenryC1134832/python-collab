#!/usr/bin/env bash

echo 'synthesizing tt'
python noisyspeech_synthesizer_multiprocessing_v2.py --cfg noisyspeech_synthesizer_tt.cfg
#echo 'synthesizing cv'
#python noisyspeech_synthesizer_multiprocessing_v2.py --cfg noisyspeech_synthesizer_cv.cfg
#echo 'synthesizing tr'
#python noisyspeech_synthesizer_multiprocessing_v2.py --cfg noisyspeech_synthesizer_tr.cfg

#echo 'finished'
#noisyspeech_synthesizer_multiprocessing_v2.py
# echo 'synthesizing cv'
# python noisyspeech_synthesizer_multiprocessing_v2.py --cfg noisyspeech_synthesizer_cv.cfg
# echo 'synthesizing tr'
# python noisyspeech_synthesizer_multiprocessing_v2.py --cfg noisyspeech_synthesizer_tr.cfg
# echo 'finished'