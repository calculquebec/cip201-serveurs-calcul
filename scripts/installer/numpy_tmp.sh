#!/bin/bash

module load gcc python

cd $SLURM_TMPDIR
virtualenv --no-download venv_numpy

source venv_numpy/bin/activate
pip install --no-index numpy
deactivate
