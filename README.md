# galaxy-tool-taxonomic-accumulation
Use a python script to accumulate all identifications based on taxonomy. For each input file this tool will count all occurrences of the identifications at each taxonomic level. Allowed input is either a BLAST file, OTU file with old BLAST output, OTU file with new BLAST output, a zip file containing multiple BLAST files or a OTU file with LCA processing added to it.

Sample names can not start with a "#".  
All columns in a OTU table should have a header starting with "#".

# Getting started

### Install
Login to the galaxy-server as user `galaxy`. Installing the tool:
```
cd /home/galaxy/Tools
```
```
git clone https://github.com/naturalis/galaxy-tool-taxonomic-accumulation
```
Add the following line to /home/galaxy/galaxy/config/tool_conf.xml
```
<tool file="/home/galaxy/Tools/galaxy-tool-taxonomic-accumulation/runTaxonomicAccumulator.xml" />
```

## Outlink
This tool was written by Jasper Boom and modified to run on Galaxy v.19.01 in Ubuntu 18.04 LTS.
The original repository is located here: https://github.com/JasperBoom/galaxy-tool-taxonomic-accumulator


## Source(s)
* __Giardine B, Riemer C, Hardison RC, Burhans R, Elnitski L, Shah P__,  
  Galaxy: A platform for interactive large-scale genome analysis.  
  Genome Research. 2005; 15(10) 1451-1455 __doi: 10.1101/gr.4086505__  
  [GALAXY](https://www.galaxyproject.org/)
