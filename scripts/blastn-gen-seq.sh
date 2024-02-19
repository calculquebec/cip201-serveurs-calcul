#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=0-00:10

module load gcc/9.3.0 python/3.8.10 blast+/2.12.0 seqkit/0.15.0

cd $SLURM_SUBMIT_DIR
if [ "$(basename $PWD)" = "scripts" ]; then
  cd ..
fi
cd donnees

echo "Suppression des vieilles données ..."
rm -f *_*.fa espece_*.n??
rm -rf chr_*.fa.split

echo "Création des fichiers pour les espèces connues ..."
for espc in A B C D; do
  echo "- Espèce $espc ..."
  python generer_espece.py $espc 8000 9600 900 1600 > espece_$espc.fa
  makeblastdb -in espece_$espc.fa -dbtype nucl -out espece_$espc
done

echo "Création des échantillons de séquences inconnues ..."
for echant in K L M N O P Q R S T U V W X Y Z; do
  echo "- Échantillon $echant ..."
  python generer_echant.py $echant 9600 12800 128 256 > chr_$echant.fa
  seqkit split -p 10 chr_$echant.fa
done
