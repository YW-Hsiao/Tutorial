#!/bin/bash
# Program:
#     Just own test
# Author: You-Wei Hsiao
# Date: 2021/03/17
# Version: v.1.0



# $0=2
function echoHello() {
    # hello world, rock!!
    echo "${0} hello ${1}, ${2}!!"
}

echoHello 'world' 'rock'


echo "$0"
echo "$1"
echo "$#"
echo "$*"
echo "$@"
echo "$?"
echo "$$"
echo "----------"


echo "\$0 = $0"
echo "\$n = $n"
echo "\$# = $#"
echo "\$\$ = $$"

# ??還不是很懂這些是什麼??