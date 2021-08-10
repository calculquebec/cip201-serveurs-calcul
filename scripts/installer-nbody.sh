#!/bin/bash

cd $SCRATCH

if [ ! -d cq-formation-nbody ]; then
  git clone https://github.com/calculquebec/cq-formation-nbody.git
fi
cd cq-formation-nbody/solutions/openmp

module load gcc
make
