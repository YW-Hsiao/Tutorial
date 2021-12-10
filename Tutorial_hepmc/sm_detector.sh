#!/bin/bash

path_Delphes="/root/Delphes-3.4.2"
path_tutorialhepmc="/youwei_home/Tutorial_hepmc"



echo "Start Running"
date


cd $path_Delphes
nohup ./DelphesHepMC $path_tutorialhepmc/delphes_card_ATLAS.tcl $path_tutorialhepmc/sm.root $path_tutorialhepmc/sm.hepmc > $path_tutorialhepmc/sm_detector.log 2>&1 &
