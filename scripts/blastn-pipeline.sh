#!/bin/bash

echo '- Aller à la racine du matériel ...'
cd $(dirname $0)/..
CIP201=$PWD

echo '- Importer les données dans $SCRATCH ...'
mkdir -p $SCRATCH/donnees
rsync -a donnees/ $SCRATCH/donnees/
cd $SCRATCH

echo '- Soumettre la première tâche ...'
TACHE1=$(sbatch --parsable $CIP201/scripts/blastn-gen-seq.sh)
echo '  - Numéro de tâche initiale :' $TACHE1

echo '- Soumettre la tâche dépendante ...'
sbatch --dependency=afterok:$TACHE1 $CIP201/scripts/blastn-parallel.sh
squeue -u $USER
