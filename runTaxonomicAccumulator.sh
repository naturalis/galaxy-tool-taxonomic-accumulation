#!/bin/bash

# Copyright (C) 2018 Jasper Boom

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License version 3 as
# published by the Free Software Foundation.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

# Prequisites:
# installed via <requirements> in xml: python, pandas, xlsxwriter and xlrd.

# The getZipOutput function.
# This function copies the input file to the temporary storage directory. The
# input file is searched for, based on its .dat extension. This search
# will output the name of the input file which is used to unzip it into the
# temporary zip directory. The runTaxonomicAccumulator.py script is called,
# the output is send to the expected location and the temporary storage
# directory is deleted.

SCRIPTDIR=$(dirname "$(readlink -f "$0")")

# sanity check
printf "Conda env: $CONDA_DEFAULT_ENV\n"
printf "Python version: $(python --version |  awk '{print $2}')\n"
printf "Numpy version: $(conda list | egrep numpy | awk '{print $2}')\n"
printf "Xlsxwriter version: $(conda list | egrep xlsxwriter | awk '{print $2}')\n"
printf "Xlrd version: $(conda list | egrep xlrd | awk '{print $2}')\n"
printf "Unzip version: $(unzip -v | head -n1 | awk '{print $2}')\n"
printf "Bash version: ${BASH_VERSION}\n"
printf "SCRIPTDIR: $SCRIPTDIR\n\n"

getZipOutput() {
    cp ${fisInput} ${strDirectory_temp}
    strZipName=$(find ${strDirectory_temp} -name "*.dat" -printf "%f\n")
    unzip -q ${strDirectory_temp}/${strZipName} -d ${strDirectory_temp}
    python $SCRIPTDIR"/runTaxonomicAccumulator.py" -o ${strDirectory_temp}/temporary.xlsx\
                               -t ${strDirectory_temp}/ -f ${disFormat}
    cat ${strDirectory_temp}/temporary.xlsx > ${fosOutput}
    rm -rf ${strDirectory_temp}
}

# The getFormatFlow function.
# This function creates a temporary storage directory in the output directory.
# It then initiates the correct function chain depending on the file format.
# Afther the accumulation processes are done, the output is send to the
# expected location and the temporary storage directory is deleted.
getFormatFlow() {
  strDirectory_temp=$(mktemp -d /data/files/XXXXXX)
    if [ "${disFormat}" = "blast" ] || [ "${disFormat}" = "otu_old" ] ||\
       [ "${disFormat}" = "otu_new" ] || [ "${disFormat}" = "lca" ]
    then
        python $SCRIPTDIR"/runTaxonomicAccumulator.py" -i ${fisInput}\
                                   -o ${strDirectory_temp}/temporary.xlsx\
                                   -f ${disFormat}
        cat ${strDirectory_temp}/temporary.xlsx > ${fosOutput}
        rm -rf ${temp_outdir}
    elif [ "${disFormat}" = "zip" ]
    then
        getZipOutput
    fi
}

# The main function.
main() {
    getFormatFlow
}

# The getopts function.
while getopts ":i:o:f:vh" opt; do
    case ${opt} in
        i)
            fisInput=${OPTARG}
            ;;
        o)
            fosOutput=${OPTARG}
            ;;
        f)
            disFormat=${OPTARG}
            ;;
        v)
            echo ""
            echo "runTaxonomicAccumulator.sh [0.1.0]"
            echo ""

            exit
            ;;
        h)
            echo ""
            echo "Usage: runTaxonomicAccumulator.sh [-h] [-v] [-i INPUT]"
            echo "                                  [-o OUTPUT] [-f FORMAT]"
            echo ""
            echo "Optional arguments:"
            echo " -h                    Show this help page and exit"
            echo " -v                    Show the software's version number"
            echo "                       and exit"
            echo " -i                    The location of the input file(s)"
            echo " -o                    The location of the output file(s)"
            echo " -f                    The format of the input file(s)"
            echo "                       [otu_old/otu_new/blast/zip/lca]"
            echo ""
            echo "The TaxonomicAccumulator tool will count all occurrences of"
            echo "the identifications for every taxonomic level, for every"
            echo "file used as input."
            echo ""
            echo "The tool will handle either a BLAST file, OTU file with old"
            echo "BLAST output, OTU file with new BLAST output, a zip file"
            echo "containing multiple BLAST files or a OTU file with LCA"
            echo "processing added to it."
            echo ""
            echo "Sample names can not start with a '#'."
            echo "All columns in a OTU table should have a header starting"
            echo "with '#'."
            echo ""

            exit
            ;;
        \?)
            echo ""
            echo "You've entered an invalid option: -${OPTARG}."
            echo "Please use the -h option for correct formatting information."
            echo ""

            exit
            ;;
        :)
            echo ""
            echo "You've entered an invalid option: -${OPTARG}."
            echo "Please use the -h option for correct formatting information."
            echo ""

            exit
            ;;
    esac
done

main

# Additional information:
# =======================
#
# Sample names can not start with a "#".
# All columns in a OTU table should have a header starting with "#".
