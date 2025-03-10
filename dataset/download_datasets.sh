#!/usr/bin/env bash

curl --header 'Host: www.openslr.org' \
--user-agent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0' \
--header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
--header 'Accept-Language: zh-TW,zh;q=0.8,en-US;q=0.5,en;q=0.3' \
--referer 'http://www.openslr.org/17/' --header 'Upgrade-Insecure-Requests: 1' 'https://www.openslr.org/resources/17/musan.tar.gz' \
--output 'musan.tar.gz'

tar zxvf musan.tar.gz

curl --header 'Host: storage.googleapis.com' \
--user-agent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0' \
--header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
--header 'Accept-Language: zh-TW,zh;q=0.8,en-US;q=0.5,en;q=0.3' --referer 'http://wham.whisper.ai/' \
--header 'Upgrade-Insecure-Requests: 1' 'https://storage.googleapis.com/whisper-public/wham_noise.zip' \
--output 'wham_noise.zip'

unzip wham_noise.zip