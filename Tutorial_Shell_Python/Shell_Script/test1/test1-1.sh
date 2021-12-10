#!/bin/bash
# Program:
#     Tutorial about shell script: https://medium.com/@yihengwu/%E7%A8%8B%E5%BC%8F%E7%AD%86%E8%A8%98-shell-script-%E7%B0%A1%E6%98%93%E7%AD%86%E8%A8%98-841cfc3ae3ab
    
    
# Author: You-Wei Hsiao
# Date: 2021/03/16
# Version: v.1.0



# 1.
echo "1. 基本輸入與輸出"
read -p "Please enter your age:" age
echo "你輸入的年齡是 $age 歲"
echo "你輸入的年齡是 ${age} 歲"

echo "\$?=$?"
echo "\$1=$1"
echo "\$0=$0"
echo "\$@=$@"

echo "你們輸入的年齡是 $age 歲"
echo '你們輸入的年齡是 $age 歲'


# 2.
echo "2. 運算"
n=1
m=2
echo "\$n+\$m=$n+$m"
echo "\$((n+m))=$((n+m))"


# 2-1. In test1-1.sh


# 3. 布林值
echo "3. 布林值"


# 4.
echo "4. 矩陣"
age=("34" "25" "29")
echo $age
echo ${age[1]}










# Program:
#	Program creates three files, which named by user's input and date command.
# History:
# 2015/07/16	VBird	First release