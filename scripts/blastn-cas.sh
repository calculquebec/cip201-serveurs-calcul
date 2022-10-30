#!/bin/bash

cd $(dirname $(realpath $0))

for inc_x in K L M N O P Q R; do
  for espece in A B C D; do
    for part in {01..10}; do
      echo blastn -db espece_$espece \
        -query chr_$inc_x.fa.split/chr_$inc_x.part_0$part.fa \
        '>' $SCRATCH/res_glost/align_${inc_x}_${espece}_${part}
    done
  done
done > $SCRATCH/cas-blastn.txt
