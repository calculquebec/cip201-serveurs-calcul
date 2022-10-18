#!/bin/bash

module load gcc/9.3.0 cuda/11.4 python/3.8.10
source $SLURM_TMPDIR/venv_cupy/bin/activate

python $(dirname $0)/crunch.py -n 672 --gpu > tg.log &
nvtop
