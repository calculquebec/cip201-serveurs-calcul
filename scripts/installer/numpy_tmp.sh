#!/bin/bash

module load gcc/9.3.0 python/3.8.10

cd $SLURM_TMPDIR
virtualenv --no-download venv_numpy

source venv_numpy/bin/activate
pip install --no-index numpy
deactivate
