#!/bin/bash

module load gcc cuda python
source $SLURM_TMPDIR/venv_cupy/bin/activate

export OMP_NUM_THREADS=1
python scripts/crunch.py -n 672 --cpu > t1.log & top
