# Préparation des données

## Module requis
```
module load gcc blast+ seqkit
```

## Création de séquences aléatoires
* Deux espèces de référence (espece_*.fa)
  * Conversion en base de données Blast
* Des séquences basées sur une espèce choisie aléatoirement (chr_*.fa)
  * Division en 10 fichiers

```
make
```

## Exemples d'exécution
```
time -p blastn -db espece_A -query chr_M.fa > out_A_M.log
```
