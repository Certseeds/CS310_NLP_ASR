#!/bin/bash
set -eo pipefail
###
 # @CreateDate: 2020-04-03 17:36:11
 # @LastEditTime: 2020-04-04 18:56:37
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
main(){
    declare -A word_time=() ;
    count=0
    for after in $(cat ${1}) ; do
        #after=$(sed -e "s/[^ a-zA-Z]//g" <<< ${i} | tr 'A-Z' 'a-z')
        if [[ -n ${after} ]] ; then
            if [[ word_time[${after}] -eq 0 ]] ; then
                word_time[${after}]=1
            else
                word_time[${after}]=$((${word_time[${after}]}+1))
            fi
        fi
        count=$((${count}+1))
    done 
    echo $(date "+%Y%m%d-%H%M%S")
    count=0
    for key in ${!word_time[@]} ; do
        echo ${key}
        echo ${word_time[${key}]}
        count=$((${count}+1))
    done
}
echo $(date "+%Y%m%d-%H%M%S")
if [[ ${#} -ne 2 ]]; then
    exit 1;
fi
if [[ -e  ${2} ]] ; then
    rm -rf ${2}
fi
touch ${2}
echo ${1}
echo ${2}
main ${1} ${2}
echo $(date "+%Y%m%d-%H%M%S")
