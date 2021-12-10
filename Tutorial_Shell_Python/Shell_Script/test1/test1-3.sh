#!/bin/bash
# Program:
#     Tutorial about shell script: https://medium.com/@yihengwu/%E7%A8%8B%E5%BC%8F%E7%AD%86%E8%A8%98-shell-script-%E7%B0%A1%E6%98%93%E7%AD%86%E8%A8%98-841cfc3ae3ab
    
    
# Author: You-Wei Hsiao
# Date: 2021/03/16
# Version: v.1.0



# 5.
echo "5. 條件判斷"
read -p "n=" n
read -p "m=" m
if [ $n -gt $m ]; then
    echo "n > m"
else
    echo "n is not > m"
fi


# m='MacDonald'

read -p "m=" m
case $m in
    MacDonald*) echo "Ronald McDonald"
        ;;
    KFC*) echo "Harland David Sanders"
        ;;
    TKK*) echo "阿勇"
        ;;
    *) echo "You are really health!"
esac