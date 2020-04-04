#!/bin/bash
set -eo pipefail
###
 # @CreateDate: 2020-04-03 17:36:11
 # @LastEditTime: 2020-04-03 23:49:05
 ###
main(){
    declare -A word_time=() ;
    for i in $(cat ${1}) ; do
        echo $(sed -e "s/[^ a-zA-Z]//g" <<< ${i} | tr 'A-Z' 'a-z')
        echo ${i}
    done 
    array=("114 514 1919 810 114")
    for i in ${array} ; do
        if [[ word_time[${i}] -eq 0 ]] ; then
            word_time[${i}]=1
        else
            word_time[${i}]=$((${word_time[${i}]}+1))
        fi
    done
    
    count=0
    for key in ${!word_time[@]} ; do
        echo ${key}
        echo ${word_time[${key}]}
        count=$((${count}+1))
    done
}

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


cat sample_input_corpus \
    | sed 's/ /\n/g' \
    | sed -e "s/[^\n a-zA-Z]//g" \
    | sed '/^$/d' | sort \
    | uniq -c | awk '{print $1, $2}' \
    | sort -nrk2