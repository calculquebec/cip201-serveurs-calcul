#!/bin/bash

module load gcc python
source $SLURM_TMPDIR/venv_numpy/bin/activate

export OMP_NUM_THREADS=1
python $(dirname $0)/crunch.py -n 672 --cpu > t1.log &
top
