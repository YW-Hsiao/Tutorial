#!/bin/bash

path_examples="/root/pythia8245/examples"
path_cmnd="/youwei_home/Tutorial_hepmc/cmnd"
path_tutorialhepmc="/youwei_home/Tutorial_hepmc"



echo "Start Running"
date


cd $path_examples
nohup ./main89 $path_cmnd/main89ckkwl.cmnd $path_tutorialhepmc/sm.hepmc > $path_tutorialhepmc/sm.log 2>&1 &
