#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=0-00:10

cd $SLURM_SUBMIT_DIR
if [ "$(basename $PWD)" = "scripts" ]; then
  cd ..
fi
cd donnees

module load gcc python blast+ seqkit

make clean
make
