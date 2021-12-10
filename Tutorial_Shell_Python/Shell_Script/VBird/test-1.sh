#!/bin/bash
# Program:
#     This program record important thing.
# Author: You-Wei Hsiao
# History: 2021/03/16
#     First release
# Version: v.1.0
# Reference: http://linux.vbird.org/linux_basic/0340bashshell-scripts.php



# Setup environment and variables





for i in $(seq 1 10); do
    echo $i
done
echo "----------"
for i in {1..5}; do
    echo $i
done
echo "----------"
for i in {a..f}; do
    echo $i
done