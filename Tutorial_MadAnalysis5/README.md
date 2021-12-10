# MadAnalysis5
Abstract: This program is about MadAnalysis5 tutorial.



## MadAnalysis5 Tutorial
I follow this [Tutorial: MadGraph5/Madanalysis5 Instructions-Dark Higgs](https://hackmd.io/@D2NCN-LxSNiAK6etDgTKYA/Hy3QfUCsw#MadAnalysis5-Instruction)


### 1-1. MadGraph5 instruction
1. First, we create a folder:
    ```
    mkdir Tutorial_MadAnalysis5
    cd Tutorial_MadAnalysis5
    ```
2. And then, we create a text file which is setting of mono-sbb, such as `Zpn1n1hs.txt`.
3. I use the shell script to implement:
    ```
    bash -e simMG.sh
    ```
    
    
### 1-2. MadAnalysis5 instruction-.lhe file
1. First, we analyze the `.lhe` file.
    ```
    cd <where>/madanalysis5
    ./bin/ma5
    /root/madanalysis5/bin/ma5
    20  # The number of core.
    import /youwei_home/Tutorial_MadAnalysis5/monosbb/Events/run_01/unweighted_events.lhe as sbb
    set sbb.xsection = 0.03373  #you can find this from previous part
    set main.lumi = 36  #set luminosity, roughly means how many collisions/events we could have with our collider. Here the number corresponds to the power of the LHC collider at about 2015-2016 year.
    ```
2. Let's look at which `physical object` we can analyze on, such as
    ```
    display_multiparticles
    >MA5: hadronic invisible j l+ l- p vl vl~
    
    display_particles
    >MA5: a b b1 b1~ b2 b2~ b~ c cl cl~ cr cr~ c~ d dl dl~ dr dr~ d~ e+ e- el+ el- er+ er- g go h+ h- h1 h2 h3 met mht mu+ mu- mul+ mul- mur+ mur- n1 n2 n3 n4 s sl sl~ sr sr~ sve sve~ svm svm~ svt svt~ s~ t t1 t1~ t2 t2~ ta+ ta- ta1+ ta1- ta2+ ta2- t~ u ul ul~ ur ur~ u~ ve ve~ vm vm~ vt vt~ w+ w- x1+ x1- x2+ x2- z
    
    display b
    >MA5:    The particle 'b' is defined by the PDG-id 5.
    
    display n1
    >MA5:    The particle 'n1' is defined by the PDG-id 1000022.
    
    display invisible
    >MA5:    The multiparticle 'invisible' is defined by the PDG-ids -16 -14 -12 12 14 16 1000022.
    ```
3. MadAnalysis5 has defination for these particles, we can plot the physical property of them, such as the energy, mass, momentum, and so on. Now, we plot the mass of b quark generated and the mass of the two b quarks system.
    ```
    plot M(b) 40 4 6
    plot M(b b~) 40 80 100 #plot invariant mass for 2 b quarks, 40 bins, 80-100GeV
    submit /youwei_home/Tutorial_MadAnalysis5/DarkHiggs_example_mbb
    ```
    The result is what we expect, because in the parton level, particles are just taken from the ideal process as theory description.
    
    
### 1-3. MadAnalysis5 instruction-.hepmc file
1. Second, we analyze the `.hepmc` file. In this level of records, we have more information. We will do a quick `reconstruction`, which means we simulate the real result obtained from detector (imagine that you only know like how much energy left in the detector, the particle track and so on) and try to inference the original particles.
    Launch MadAnalysis5 with reconstruction mode by
    ```
    cd <where>/madanalysis5
    ./bin/ma5 -R
    ```
    The following setups are specific algorithm.
    ```
    set main.fastsim.package = fastjet
    set main.fastsim.algorithm = antikt
    set main.fastsim.radius = 1.0
    set main.fastsim.ptmin = 5.0
    ```
    The same as last step, import the output from madgraph.
    ```
    import /youwei_home/Tutorial_MadAnalysis5/monosbb/Events/run_01/tag_1_pythia8_events.hepmc.gz as sbb
    set sbb.xsection = 0.03373
    set main.lumi = 36
    ```
    We plot the mass of jets. The jet is kind of a group of particles in small space, which usually contains the particles from a same mother particle.  
    We select the events which is high MET (missing transverse energy).
    ```
    select 300 < MET < 500
    plot M(j[1]) 40 0 300 #plot the mass of highest pT jet (pT means transverse momentum)
    submit /youwei_home/Tutorial_MadAnalysis5/DarkHiggs_example_mJ
    ```
    In the `boosted` events, the two b quarks are bundled up into one jet, so the mass peak at the same as the plot in the previous step.
    
    
### 1-4. MadAnalysis5 instruction-.hepmc file for re-interpretation
1. We are now going to be in the final step. We use the `re-interpretation` feature of MadAnalysis5. This means we use the results of existing analysis which is some published analysis on other signal assumption to test our signal events, such as if our signal really exists, will their analysis reveal it? will their analysis exclude it?  
    Put this in one text file like `analysis_reference.txt`:
    ```
    # AnalysisName               PADType    Switch     DelphesCard
    atlas_exot_2016_25            v1.2        on    delphes_card_atlas_2016_25.tcl                     #  ATLAS - 13 TeV - Monohiggs in the bbar channel (36.1 fb-1)
    ```
    Put another setting into `ma5_run_card.txt`:
    ```
    set main.recast = on
    set main.recast.store_root = True
    import /youwei_home/Tutorial_MadAnalysis5/monosbb/Events/run_01/tag_1_pythia8_events.hepmc.gz
    set main.recast.card_path = /youwei_home/Tutorial_MadAnalysis5/analysis_reference.txt
    submit /youwei_home/Tutorial_MadAnalysis5/DarkHiggs_example_recast
    ```
    Eventually, run command:
    ```
    cd <where>/madanalysis5
    ./bin/ma5 -R -s /youwei_home/Tutorial_MadAnalysis5/ma5_run_card.txt
    or
    /root/madanalysis5/bin/ma5 -R -s ma5_run_card.txt
    ```
2. We will find the result in the `DarkHiggs_example_recast/Output/SAF/CLs_output_summary.dat`:
    ```
    # dataset name                analysis name               signal region                                               sig95(exp)     sig95(obs)        ||    efficiency     stat
    defaultset                    atlas_exot_2016_25            RESOLVED                                                    0.0607578      0.0633094       ||    0.1551500      0.3080925
    ```
    In this example, the result tells us this existing ATLAS analysis have 95% confidence to exclude our signal if its cross-section is large than 0.0633094 pb. But the X-section of our signal is smaller than sig95(obs), their analysis could NOT exclude the existence of this signal. So that our model is still hopeful for a New Discovery.
    
    




## 2. Delphes Cards
I will use the mono-sbb model to test the other Delphes cards to make sure they can work.  
I found the five cards from and `<where>/madanalysis5/tools/PAD/analysis_description.dat & recast_config.dat` [GitHub: edvb/madanalysis5_hadron_card.dat](https://gist.github.com/edvb/4f9c551fc8d39669289d0f549043a578):
We can see:
<table>
    <tr>
        <td>Analysis</td>
        <td>Description</td>
        <td>Delphes Card</td>
    </tr>
    <tr>
        <td>atlas_conf_2019_040</td>
        <td>ATLAS - 13 TeV - Multijet + met (139 fb-1)</td>
        <td>delphes_card_atlas_exot_2015_03.tcl</td>
    </tr>
    <tr>
        <td>atlas_susy_2015_06</td>
        <td>ATLAS - 13 TeV - Multijet + met (2-6 jets, 3.2 fb-1)</td>
        <td>delphes_card_atlas_exot_2015_03.tcl</td>
    </tr>
    <tr>
        <td>atlas_susy_2016_07</td>
        <td>ATLAS - 13 TeV - Multijet + met (36.1 fb-1)</td>
        <td>delphes_card_atlas_exot_2015_03.tcl</td>
    </tr>
    <tr>
        <td>cms_sus_16_033</td>
        <td>CMS   - 13 TeV - SUSY multijets (35.9 fb-1)</td>
        <td>delphes_card_cms_sus_16_033.tcl</td>
    </tr>
    <tr>
        <td>cms_sus_19_006</td>
        <td>CMS   - 13 TeV - SUSY in the HT / missing HT channel (137 fb-1)</td>
        <td>delphes_card_cms_sus_19_006.tcl</td>
    </tr>
</table>

```
# AnalysisName               PADType    Switch     DelphesCard
atlas_conf_2019_040           v1.2        on    delphes_card_atlas_exot_2015_03.tcl                #  ATLAS - 13 TeV - Multijet + met (139 fb-1)
atlas_susy_2015_06            v1.2        on    delphes_card_atlas_exot_2015_03.tcl                #  ATLAS - 13 TeV - Multijet + met (2-6 jets, 3.2 fb-1)
atlas_susy_2016_07            v1.2        on    delphes_card_atlas_exot_2015_03.tcl                #  ATLAS - 13 TeV - Multijet + met (36.1 fb-1)
cms_sus_16_033                v1.2        on    delphes_card_cms_sus_16_033.tcl                    #  CMS   - 13 TeV - SUSY multijets (35.9 fb-1)
cms_sus_19_006                v1.2        on    delphes_card_cms_sus_19_006.tcl                    #  CMS   - 13 TeV - SUSY in the HT / missing HT channel (137 fb-1)
```



