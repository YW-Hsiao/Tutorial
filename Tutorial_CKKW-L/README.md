## Abstract
This repository is about tutorial of hepmc.


## 1. hepmc and CKKW-L
Go to pythia8245/examples, you can find main89ckkwl.cmnd and startup executable:
```
cd <where>/pythia8245/examples
make main89
```
In pythia8245/examples, use following command to accomplish the showering simulation:
```
./main89 <where>/main89ckkwl.cmnd <where>/sm.hepmc
```
And then go into Delphes-3.4.2 folder:
```
cd <where>/Delphes-3.4.2
make
```
Prepare your .hepmc and .tcl files to do the detector simulation:
```
./DelphesHepMC config_file.tcl output_file.root [input_file(s).hepmc]
e.g.
./DelphesHepMC delphes_card_ATLAS.tcl sm.root sm.hepmc
```

