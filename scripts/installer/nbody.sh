#!/bin/bash

cd $HOME

if [ ! -d cq-formation-nbody ]; then
  git clone https://github.com/calculquebec/cq-formation-nbody.git
fi
cd cq-formation-nbody/solutions/openmp

module load gcc/9.3.0
sed -i 's/ -march=native//g' Makefile
make
