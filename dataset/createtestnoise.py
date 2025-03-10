#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Feb 17 22:11:19 2021

@author: lab70809
"""

import pandas as pd
import csv

#%%
# noise_tr = pd.read_csv('noise_tr.csv', header = None)
# noise_tr.columns = ['name', 'path']
# print(noise_tr.head())

# noise_without_door = noise_tr[noise_tr['name'] != 'door']
# print("No of noise without door noise type based on noise_tr", noise_without_door)
# noise_without_door.to_csv('noise_door_without.csv', index=False, header = False)


# door_noise = noise_tr[noise_tr['name']== 'door']
# print("No of door noise based on noise_tr", door_noise)
# door_noise.to_csv('noise_door.csv', index=False, header = False)

# noisetable = noise_tr['name'].value_counts()
# print(noisetable)
# noisetable.to_csv('all_noise.csv')

#%% 
# stationay noise datatypes
# =============================================================================
# noise = pd.read_csv('noise.csv', header = None)
# noise.columns = ['name', 'path']
# print(noise.head())
# noisetable = noise['name'].value_counts()
# print(noisetable)
# door = noise[noise['name'] == 'door']
# fowl = noise[noise['name'] == 'Fowl']
# typing = noise[noise['name'] == 'typing']
# music = noise[noise['name'] == 'music']
# Music = noise[noise['name'] == 'music']
# fan = noise[noise['name'] == 'fan']
# 
# staionary_noise = pd.concat([door, fowl, typing, music, Music, fan], ignore_index=True)
# staionary_noise.to_csv('staionary_noise.csv', index=False, header = False)
# =============================================================================

#%%

#non_stationay noise datatypes
# noise = pd.read_csv('qut_noise.csv', header = None)
noise = pd.read_csv('/media/kaldi/D/speech_donoiser_new/datasets/qut_noise.csv', header = None)
noise.columns = ['name', 'path']
print(noise.head())
noisetable = noise['name'].value_counts()

print(noisetable)

noisetable.to_csv('QUT.csv')

CAFE = noise[noise['name'] == 'CAFE']
HOME = noise[noise['name'] == 'HOME']
STREET = noise[noise['name'] == 'STREET']
CAR = noise[noise['name'] == 'CAR']
REVERB = noise[noise['name'] == 'REVERB']

CAFE.to_csv('CAFE_Noise.csv', index=False, header = False)
HOME.to_csv('HOME_Noise.csv', index=False, header = False)
STREET.to_csv('STREET_Noise.csv', index=False, header = False)
CAR.to_csv('CAR_Noise.csv', index=False, header = False)
REVERB.to_csv('REVERB_Noise.csv', index=False, header = False)
'''
door = noise[noise['name'] == 'door']
fowl = noise[noise['name'] == 'Fowl']
typing = noise[noise['name'] == 'typing']
music = noise[noise['name'] == 'music']
Music = noise[noise['name'] == 'music']
fan = noise[noise['name'] == 'fan']
bird = noise[noise['name'] == 'Bird']
engine = noise[noise['name'] == 'Engine']
vehicle = noise[noise['name'] == 'Vehicle']
siren = noise[noise['name'] == 'Siren']
motor_vehicle = noise[noise['name'] == 'Motor vehicle (road)']
car = noise[noise['name'] == 'Car']
caf = noise[noise['name'] == 'CAF']
bus = noise[noise['name'] == 'BUS']
ped = noise[noise['name'] == 'PED']
Speech = noise[noise['name'] == 'Speech']
Conversation = noise[noise['name'] == 'Conversation']
Children_shouting = noise[noise['name'] == 'Children shouting']
Laughter = noise[noise['name'] == 'Laughter']
Mantra = noise[noise['name'] == 'Mantra']
Song = noise[noise['name'] == 'Song']
Snoring = noise[noise['name'] == 'Snoring']

Exolosion = noise[noise['name'] == 'Exolosion']
Insect = noise[noise['name'] == 'Insect']
Rain = noise[noise['name'] == 'Rain']
Fireworks = noise[noise['name'] == 'Fireworks']
Duck = noise[noise['name'] == 'Duck']
Harmonica = noise[noise['name'] == 'Harmonica']
Drill = noise[noise['name'] == 'Drill']
Cat = noise[noise['name'] == 'Cat']






hexagon_noise = pd.concat([music,bird,Music,Exolosion,Insect,Rain,Fireworks,Duck,Harmonica, Drill,Cat], ignore_index=True)
hexagon_noise.to_csv('hexagon_noise_300hr.csv',index = False, header = False)

'''
# =============================================================================
# machine_noise = pd.concat([typing, fan, engine, vehicle, siren, motor_vehicle, car, bus], ignore_index=True)
# machine_noise.to_csv('machine_noise_300hr.csv', index=False, header = False)
# =============================================================================

# human_noise = pd.concat([caf, ped, Speech, Conversation, Children_shouting, Laughter,  Mantra, Song, Snoring], ignore_index=True)
# human_noise.to_csv('human_noise.csv', index=False, header = False)






#%%

# =============================================================================
# noise_without_noise = noise[noise['name'] != 'noise']
# print("No of door noise", noise_without_noise)
# noise_without_door.to_csv('noise_door_without.csv', index=False, header = False)
# 
# 
# noise_noise = noise[noise['name'] == 'noise']
# print("No of door noise", noise_noise)
# door_noise.to_csv('noise_noise.csv', index=False, header = False)
# =============================================================================


#%%
# =============================================================================
# noise_without_fan= noise[noise['name'] != 'fan']
# print("No of door noise", noise_without_fan)
# noise_without_door.to_csv('noise_without_fan.csv', index=False, header = False)
# 
# 
# noise_fan = noise[noise['name'] == 'fan']
# print("No of door noise", noise_fan)
# door_noise.to_csv('noise_fan.csv', index=False, header = False)
# =============================================================================

#%%
# =============================================================================
# noise = pd.read_csv('noise.csv', header = None)
# noise.columns = ['name', 'path']
# print(noise.head())
# noisetable = noise['name'].value_counts()
# print(noisetable)
# 
# noisetable.to_csv('Total_noise_types.csv')
# 
# noise = pd.read_csv('noise_cv.csv', header = None)
# noise.columns = ['name', 'path']
# 
# print(noise.head())
# CAF = noise[noise['name'] == 'CAF']
# 
# noisetable = noise['name'].value_counts()
# print(noisetable)
# noisetable.to_csv('validation_noise_types.csv')
# 
# noise = pd.read_csv('noise_tt.csv', header = None)
# noise.columns = ['name', 'path']
# print(noise.head())
# noisetable = noise['name'].value_counts()
# print(noisetable)
# noisetable.to_csv('testing_noise.csv')
# =============================================================================
# CAF = noise[noise['name'] == 'CAF']
# PED = noise[noise['name'] == 'PED']
# STR = noise[noise['name'] == 'STR']
# BUS = noise[noise['name'] == 'BUS']
# bus = noise[noise['name'] == 'Bus']
# BUS = pd.concat([bus, BUS], ignore_index=True)

'''
music = noise[noise['name'] == 'music']
Music = noise[noise['name'] == 'Music']
music = pd.concat([music, Music], ignore_index=True)
door = noise[noise['name'] == 'door']
typing = noise[noise['name'] == 'typing']
fan = noise[noise['name'] == 'fan']
vehicle = noise[noise['name'] == 'Vehicle']
squeak = noise[noise['name'] == 'squeak']
bird = noise[noise['name'] == 'Bird']
guitar = noise[noise['name'] == 'Guitar']
drum = noise[noise['name'] == 'Drum']
fowl = noise[noise['name'] == 'Fowl']
'''         
'''
music.to_csv('musicNoise.csv', index=False, header = False)
door.to_csv('doorNoise.csv', index=False, header = False)
typing.to_csv('typingNoise.csv', index=False, header = False)
fan.to_csv('fanNoise.csv', index=False, header = False)
vehicle.to_csv('vehicleNoise.csv', index=False, header = False)
squeak.to_csv('squeakNoise.csv', index=False, header = False)
bird.to_csv('birdNoise.csv', index=False, header = False)
guitar.to_csv('guitarNoise.csv', index=False, header = False)
drum.to_csv('drumNoise.csv', index=False, header = False)
fowl.to_csv('fowlNoise.csv', index=False, header = False)
'''
# CAF.to_csv('CAFNoise.csv', index=False, header = False)
# PED.to_csv('PEDNoise.csv', index=False, header = False)
# STR.to_csv('STRNoise.csv', index=False, header = False)
# BUS.to_csv('BUSNoise.csv', index=False, header = False)

# noise = pd.read_csv('noise.csv', header = None)
# noise.columns = ['name', 'path']
# print(noise.head())
# noisetable = noise['name'].value_counts()
# print(noisetable)




