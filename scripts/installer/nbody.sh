#!/bin/bash

cd $HOME

if [ ! -d cq-formation-nbody ]; then
  git clone https://github.com/calculquebec/cq-formation-nbody.git
fi
cd cq-formation-nbody/solutions/openmp

module load gcc
sed -i 's/march=native/march=core-avx2/g' Makefile
make
