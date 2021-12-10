#!/bin/bash
# Program:
#     Tutorial about shell script: https://blog.techbridge.cc/2019/11/15/linux-shell-script-tutorial/
# Author: You-Wei Hsiao
# Date: 2021/03/16
# Version: v.1.0



# 5.
echo "------5. 迴圈------"
echo "------5-1. for------"
for loop in 1 2 3; do
    echo "number: $loop"
done


echo "------5-2. while------"
counter=0
while [ $counter -le 5 ]; do
    counter=`expr $counter + 1`
    echo $counter
done

echo "variable counter = $counter"
echo "Another approach do while"
counter=0
while [ $counter -le 3 ]; do
    counter=$(($counter+1))
    echo $counter
done


echo "------5-3. until------"
counter=0
until [ $counter -gt 10 ]; do
    echo $counter
    counter=`expr $counter + 1`
done

echo "change command order and use \$(())"
counter=0
until [ $counter -gt 10 ]; do
    counter=$(($counter + 1))
    echo $counter
done

echo "greater equal 5"
counter=0
until [ $counter -ge 5 ]; do
    counter=$(($counter + 1))
    echo $counter
done

