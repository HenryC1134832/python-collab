from pydub import AudioSegment
sound = AudioSegment.from_wav("/media/speech70809/TOSHIBA_3TB/project/wavs/test/new_3.wav")
sound = sound.set_channels(1)
sound.export("/media/speech70809/TOSHIBA_3TB/project/wavs/test/new_3_ch1.wav", format="wav")
