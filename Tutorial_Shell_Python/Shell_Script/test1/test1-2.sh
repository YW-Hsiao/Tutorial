#!/bin/bash
# Program:
#     Tutorial about shell script: https://medium.com/@yihengwu/%E7%A8%8B%E5%BC%8F%E7%AD%86%E8%A8%98-shell-script-%E7%B0%A1%E6%98%93%E7%AD%86%E8%A8%98-841cfc3ae3ab
    
    
# Author: You-Wei Hsiao
# Date: 2021/03/16
# Version: v.1.0



# 3.
read -p "Please enter your age:" age1
read -p "Please enter your friend's age:" age2

sum1=$age1+$age2
sum2=`expr $age1 + $age2`
sum3=$((age1+age2))

echo "你們輸入的年齡是 $age1 + $age2 歲"
echo "你們輸入的年齡是 $((age1 + age2)) 歲"

echo "你們輸入的年齡是 $sum1 歲"
echo "你們輸入的年齡是 $sum2 歲"
echo "你們輸入的年齡是 $sum3 歲"
