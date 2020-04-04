#!/bin/bash
###
 # @Date: 2020-04-03 23:50:14
 # @LastEditTime: 2020-04-04 18:56:50
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
