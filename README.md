# galaxy-tool-taxonomic-accumulation
Use a python script to accumulate all identifications based on taxonomy.  
The TaxonomicAccumulator tool will count all occurrences of the identifications for every taxonomic level, for every file used as input.

The tool will handle either a BLAST file, OTU file with old BLAST output, OTU file with new BLAST output, a zip file containing multiple BLAST files or a OTU file with LCA processing added to it.

Sample names can not start with a "#".  
All columns in a OTU table should have a header starting with "#".

# Getting started

### Prerequisites
Download and install the following software according to the following steps.
```
sudo apt-get install python
sudo apt-get install python-pip
sudo pip install pandas
sudo pip install xlsxwriter
sudo pip install xlrd
```

### Installing
Download and install the tool according to the following steps.
```
sudo mkdir -m 755 /home/Tools
cd /home/Tools
sudo git clone https://github.com/JasperBoom/galaxy-tool-taxonomic-accumulation
sudo chmod -R 755 galaxy-tool-taxonomic-accumulation
```
The following file in the galaxy-tool-taxonomic-accumulation folder should be made avaible from any location.
```
sudo ln -s /home/Tools/galaxy-tool-taxonomic-accumulation/runTaxonomicAccumulator.py /usr/local/bin/runTaxonomicAccumulator.py
```
Continue with the tool installation
```
sudo mkdir -m 755 /home/galaxy/tools/directoryname
sudo cp /home/Tools/galaxy-tool-taxonomic-accumulation/runTaxonomicAccumulator.sh /home/galaxy/tools/directoryname/runTaxonomicAccumulator.sh
sudo cp /home/Tools/galaxy-tool-taxonomic-accumulation/runTaxonomicAccumulator.xml /home/galaxy/tools/directoryname/runTaxonomicAccumulator.xml
```
Edit the following file in order to make galaxy display the tool.
```
/home/galaxy/config/tool_conf.xml
```
```
<tool file="airdentification/runTaxonomicAccumulator.xml"/>
```
## Source(s)
* __Giardine B, Riemer C, Hardison RC, Burhans R, Elnitski L, Shah P__,  
  Galaxy: A platform for interactive large-scale genome analysis.  
  Genome Research. 2005; 15(10) 1451-1455 __doi: 10.1101/gr.4086505__  
  [GALAXY](https://www.galaxyproject.org/)
