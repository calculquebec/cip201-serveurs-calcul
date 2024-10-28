#!/bin/bash
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:20

cd $SLURM_SUBMIT_DIR
if [ "$(basename $PWD)" = "scripts" ]; then
  cd ..
fi
cd donnees

module load gcc/12.3 blast+/2.14.1 seqkit/2.5.1 glost/0.3.1

mkdir -p $SCRATCH/res_glost

srun glost_launch $SCRATCH/cas-blastn.txt 2> /dev/null
