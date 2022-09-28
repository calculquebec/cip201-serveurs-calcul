#!/bin/bash

module load gcc cuda python

cd $SLURM_TMPDIR
virtualenv --no-download venv_cupy

source venv_cupy/bin/activate
pip install --no-index numpy cupy
deactivate
