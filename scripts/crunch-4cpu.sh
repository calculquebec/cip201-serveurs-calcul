#!/bin/bash

module load gcc python
source $SLURM_TMPDIR/venv_numpy/bin/activate

export OMP_NUM_THREADS=4
python $(dirname $0)/crunch.py -n 672 --cpu > t4.log &
htop
