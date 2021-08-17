#!/bin/bash
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:10

module load gcc python scipy-stack

cd $SLURM_SUBMIT_DIR
if [ "$(basename $PWD)" = "scripts" ]; then
  cd ..
fi

python scripts/inv-mat.py
