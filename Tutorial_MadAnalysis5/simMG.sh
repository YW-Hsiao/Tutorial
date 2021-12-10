#!/bin/bash
# Program:
#     This program is to do the MadGraph simultaion about mono-sbb.
#     This is a tutorial to learn how to use MadAnalysis5.
#     Zpn1n1hs.txt is with nevents 10000, ECM=13 TeV
#     MZP 2000, MDM 200, MHs 90
# Author: You-Wei Hsiao
# Institute: Department of Physics, National Tsing Hua University, Hsinchu, Taiwan
# Mail: hsiao.phys@gapp.nthu.edu.tw
# History: 2021/04/19
#     First release
# Version: v.1.0

# Setup environment and variables
now=$(date)
path_tutorial="/youwei_home/Tutorial_MadAnalysis5"
path_MG5v273="/root/MG5_aMC_v2_7_3"  # Where is your mg5_aMC


# Check your .txt file output & launch path, nevents, and ECM!!   ###
echo "Start Running"
echo "date: $now"
echo "Path of scrpit: $path_tutorial"
echo "Path of MG5: $path_MG5v273"
echo "Path of .txt and .log file: $path_tutorial"

cd $path_MG5v273
nohup ./bin/mg5_aMC $path_tutorial/Zpn1n1hs.txt > $path_tutorial/Zpn1n1hs.log 2>&1 &
