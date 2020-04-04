#!/bin/bash
set -eox pipefail
###
 # @CreateDate: 2020-04-03 09:53:37
 # @LastEditTime: 2020-04-04 18:27:25
 ###
replace="-"
main(){
    declare -A name_id=() ;
    count=0
    while read -r i ; do
        if [[ count -ne 0 ]] ; then
            array=(${i}) ;
            echo ${array[1]//./${replace}}
            # !in there, because we use declare -A
            # so we can not use set -u in the head. 
            name_id[${array[1]//./${replace}}]=${array[0]} ;
        fi
        count=$((${count}+1))
    done < ${1} 
    #names=$(cat ${2}) ;
    count=0
    for i in $(cat ${2}) ; do
        # echo ${i} ;
        # echo ${i//./_} ;
        # echo ${name_id[${i//./_}]} ;
        echo ${name_id[${i//./${replace}}]} >> ${3} ;
        count=$((${count}+1)) ;
    done
    echo ${count}
}
use_base_en(){
    test=$(echo -n "1145141919810" | base64 );
    test_out=$(base64 -d <<< ${test})
}
get_map(){
    count=0
    while read -r i ; do
        if [[ count -ne 0 ]] ; then
            echo ${i} 
            array=(${i})
            echo ${array[0]}      
            echo ${array[1]}
        fi
        count=$((${count}+1))
    done < ${1}
    echo ${count}
}
get_name(){
    names=$(cat ${2}) ;
    count=0
    for i in ${names} ; do
        echo ${i}
        count=$((${count}+1))
    done
    echo ${count}
}
if [[ ${#} -ne 3 ]]; then
    exit 1;
fi
if [[ -e  ${3} ]] ; then
    rm -rf ${3}
fi
touch ${3}
echo ${1}
echo ${2}
echo ${3}
main ${1} ${2} ${3} ;