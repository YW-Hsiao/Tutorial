# Tips
Tool Tips

## First Installation (`mg_v2_9_3_test1`)
### Step 1:
```
mkdir mg_v2_9_3
wget https://launchpad.net/mg5amcnlo/2.0/2.9.x/+download/MG5_aMC_v2.9.3.tar.gz
tar -xvf MG5_aMC_v2.9.3.tar.gz
cd MG5_aMC_v2_9_3/
./bin/mg5_aMC
```

### Step 2:
```
install Delphes
install pythia8
```

### Step 3:
```
generate p p > e- e+
output /mg_v2_9_3/ppee
launch /mg_v2_9_3/ppee
```
We can get
```
INFO: compile directory 
Not able to open file /mg_v2_9_3/ppee/crossx.html since no program configured.Please set one in ./input/mg5_configuration.txt

Cross-section :   838.3 +- 3.352 pb
Nb of events :  10000

fail
Failed to access python version of LHAPDF: If the python interface to LHAPDF is available on your system, try adding its location to the PYTHONPATH environment variable and theLHAPDF library location to LD_LIBRARY_PATH (linux) or DYLD_LIBRARY_PATH (mac os x).The required LD_LIBRARY_PATH is /root/LHAPDF_6_3_0/lib
```
It seems there is error for LHAPDF

### Step 4 (`test1.log`):
```
./bin/mg5_aMC
import model DMsimp_s_spin1
```
We get
```
Command "import model DMsimp_s_spin1" interrupted with error:
InvalidCmd : UFO model not python3 compatible. You can convert it via the command 
	convert model /mg_v2_9_3/MG5_aMC_v2_9_3/models/DMsimp_s_spin1
	You can also type "set auto_convert_model T" to automatically convert all python2 module to be python3 compatible in the future.
```
So that I use (MG5_aMC>)
```
set auto_convert_model T
```
The feedback is
```
save options auto_convert_model
save configuration file to /mg_v2_9_3/MG5_aMC_v2_9_3/input/mg5_configuration.txt
```
Again `import model DMsimp_s_spin1`, it show
```
fail to load model but auto_convert_model is on True. Trying to convert the model
convert model /mg_v2_9_3/MG5_aMC_v2_9_3/models/DMsimp_s_spin1
retry the load of the model
import model DMsimp_s_spin1
INFO: load particles 
INFO: load vertices 
INFO: Change particles name to pass to MG5 convention 
Pass the definition of 'j' and 'p' to 5 flavour scheme.
Kept definitions of multiparticles l+ / l- / vl / vl~ unchanged
Defined multiparticle all = g ghg ghg~ u c d s b u~ c~ d~ s~ b~ a gha gha~ ve vm vt e- mu- ve~ vm~ vt~ e+ mu+ t t~ z w+ ghz ghwp ghwm h xr xc y1 w- ghz~ ghwp~ ghwm~ xc~ ta- xd ta+ xd~
INFO: Change particles name to pass to MG5 convention 
Kept definitions of multiparticles p / j / l+ / l- / vl / vl~ unchanged
Defined multiparticle all = g ghg ghg~ u c d s b u~ c~ d~ s~ b~ a gha gha~ ve vm vt e- mu- ve~ vm~ vt~ e+ mu+ t t~ z w+ ghz ghwp ghwm h xr xc y1 w- ghz~ ghwp~ ghwm~ xc~ ta- xd ta+ xd~
```
```
exit
```

### Step 5:
Again use MG 2.9.3
```
./bin/mg5_aMC
define j = g u c d b s t u~ c~ d~ b~ s~ t~ 
generate p p > xd xd~ @0
add process p p > xd xd~ j @1
add process p p > xd xd~ j j @2
output /mg_v2_9_3/svj_s-channel/s_interface
launch /mg_v2_9_3/svj_s-channel/s_interface
enter
set run_card nevents 10000
set run_card ebeam1 7000.0
set run_card ebeam2 7000.0
set run_card pdlabel lhapdf
set iseed 300
set MXd 10
set MY1 1500
set gVXd 1 
set gVd11 0.1 
set gVu11 0.1 
set gVd22 0.1 
set gVu22 0.1 
set gVd33 0.1
set gVu33 0.1 
set decay wy1 auto
enter
```
Feedback is
```
INFO: Combining runs 
sum of cpu time of last step: 1m10s
INFO: finish refine 
refine 10000 --treshold=0.9
No need for second refine due to stability of cross-section
INFO: Combining Events 
  === Results Summary for run: run_01 tag: tag_1 ===

     Cross-section :   1.248 +- 0.003181 pb
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
more information in /mg_v2_9_3/svj_s-channel/s_interface/index.html
MG5_aMC>
```

### Step 6 (`test2.log`):
Use script `Zpxdxdx.txt` and `nohup ./bin/mg5_aMC /mg_v2_9_3/svj_s-channel/Zpxdxdx.txt > /mg_v2_9_3/svj_s-channel/Zpxdxdx.log 2>&1 &`
```
INFO: Combining Events 
  === Results Summary for run: run_01 tag: tag_1 ===

     Cross-section :   1.15 +- 0.002753 pb
     Nb of events :  10000
 
fail
ESC[1;34mFailed to access python version of LHAPDF: If the python interface to LHAPDF is available on your system, try adding its location to the PYTHONPATH environment variable and theLHAPDF library location to LD_LIBRARY_PATH (linux) or DYLD_LIBRARY_PATH (mac os x).The required LD_LIBRARY_PATH is /root/LHAPDF_6_3_0/libESC[0m
INFO: can not run systematics since can not link python to lhapdf 
store_events
```






## SSH
In local terminal,
```
ssh-keygen
cd .ssh
```
Copy/paste content of `id_rsa.pub` to `~/.ssh/authorized_keys` of server `CPU-workstation`.
Accomplish the ssh key setup.
Therefore, we no need to enter password when sign in CPU server.  
And then we also want to no password to sign in container.
In CPU-workstation terminal,
```
ssh-keygen
cd .ssh
```
Copy/paste content of `id_rsa.pub` to `/home/user/.ssh/authorized_keys` of container `yw_HEP_ssh_server` .
Accomplish the ssh key setup.  
Go to VS Code to set...
In local PC, edit `.ssh/config`
```
Host CPU-workstation
  HostName 192.168.88.247
  User user
  Port 6688
  ProxyCommand ssh youwei@140.114.94.174 -W %h:%p
```



## CPU-workstation
### Useful Commands
```
ssh-keygen
echo "ssh-rsa key.pub" >> authorized_keys
alias
du -h --max-depth=1
less known_hosts
```

For docker
```
docker run --restart always --name yw_HEP_ssh_server --memory=150g -p 6688:22 -v /Storage/youwei:/youwei_home -v /u3/youwei-u3:/youwei_u3 -it alan200276/ubuntu:HEPtools /usr/sbin/sshd -D
ssh -p6688 user@192.168.88.247
docker exec -u user -it yw_HEP_ssh_server /bin/bash
docker exec -it yw_HEP_ssh_server /bin/bash
docker exec -it huichi_ssh_server /bin/bash
```


### Docker Image
Create a docker image `alan200276/ubuntu:HEPtools_youwei`:
```
docker attach youwei_test
exit
docker ps
docker commit -m "youwei MG5 2.9.3" youwei_test ubuntu:HEPtools_youwei
docker images
docker tag  ubuntu:HEPtools_youwei alan200276/ubuntu:HEPtools_youwei
docker push alan200276/ubuntu:HEPtools_youwei
```


### SSH Docker Container
Generate ssh key in the local PC:
```
ssh-keygen
```

Create a `yw_HEP_ssh_CPUServer` container in server terminal and assign a port number (e.g. 7788):
```
docker run --restart always --name yw_HEP_ssh_CPUServer --cpus="60" --memory=200g -p 7788:22 -v /Storage/youwei:/youwei_home -v /u3/youwei-u3:/youwei_u3 -it alan200276/ubuntu:HEPtools_youwei /usr/sbin/sshd -D
```

But we don't see anything, so we need to leave the conainer:
```
ctrl+p and ctrl+q
```

Use this command to enter the container to check anything being fine:
```
ssh -p7788 user@192.168.88.247
```

Tips:
```
docker exec -u user -it yw_HEP_ssh_CPUServer /bin/bash (user access)
docker exec -it yw_HEP_ssh_CPUServer /bin/bash (root access)
```

We can see everyone PID in server:
```
getent group
```

Use `root` or `user` access to enter the container and go to `.ssh` to put the key into the container: (I prefer to use `root` access)
```
docker exec -it yw_HEP_ssh_CPUServer /bin/bash
cd /home/user/.ssh
vim authorized_keys
echo "id_rsa.pub of local PC" >> authorized_keys
less known_hosts ??
```

And then use `root` access to change group and mode:
```
getent group
groupadd -g 2100 youwei
adduser user youwei
chgrp youwei -R youwei_u3
chmod g+rwx -R youwei_u3
chgrp youwei -R youwei_home
chmod g+rwx -R youwei_home
chgrp -R youwei /root
chmod g+rwx -R /root
exit
```

Tips: Group
```
chown -R user:user Test
chgrp -R user Test
chmod -R g+rwx Test
```





