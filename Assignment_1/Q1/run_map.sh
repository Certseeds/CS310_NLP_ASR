#!/bin/bash
set -eoux pipefail
###
 # @Date: 2020-04-03 10:34:44
 # @LastEditTime: 2020-04-04 18:56:30
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