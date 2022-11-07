# galaxy-tool-taxonomic-accumulation
Accumulate and count identifications at all taxonomic levels. Allowed input is either a BLAST file,  
a OTU file with BLAST output, a zip file containing multiple BLAST files or a OTU file with LCA processing  
added to it. Output will be an excel file.

Sample names can not start with a "#".  
All columns in a OTU table should have a header starting with "#".


## Installation
### Manual  
Clone this repo in your Galaxy ***Tools*** directory:  
`git clone https://github.com/naturalis/galaxy-tool-taxonomic-accumulation`  

Make sure the script are executable:  
`chmod 755 galaxy-tool-taxonomic-accumulation/runTaxonomicAccumulator.sh`  
`chmod 755 galaxy-tool-taxonomic-accumulation/runTaxonomicAccumulator.py`  

Append the file ***tool_conf.xml***:    
`<tool file="/path/to/Tools/galaxy-tool-taxonomic-accumulation/runTaxonomicAccumulator.xml" />`  

### Ansible
Depending on your setup the [ansible.builtin.git](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/git_module.html) module could be used.  
[Install the tool](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/git_module.html#examples) by including the following in your dedicated ***.yml** file:  

`  - repo: https://github.com/naturalis/galaxy-tool-taxonomic-accumulation`  
&ensp;&ensp;`runTaxonomicAccumulator.xml`  
&ensp;&ensp;`version: master`  

## Source(s)
* __Giardine B, Riemer C, Hardison RC, Burhans R, Elnitski L, Shah P__,  
  Galaxy: A platform for interactive large-scale genome analysis.  
  Genome Research. 2005; 15(10) 1451-1455. __doi: 10.1101/gr.4086505__  
  [Galaxy](https://www.galaxyproject.org/)  
* This tool was written by Jasper Boom; [link](https://github.com/JasperBoom/galaxy-tools-naturalis-internship) to the original repository.  
