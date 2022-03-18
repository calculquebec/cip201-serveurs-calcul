#!/bin/bash

parallel -C ' ' echo 'echo {1}"*"{2} "|" bc ">" prod_{1}x{2}' :::: param.txt > commandes.txt
cat commandes.txt
