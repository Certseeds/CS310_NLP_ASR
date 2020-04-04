#!/bin/bash
set -eou pipefail
###
 # @Date: 2020-04-03 17:36:18
 # @LastEditTime: 2020-04-04 18:22:14
 ###
path="./log"
time=$(date "+%Y%m%d-%H%M%S")
echo ${time} ;
./count.sh \
    ./sample_input_corpus \
    ./stats.txt \
    2>&1 \
    | tee -a ${path}/${time}.log
    #> ${path}/${time}.log

echo $(date "+%Y%m%d-%H%M%S") >> ${path}/${time}.log ;

# diff ./stat.txt ./sample_output_stats.txt 2>&1 > diff.log 
size1=$(du -b ./stats.txt)
size1=(${size1})
size1=(${size1[0]})
size2=$(du -b ./sample_output_stats.txt)
size2=(${size2})
size2=(${size2[0]})
echo ${size1}
echo ${size2}
if [[ ${size1} -ne ${size2} ]] ; then
    echo "Not enough" ;
else 
    echo "finish" ;
fi