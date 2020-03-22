#!/bin/bash
set -eoux pipefail
###
 # @Github: https://github.com/Certseeds/CS310_NLP_ASR
 # @Organization: SUSTech
 # @Author: nanoseeds
 # @Date: 2020-03-22 11:09:22
 # @LastEditors: nanoseeds
 # @LastEditTime: 2020-03-22 18:37:12
 ###
# kaldi/egs/yesno/s5/
train_cmd="utils/run.pl"
decode_cmd="utils/run.pl"
nj=1

if [[ ! -e "waves_yesno.tar.gz" ]] ; then
  wget http://www.openslr.org/resources/1/waves_yesno.tar.gz || exit 1;
  # was:
  # wget http://sourceforge.net/projects/kaldi/files/waves_yesno.tar.gz || exit 1;
fi
if [[ -d waves_yesno ]]; then
    rm -rf ./waves_yesno
fi
if [ ! -d waves_yesno ]; then
  tar -xvzf waves_yesno.tar.gz || exit 1;
  cd ./waves_yesno
  rm "README"
  rm "README~"
  # Ｉ cannot believe if do not delete them
  # the script will think thay are .wav files. 
  cd ..
fi
train_base_name=train_yesno
test_base_name=test_yesno

rm -rf data exp mfcc

# Data preparation

local/prepare_data.sh waves_yesno
local/prepare_dict.sh
utils/prepare_lang.sh \
    --position-dependent-phones false \
    data/local/dict "<SIL>" data/local/lang data/lang
local/prepare_lm.sh

# Feature extraction
for x in ${train_base_name} ${test_base_name} ; do 
 steps/make_mfcc.sh --nj ${nj} data/$x exp/make_mfcc/$x mfcc
 steps/compute_cmvn_stats.sh data/$x exp/make_mfcc/$x mfcc
 utils/fix_data_dir.sh data/$x
done

# Mono training
steps/train_mono.sh \
    --nj ${nj} --cmd "$train_cmd" \
    --totgauss 400 data/${train_base_name} \
    data/lang exp/mono0a
  
# Graph compilation  
utils/mkgraph.sh data/lang_test_tg exp/mono0a exp/mono0a/graph_tgpr

# Decoding
steps/decode.sh --nj ${nj} --cmd "$decode_cmd" \
    exp/mono0a/graph_tgpr data/test_yesno exp/mono0a/decode_test_yesno

for x in exp/*/decode*; do 
    [ -d $x ] && grep WER $x/wer_* | utils/best_wer.sh; 
done
