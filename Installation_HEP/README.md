# Installation_HEP
Install HEP tools

## MadGraph5_aMC v2.9.3
[MadGraph5_aMC v2.9.x](https://launchpad.net/mg5amcnlo/2.0/2.9.x)  
[LHAPDF: Installation instructions](https://lhapdf.hepforge.org/install.html)  
[TWiki: Installing MadGraph and LHAPDF at IHEP](https://twiki.cern.ch/twiki/bin/view/Sandbox/InstallingMadgraphAndLHAPF)  
[TWili: Vector Boson Scattering: Analysis Details](https://twiki.cern.ch/twiki/bin/view/CMSPublic/VectorBosonScattering)  
[MG5: how to indicate the path to the lhapdf-config executable input/mg5_configuration.txt](https://answers.launchpad.net/mg5amcnlo/+question/698333)  
[MG5: problem with LHAPDF set data NNPDF23_lo_as_0130_qed](https://answers.launchpad.net/mg5amcnlo/+question/692063)  
[MG5: Try to run MG_aMC_v2.3.3 and MG_aMC_v2.6.0 with LHAPDF_v6.2.1](https://answers.launchpad.net/mg5amcnlo/+question/670779)  
They were suggesting 6.1.6 for a very long period.

### Step 1: python3
Create a container without `-v`
```
docker run --name youwei_test --cpus="60" --memory=200g --net=host -it alan200276/ubuntu:HEPtools
```

Changing `python2` to `python3`, we need
```
which python
cd /usr/bin/
ls -al | grep python
python2.7 --version
python --version
python3 --version
rm python
ln -s python3 python
python
exit()
python --version
```
The output is
```
Python 3.8.5 (default, Jul 28 2020, 12:59:40) 
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
```

#### Tips:
```
ls /usr/bin/ | grep python
ls /usr/bin/ | grep python | grep 3.8
```

### Step 2: MadGraph5_aMC@NLO 2.9.x
Install MadGraph5_aMC v2.9.3 and simplified DM model with spin-1 mediator, and then convert the model to `python3`:
```
cd /
mkdir test_MG293
cd /root/legacy/
ls
wget https://launchpad.net/mg5amcnlo/2.0/2.9.x/+download/MG5_aMC_v2.9.3.tar.gz
tar -xvf MG5_aMC_v2.9.3.tar.gz
mv MG5_aMC_v2_9_3 /root/
cd MG5_aMC_v2_9_3/
./bin/mg5_aMC
>n (New Version of MG5 available! Do you want to update your current version? [n, y, on_exit][60s to answer])
(MG5_aMC>)
install Delphes
install pythia8
install MadAnalysis5
generate p p > e- e+
output /test_MG293/ppee
launch /test_MG293/ppee
>3 (switch off MadAnalysis5)
> (enter)
> (enter)
exit
```

Download the [simplified DM model with spin-1 mediator](https://feynrules.irmp.ucl.ac.be/wiki/DMsimp) within `models` or cope/paste DM model to `/PATH/MG5_aMC_v2_9_3/models/`
```
cd models/
ls
wget http://feynrules.irmp.ucl.ac.be/raw-attachment/wiki/DMsimp/DMsimp_s_spin1_v2.1.zip
unzip DMsimp_s_spin1_v2.1.zip

or
rsync -avh /root/MG5_aMC_v2_7_3/models/DMsimp_s_spin1 /mg_v2_9_3/MG5_aMC_v2_9_3/models/
```
Change model to `pythone3`:
```
cd ..
./bin/mg5_aMC
import model DMsimp_s_spin1
```
Type
```
set auto_convert_model T
exit
```
Use `less input/mg5_configuration.txt`, we can see
```
# MG5 MAIN DIRECTORY
mg5_path = /root/MG5_aMC_v2_9_3
auto_convert_model = True
```

!!!SKIP, NOT do it!!!  
Test DM model once, using `Zpxdxdx.txt` with/without `set run_card pdlabel lhapdf` and
```
nohup python3 ./bin/mg5_aMC /test_MG293/Zpxdxdx.txt > /test_MG293/Zpxdxdx.log 2>&1 &
```
Actually, the MG5_aMC v2.9.3 will download correct lhapdf, so the result is cross-section 1.15 +- ... .  
!!!SKIP, NOT do it!!!

#### Result
The simulation result is
```
INFO: Combining runs 
sum of cpu time of last step: 36 seconds
INFO: finish refine 
refine 10000 --treshold=0.9
No need for second refine due to stability of cross-section
INFO: Combining Events 
  === Results Summary for run: run_01 tag: tag_1 ===

     Cross-section :   838.3 +- 3.352 pb
     Nb of events :  10000
 
fail
Failed to access python version of LHAPDF: If the python interface to LHAPDF is available on your system, try adding its location to the PYTHONPATH environment variable and theLHAPDF library location to LD_LIBRARY_PATH (linux) or DYLD_LIBRARY_PATH (mac os x).The required LD_LIBRARY_PATH is /root/LHAPDF_6_3_0/lib
INFO: can not run systematics since can not link python to lhapdf 
store_events
INFO: Storing parton level results 
INFO: End Parton 
reweight -from_cards
decay_events -from_cards
INFO: storing files of previous run 
INFO: Done 
quit
INFO:  
more information in /test_MG293/ppee/index.html
```

For `install Delphes`, the important output is
```
In file included from classes/DelphesClasses.cc:29:
./classes/DelphesClasses.h:688:11: warning: ‘Candidate::ErrorD0’ will be initialized after [-Wreorder]
  688 |   Float_t ErrorD0;
      |           ^~~~~~~

and
In file included from classes/DelphesClasses.cc:29:
./classes/DelphesClasses.h:692:11: warning: ‘Candidate::ErrorP’ will be initialized after [-Wreorder]
  692 |   Float_t ErrorP;
      |           ^~~~~~

and
modules/FastJetFinder.cc:388:20: warning: catching polymorphic type ‘class fastjet::Error’ by value [-Wcatch-value=]
  388 |     catch(fastjet::Error)
      |                    ^~~~~
>> Compiling modules/FastJetGridMedianEstimator.cc
```

For `install MadAnalysis5`, the important output is
```
Note that Madanalysis5 for Python3 is still in ALPHA stage.
```

For `import model DMsimp_s_spin1`, the important output is
```
Command "import model DMsimp_s_spin1" interrupted with error:
InvalidCmd : UFO model not python3 compatible. You can convert it via the command 
	convert model /root/MG5_aMC_v2_9_3/models/DMsimp_s_spin1
	You can also type "set auto_convert_model T" to automatically convert all python2 module to be python3 compatible in the future.
```

For `set auto_convert_model T`, the output is
```
save options auto_convert_model
save configuration file to /root/MG5_aMC_v2_9_3/input/mg5_configuration.txt
```

### Step 3: Re-install LHAPDF
Re-install LHAPDF by using `python3`.  
Go to `LHAPDF-6.3.0` (cd LHAPDF-6.X.Y) , we can refer to `less INSTALL` and `less config.log`:
```
cd /root/legacy/LHAPDF-6.3.0
./configure --prefix=/root/LHAPDF_6_3_0_py3
make -j (or make)
make install
ls /root/
vim ~/.bashrc
export LHAPDFSYS=/root/LHAPDF_6_3_0_py3
export PATH=${PATH}:${LHAPDFSYS}/bin/
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${LHAPDFSYS}/lib/
export PYTHONPATH=$PYTHONPATH:/root/LHAPDF_6_3_0_py3/lib/python3.8/site-packages
source ~/.bashrc
```
The path is `/root/LHAPDF_6_3_0_py3/lib/python3.8/site-packages`.  
If check `ls /root/LHAPDF_6_3_0_py3/lib/`, there is `python3.8` folder.

or
```
vim ~/.bashrc
export LHAPDFSYS=/root/LHAPDF_6_3_0 -> export LHAPDFSYS=/root/LHAPDF_6_3_0_py3
export PYTHONPATH=$PYTHONPATH:/root/LHAPDF_6_3_0_py3/lib/python3.8/site-packages
source ~/.bashrc
```

### Step 4: Changing LHAPDF Path in MG5_aMC
Change LHAPDF path in MadGraph5_aMC v2.9.3:
```
cd MG5_aMC_v2_9_3/
./bin/mg5_aMC
set lhapdf_py3 /root/LHAPDF_6_3_0_py3/bin/lhapdf-config (NOT set lhapdf /root/LHAPDF_6_3_0_py3/bin/lhapdf-config)
exit
```
The feedback is
```
set lhapdf to /root/LHAPDF_6_3_0_py3/bin/lhapdf-config
save options lhapdf_py3
save configuration file to /root/MG5_aMC_v2_9_3/input/mg5_configuration.txt
```
Using `less input/mg5_configuration.txt`, We can see the difference
```
#! lhapdf-config --can be specify differently depending of your python version
#!  If None: try to find one available on the system
# lhapdf_py2 = lhapdf-config
# lhapdf_py3 = lhapdf-config -> lhapdf_py3 = /root/LHAPDF_6_3_0_py3/bin/lhapdf-config #
```

### Step 5: Test SM Model
Try to run MG5_aMC v2.9.3 again:
```
cd MG5_aMC_v2_9_3/
./bin/mg5_aMC
generate p p > e- e+
output /test_MG293/ppee_2
launch /test_MG293/ppee_2
>3 (switch off MadAnalysis5)
> (enter)
>set run_card pdlabel lhapdf
> (enter)
exit
```
The result is
```
INFO: Combining runs 
sum of cpu time of last step: 37 seconds
INFO: finish refine 
refine 10000 --treshold=0.9
No need for second refine due to stability of cross-section
INFO: Combining Events 
  === Results Summary for run: run_01 tag: tag_1 ===

     Cross-section :   980.1 +- 3.443 pb
     Nb of events :  10000
 
INFO: Running Systematics computation 
INFO:  Idle: 3,  Running: 1,  Completed: 0 [ current time: 14h35 ] 
INFO:  Idle: 0,  Running: 3,  Completed: 1 [  8.8s  ] 
INFO: # events generated with PDF: NNPDF23_nlo_as_0119 (230000) 
INFO: #Will Compute 145 weights per event. 
INFO: #***************************************************************************
#
# original cross-section: 979.8260815674352
#     scale variation: +15.8% -16.3%
#     central scheme variation: + 0% -20.8%
# PDF variation: +1.2% -1.2%
#
# dynamical scheme # 1 : 937.503 +16.8% -17.2% # \sum ET
# dynamical scheme # 2 : 937.503 +16.8% -17.2% # \sum\sqrt{m^2+pt^2}
# dynamical scheme # 3 : 776.213 +20.8% -20.9% # 0.5 \sum\sqrt{m^2+pt^2}
# dynamical scheme # 4 : 979.826 +15.8% -16.3% # \sqrt{\hat s}
#***************************************************************************
 
INFO: End of systematics computation
```

and
```
INFO: compile directory 
Not able to open file /mg_v2_9_3/ppee_2/crossx.html since no program configured.Please set one in ./input/mg5_configuration.txt
INFO: Using LHAPDF v6.3.0 interface for PDFs 
INFO: Trying to download NNPDF23_nlo_as_0119 
Unable to download /cvmfs/sft.cern.ch/lcg/external/lhapdfsets/current/NNPDF23_nlo_as_0119.tar.gz
NNPDF23_nlo_as_0119.tar.gz:    20.6 MB [100.0%] 
--2022-02-23 15:11:47--  http://lhapdfsets.web.cern.ch/lhapdfsets/current/NNPDF23_nlo_as_0119.tar.gz
...
```
MadGraph5_v2.9.3 is successfully installed!!

If we run `Zpxdxdx.txt` before re-install LHAPDF. Therefore, after `set run_card pdlabel lhapdf`, the feedback is
```
INFO: compile directory 
Not able to open file /test_MG293/ppee_2/crossx.html since no program configured.Please set one in ./input/mg5_configuration.txt
INFO: Using LHAPDF v6.3.0 interface for PDFs 

INFO: Trying to download NNPDF23_nlo_as_0119 
PDF already installed: NNPDF23_nlo_as_0119 (use --upgrade to force install)
--2022-02-25 14:34:53--  http://lhapdfsets.web.cern.ch/lhapdfsets/current/NNPDF23_nlo_as_0119.tar.gz
Resolving lhapdfsets.web.cern.ch (lhapdfsets.web.cern.ch)... 188.185.87.216, 188.185.90.87, 137.138.31.235, ...
Connecting to lhapdfsets.web.cern.ch (lhapdfsets.web.cern.ch)|188.185.87.216|:80... connected.
...
```

### Step 6: Test DM Model
Test DM model, using script `Zpxdxdx.txt`,
```
cd /test_MG293/
mkdir svj_s-channel
vim Zpxdxdx.txt
```
Copy/paste https://github.com/YW-Hsiao/SVJ_CKKWL/blob/main/s-channel_ckkwl-v2/Zpxdxd.txt and change paths to `/test_MG293/svj_s-channel`
```
cd /root/MG5_aMC_v2_9_3/
nohup python3 ./bin/mg5_aMC /test_MG293/svj_s-channel/Zpxdxdx.txt > /test_MG293/svj_s-channel/Zpxdxdx.log 2>&1 &
top
```
The result is
```
INFO: Combining runs 
sum of cpu time of last step: 3m04s
INFO: finish refine 
refine 10000 --treshold=0.9
No need for second refine due to stability of cross-section
INFO: Combining Events 
  === Results Summary for run: run_01 tag: tag_1 ===

     Cross-section :   1.15 +- 0.002753 pb
     Nb of events :  10000
 
INFO: Running Systematics computation 
INFO:  Idle: 1,  Running: 3,  Completed: 0 [ current time: 15h12 ] 
INFO:  Idle: 0,  Running: 3,  Completed: 1 [  9s  ] 
INFO: # events generated with PDF: NNPDF23_nlo_as_0119 (230000) 
INFO: #Will Compute 147 weights per event. 
INFO: #***************************************************************************
#
# original cross-section: 1.1508380984220206
#     scale variation: +12.7% -10.4%
#     emission scale variation: + 0% -10.4%
#     central scheme variation: +18.8% -2.34%
# PDF variation: +1.89% -1.89%
#
# dynamical scheme # 1 : 1.20835 +13.2% -10.7% # \sum ET
# dynamical scheme # 2 : 1.20835 +13.2% -10.7% # \sum\sqrt{m^2+pt^2}
# dynamical scheme # 3 : 1.36744 +14.7% -11.6% # 0.5 \sum\sqrt{m^2+pt^2}
# dynamical scheme # 4 : 1.12397 +12.3% -10.1% # \sqrt{\hat s}
#***************************************************************************
```
and
```
import /test_MG293/svj_s-channel/Zpxdxdx.txt
The import format was not given, so we guess it as command
import model DMsimp_s_spin1
fail to load model but auto_convert_model is on True. Trying to convert the model
convert model /root/MG5_aMC_v2_9_3/models/DMsimp_s_spin1
retry the load of the model
import model DMsimp_s_spin1
INFO: load particles 
INFO: load vertices 
INFO: Change particles name to pass to MG5 convention
```






