#!/bin/bash

cd $HOME

if [ ! -d cq-formation-benchmark5D ]; then
  git clone https://github.com/calculquebec/cq-formation-benchmark5D.git
fi
cd cq-formation-benchmark5D/solutions

module load gcc/9.3.0
make
