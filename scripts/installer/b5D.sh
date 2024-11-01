#!/bin/bash

cd $HOME

if [ ! -d cq-formation-benchmark5D ]; then
  git clone https://github.com/calculquebec/cq-formation-benchmark5D.git
fi
cd cq-formation-benchmark5D/solutions

module load StdEnv/2023 gcc/12.3
make
