#!/bin/bash
# Program:
#     This program record important thing.
# Author: You-Wei Hsiao
# History: 2021/03/16
#     First release
# Version: v.1.0
# Reference: http://linux.vbird.org/linux_basic/0340bashshell-scripts.php



# Setup environment and variables


echo -e "This program will calculate pi value. \n"
echo -e "You should input a float number to calculate pi value.\n"
read -p "The scale number (10~10000) ? " checking
num=${checking:-"10"}           # 開始判斷有否有輸入數值
echo -e "Starting calculate pi value.  Be patient."
time echo "scale=${num}; 4*a(1)" | bc -lq


# 重新自己打一次code
