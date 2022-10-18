#!/bin/bash

module load gcc/9.3.0 cuda/11.4 python/3.8.10

cd $SLURM_TMPDIR
virtualenv --no-download venv_cupy

source venv_cupy/bin/activate
pip install --no-index numpy cupy
deactivate
