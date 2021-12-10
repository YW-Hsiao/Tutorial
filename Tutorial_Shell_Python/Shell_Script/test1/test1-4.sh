#!/bin/bash
# Program:
#     Tutorial about shell script: https://medium.com/@yihengwu/%E7%A8%8B%E5%BC%8F%E7%AD%86%E8%A8%98-shell-script-%E7%B0%A1%E6%98%93%E7%AD%86%E8%A8%98-841cfc3ae3ab
    
    
# Author: You-Wei Hsiao
# Date: 2021/03/16
# Version: v.1.0



# 6.
echo "6. 迴圈"
for loop in 1 2 3; do
    echo "number: $loop"
done

for loop in 1 2 3
do
echo "number: $loop"
done


echo -n "請問你要幾個檔案："
read F
for ((i=1 ; i<=F ; i++))

do

touch $i.js
echo $i

done
echo "已經給你 $F 個檔案囉！"