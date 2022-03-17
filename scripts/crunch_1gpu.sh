#!/bin/bash

module load gcc cuda python
source $SLURM_TMPDIR/venv_cupy/bin/activate

python scripts/crunch.py -n 672 --gpu > tg.log & nvtop
