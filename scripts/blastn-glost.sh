#!/bin/bash
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:20

cd $SLURM_SUBMIT_DIR
if [ "$(basename $PWD)" = "scripts" ]; then
  cd ..
fi
cd donnees

module load gcc/9.3.0 blast+/2.12.0 seqkit/0.15.0 glost/0.3.1
export BLAST_USAGE_REPORT=false  # Éviter les communications

mkdir -p $SCRATCH/res_glost

srun glost_launch $SCRATCH/cas-blastn.txt 2> /dev/null
