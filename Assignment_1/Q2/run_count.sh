#!/bin/bash
set -eou pipefail
###
 # @Date: 2020-04-03 17:36:18
 # @LastEditTime: 2020-04-04 18:56:57
 ###
### CS310_NLP_ASR
    # Copyright (C) 2020 Certseeds

    # CS310_NLP_ASR is free software: you can redistribute it and/or modify
    # it under the terms of the GNU Affero General Public License as
    # published by the Free Software Foundation, either version 3 of the
    # License, or (at your option) any later version.

    # CS310_NLP_ASR is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU Affero General Public License for more details.

    # You should have received a copy of the GNU Affero General Public License
    # along with this program.  If not, see <https://www.gnu.org/licenses/>.
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