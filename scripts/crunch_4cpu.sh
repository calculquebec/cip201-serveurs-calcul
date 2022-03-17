#!/bin/bash

module load gcc cuda python
source $SLURM_TMPDIR/venv_cupy/bin/activate

export OMP_NUM_THREADS=4
python scripts/crunch.py -n 672 --cpu > t4.log & htop
