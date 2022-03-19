#!/bin/bash
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:20

cd $SLURM_SUBMIT_DIR
if [ "$(basename $PWD)" = "scripts" ]; then
  cd ..
fi
cd donnees

module load gcc blast+ seqkit glost

mkdir -p $SCRATCH/res_glost

srun glost_launch $SCRATCH/cas-blastn.txt 2> /dev/null
