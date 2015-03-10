#!/bin/bash
#
#PBS -N clinomics
#PBS -m e
#
NOW=$(date +"%H%M%S_%m%d%Y")
module load snakemake
cd $PBS_O_WORKDIR

export SERPENTINE_HOME='.'
snakemake --jobname 's.{jobid}.{rulename}' \
  -d $wd \
  -s ../Snakefile \
  --js $SERPENTINE_HOME/jobscript.sh \
  -k -r -p -w 10 \
  -T --rerun-incomplete \
  --stats serpentine_${NOW}.stats \
  -j 3000 --cluster 'qsub -q ccr {params.batch}' \
  >& serpentine_${NOW}.log 
