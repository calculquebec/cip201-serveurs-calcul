#!/bin/bash
#SBATCH --array=1-4%2
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=2000M
#SBATCH --time=0-00:20

cd $SLURM_SUBMIT_DIR
if [ "$(basename $PWD)" = "scripts" ]; then
  cd ..
fi
cd donnees

module load StdEnv/2023 gcc/12.3 blast+/2.14.1 seqkit/2.5.1

INCONNUS=(M N O P Q R)
INC_X="${INCONNUS[$SLURM_ARRAY_TASK_ID]}"
mkdir -p res_array

parallel blastn -db espece_{1} \
  -query chr_$INC_X.fa.split/chr_$INC_X.part_0{2}.fa \
  '>' res_array/align_${INC_X}_{1}_{2} ::: A B C D ::: {01..10}
