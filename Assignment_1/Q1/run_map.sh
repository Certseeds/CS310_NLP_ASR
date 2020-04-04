#!/bin/bash
set -eoux pipefail
###
 # @Date: 2020-04-03 10:34:44
 # @LastEditTime: 2020-04-03 17:11:55
 ###
path="./log"
time=$(date "+%Y%m%d-%H%M%S")
echo ${time}
./map.sh \
    ./name_id_map.txt \
    ./input_name.txt \
    ./output_id.txt \
    2>&1 | \
    tee -a ${path}/${time}.log
echo $(date "+%Y%m%d-%H%M%S") >> ${path}/${time}.log
diff ./output_id.txt ./sample_output_id.txt 2>&1 > diff.log
if [[ -s ./diff.log  ]] ; then
    echo "Not enough" ;
else 
    echo "finish" ;
fi