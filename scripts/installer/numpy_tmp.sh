#!/bin/bash

module load gcc python

cd $SLURM_TMPDIR
virtualenv venv_numpy

source venv_numpy/bin/activate
pip install numpy
deactivate
