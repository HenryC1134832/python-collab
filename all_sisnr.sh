#!/usr/bin/env bash

echo "gen SL1 scp"

sh /media/HDD10TB/wthong_DATA/iptcloud_denoiser/main/tools/gen_scp_all_after_test.sh /media/HDD10TB/wthong_DATA/iptcloud_denoiser/MS_R1_SL1_saved_models /media/HDD10TB/wthong_DATA/iptcloud_denoiser/main

echo "gen SL2 scp"

sh /media/HDD10TB/wthong_DATA/iptcloud_denoiser/main/tools/gen_scp_all_after_test.sh /media/HDD10TB/wthong_DATA/iptcloud_denoiser/MS_R1_SL2_saved_models /media/HDD10TB/wthong_DATA/iptcloud_denoiser/main

#echo "gen SL3 scp"

sh /media/HDD10TB/wthong_DATA/iptcloud_denoiser/main/tools/gen_scp_all_after_test.sh /media/HDD10TB/wthong_DATA/iptcloud_denoiser/MS_R1_SL3_saved_models /media/HDD10TB/wthong_DATA/iptcloud_denoiser/main

echo "\n SL1 sisnr\n"

sh compute_sisnr.sh /media/HDD10TB/wthong_DATA/iptcloud_denoiser/MS_R1_SL1_saved_models /media/HDD10TB/wthong_DATA/iptcloud_denoiser/datasets/ner-300hr

echo "\n SL2 sisnr\n"

sh compute_sisnr.sh /media/HDD10TB/wthong_DATA/iptcloud_denoiser/MS_R1_SL2_saved_models /media/HDD10TB/wthong_DATA/iptcloud_denoiser/datasets/ner-300hr

echo "\n SL3 sisnr\n"

sh compute_sisnr.sh /media/HDD10TB/wthong_DATA/iptcloud_denoiser/MS_R1_SL3_saved_models /media/HDD10TB/wthong_DATA/iptcloud_denoiser/datasets/ner-300hr
