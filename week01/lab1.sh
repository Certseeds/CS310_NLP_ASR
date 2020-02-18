#!/bin/bash
set -eoux pipefail
###
 # @Github: https://github.com/Certseeds
 # @Organization: SUSTech
 # @Author: nanoseeds
 # @Date: 2020-02-18 09:26:15
 # @LastEditors: nanoseeds
 # @LastEditTime: 2020-02-18 09:42:04
 ###
correct_input="yes"
lab1_path=./xxx/lab1.txt
echo "Input yes to get lab1.txt."
read input
if [[ ${input} == ${correct_input} ]];then
  cat ${lab1_path}
else
  echo "nothing to do"
fi
