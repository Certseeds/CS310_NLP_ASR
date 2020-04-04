#!/bin/bash
set -eo pipefail
###
 # @CreateDate: 2020-04-03 17:36:11
 # @LastEditTime: 2020-04-03 23:35:26
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
