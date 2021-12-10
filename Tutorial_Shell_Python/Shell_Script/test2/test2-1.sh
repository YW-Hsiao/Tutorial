#!/bin/bash
# Program:
#     Tutorial about shell script: https://blog.techbridge.cc/2019/11/15/linux-shell-script-tutorial/
# Author: You-Wei Hsiao
# Date: 2021/03/16
# Version: v.1.0



# 0.
echo "-----0.------"
echo 可以包涵“” 也可以不用


# 1.
echo ------1.------
echo "=== 將目前執行 process 的 PID 依照數字大小排序，取出前 10 名 === "
ps | awk '{print $1}' | sort -rn | head -10


# 2.
echo ------2. 變數------
variable1=value
variable2='value 2'
variable3="value 3"
echo "$variable1"
echo "$variable2"
echo "$variable3"
echo '$variable3'

pathName=demo1.sh
echo ${pathName}
pathName=demo2.sh
echo ${pathName}

pathName=demo.sh
echo ${pathName}
unset pathName
echo ${pathName}


# 3.
echo "------3. 運算式------"
result=`expr 10 + 2`
echo "Result: $result"
echo Result: $result

x=10
y='3'
echo "Result1: $((x+y))"
echo "Result2: $((${x}+${y}))"