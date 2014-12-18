#!/bin/bash
#
cd $PBS_O_WORKDIR
module load serpentine
module load torque
snakemake --jobname 's.{jobid}.{rulename}' --js $SERPENTINE_HOME/jobscript.sh -k -d `pwd` -s $SERPENTINE_HOME/workflows/variant_calling/Snakefile --stats snakemake.stats -T --rerun-incomplete -j 300 --cluster 'qsub' >&  snakemake.log
