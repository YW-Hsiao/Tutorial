#!/bin/bash
# Program:
#     Tutorial about shell script: https://blog.techbridge.cc/2019/11/15/linux-shell-script-tutorial/
# Author: You-Wei Hsiao
# Date: 2021/03/16
# Version: v.1.0



# 4.
echo "------4. 判斷條件------"
x=20
y=30

if [ $x == $y ]; then
    echo "value x is equal to value y"
fi

if [ $x != $y ]; then
    echo "value x is not equal to value y"
fi


echo "------if else------"
read -p "x=" x
read -p "y=" y
if [ $x -gt $y ]; then
    echo "value x is greater than value y"
else
    echo "value x is not greater than value y"
fi

if [ $x -lt $y ]; then
    echo "value x is less than value y"
else
    echo "value x is not less than value y"
fi

if [ $x == $y ]; then
    echo "value x is equal to value y"
else
    echo "value x is not equal to value y"
fi


echo "------if elif else------"
value1=20
value2=30
value3=30

if [ $value1 -gt $value2 ]; then
    echo "value1 is greater than value2"
elif [ $value1 == $value3 ]; then
    echo "value1 is equal to value3"
elif [ $value2 == $value3 ]; then
    echo "value2 is equal to value3"
else
    echo "other result"
fi


language='Java'

case $language in
    Java*) echo "是 Java！"
        ;;
    Python*) echo "是 Python！"
        ;;
    C*) echo "是 C！"
        ;;
    *) echo "沒 match 到！"
esac

