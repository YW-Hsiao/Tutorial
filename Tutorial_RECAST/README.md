## 2. RECAST
### 2-1. Creating a new workflow
If you have no `docker container`, recommend to use python virtual environment. First install the python3-venv package (You may need to use sudo with that command. After installing the python3-venv package, recreate your virtual environment.)
```
apt-get install python3-venv
```
```
...
The following additional packages will be installed:
  python3.8-venv
The following NEW packages will be installed:
  python3-venv python3.8-venv
...
```


If you have `docker container`, you can go into a container in server, start a terminal.
```
git clone https://github.com/vladov3000/recast_workflow.git (old version)
git clone https://github.com/edvb/recast_workflow.git
pip3 install ./recast_workflow
```
```
ERROR: pylhe 0.2.0 has requirement networkx>=2.2, but you'll have networkx 1.11 which is incompatible.
```
In root site or recast_workflow site, you can use
```
recast-wf make new
```
The feedback is
```
--------------------------------------------------
Combination 1:
STEP                NAME                          
generation          madgraph_pythia               
analysis            madanalysis                   
--------------------------------------------------
Combination 2:
STEP                NAME                          
generation          madgraph_pythia               
selection           rivet                         
statistics          contur                        
--------------------------------------------------

Add an additional common input or enter 'done' to continue:
```
You can find a list of the available common inputs by running
```
recast-wf make inputs

INPUT               DESCRIPTION                                                 STEPS                                   
analysis_id         The inspire ID of the analysis that should be used.         ['selection', 'analysis']
```
In our case, we are interested in reusing an analysis with inspire ID of `ATLAS_2016_I1458270`.
```
Add an additional common input or enter 'done' to continue: analysis_id=ATLAS_2016_I1458270
--------------------------------------------------
Combination 1:
STEP                NAME                          
generation          madgraph_pythia               
selection           rivet                         
statistics          contur                        
--------------------------------------------------
Current common inputs used:
        analysis_id=ATLAS_2016_I1458270

Add an additional common input or enter 'done' to continue: done
1
y
y
```
Show the workflow to see how it looks like.


### 2-2. Running a new workflow
Now, the workflow is stored in the inventory. You can add, remove, and list workflows in the inventory with the `recast-wf inv add PATH`, `recast-wf inv rm NAME`, and `recast-wf inv ls` commands, respectively. Check our workflow is saved in the inventory using the list command,
```
recast-wf inv ls

--------------------------------------------------------------------------------
WORKFLOW NAMES                          TIME LAST MODIFIED                      
--------------------------------------------------------------------------------
madgraph_pythia-rivet-contur            Thu Apr 15 13:18:46 2021
```
Next, we can retrieve a directory with our workflow we can fill in with our inputs.
```
recast-wf inv getdir madgraph_pythia-rivet-contur .
cd madgraph_pythia-rivet-contur
```
We will get `madgraph_pythia-rivet-contur` folder, inside this folder include two folders and a `.sh` file: `inputs`, `workflows`, and `run.sh`, respectively. The `workflows` folder has a file calles `workflow.yml` which contains the full workflow we previously generated. `run.sh` is just a quick run shell script for the analysis.
```
vim ./inputs/input.yml
```
Or open `./inputs/input.yml`, The contents of the file have:
```
analysis_id: null
n_events: null
proc_card: null
ufotar: null
```
The `inputs` folder contains all your input files and `input.yml` file which maps the input names to their values. We will require an input file, so in the `inputs` folder create a new file called `proc_card_dm.dat`, and write the MadGraph process:
```
cd inputs
vim proc_card_dm.dat

import model DMsimp_s_spin1 --modelname
generate p p > xd xd~ j
```
or
```
import model DMsimp_s_spin1
define j = g u c d b s t u~ c~ d~ b~ s~ t~
generate p p > xd xd~ @0
add process p p > xd xd~ j @1
add process p p > xd xd~ j j @2
```
Editor
```
vim input.yml

analysis_id: ATLAS_2016_I1458270
n_events: 1000
proc_card: 'proc_card_dm.dat'
ufotar: null
```
```
cd ..
./run.sh (??)
bash -e run.sh
```
Otherwise, we would have to type in the full `yadage` command to run the workflow:
```
cd madgraph_pythia-rivet-contur
yadage-run workdir workflows/workflow.yml inputs/input.yml -d initdir=$PWD/inputs

Error: Workflow failed: workflow finished but failed
```












###### tags: `Particle Physics`, `Showering`, `.hepmc`, `Detector Simulation`, `.root`