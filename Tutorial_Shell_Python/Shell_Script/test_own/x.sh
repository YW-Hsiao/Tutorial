#!/bin/bash
# Program:
#     This program record important thing.
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2021/03/17
#     First release
# Version: v.1.0



# Setup environment and variables
path_testown="/youwei_home/Tutorial/Shell_Script/test_own"
path_nexttest="$path_testown/nexttest"



echo "------Part 1------"
cd $path_testown
ls
ls > record.log 2>&1
echo "ls = $(ls)"
echo ab
echo "ab"
echo "a b"
echo a b

n=1
m=2
echo "failute"
echo $n $m

echo "------------"
echo $path_testown
echo $path_nexttest
cd $path_nexttest
ls