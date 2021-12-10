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
now=$(date)
path_testown="/youwei_home/Tutorial/Shell_Script/test_own"



echo "Start Running"
echo "date: $now"

echo "------Part 1------"
cd $path_testown
ls
ls > record.log 2>&1  # Notice: .log save in /youwei_home/Tutorial/Shell_Script/test_own
echo "pwd1:"
pwd
pwd >> record.log 2>&1
echo "pwd2:"
cd ..
pwd
pwd >> $path_testown/record.log 2>&1  # Notice: .log save in /youwei_home/Tutorial/Shell_Script
echo "pwd3:"
cd ./test_own
pwd
pwd >> record.log 2>&1

echo "------Part 2------"
mkdir nexttest >> $path_testown/record.log 2>&1
cd ./nexttest
pwd
pwd >> $path_testown/record.log 2>&1

echo "------Part 3------"
touch test.txt
ls
ls >> $path_testown/record.log 2>&1
> abc.txt
echo "Hello World!!" > ech.txt
ls
ls >> $path_testown/record.log 2>&1



# 加上if判斷是否存在 nexttest folder.
# 目前都要手動刪除