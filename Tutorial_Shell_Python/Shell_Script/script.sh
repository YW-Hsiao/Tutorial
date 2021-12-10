#!/bin/bash
# Program:
#     This program record important thing.
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2021/03/16
#     First release
# Version: v.1.0
# Reference: http://linux.vbird.org/linux_basic/0340bashshell-scripts.php


# Setup environment and variables


# Reference: https://www.opencli.com/linux/linux-date-format-shell-script
echo "------1.------"
echo "date:"
date

echo "------2.------"
now=$(date)
echo "date: $now"

echo "------3.------"
nowy=$(date +"%d-%m-%y")
nowY=$(date +"%d-%m-%Y")
echo $nowy
echo $nowY





