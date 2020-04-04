#!/bin/bash
###
 # @Date: 2020-04-03 23:50:14
 # @LastEditTime: 2020-04-04 18:01:30
 ###
set -euox pipefail
# | sed -e "s/[^\n a-zA-Z]//g" \
#cat ./test_sed \
main(){
    cat ${1} \
    | tr 'A-Z' 'a-z' \
    | sed -e  "s/_/ /g" \
    | sed -e  "s/\([a-z]\+\)\('s\)\(\\b\)/\1_s /g" \
    | sed -e  "s/\([a-z]\+\)\('t\)\(\\b\)/\1_t /g" \
    | sed -e  "s/[^ a-z_]/ /g" \
    | sed -e  "s/_s /'s /g" \
    | sed -e  "s/_t /'t /g" \
    | tr -s ' ' '\n' \
    | sed '/^$/d' \
    | sort \
    | uniq -c \
    | sort -nr \
    > ${2}
}
if [[ ${#} -ne 2 ]]; then
    echo "error, para number should be 2"
    echo "${#} para will make return"
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
