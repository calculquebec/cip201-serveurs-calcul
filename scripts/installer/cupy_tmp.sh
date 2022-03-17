#!/bin/bash

module load gcc cuda python

cd $SLURM_TMPDIR
virtualenv venv_cupy

source venv_cupy/bin/activate
pip install numpy cupy
deactivate
