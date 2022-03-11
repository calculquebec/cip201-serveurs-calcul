#!/usr/bin/env python

import glob
import random
import re
import sys


def charger_especes():
    sequences = []
    seq_tmp = ''

    fic_fasta = random.choice(sorted(glob.glob('./espece_*.fa')))

    with open(fic_fasta) as f:
        for ligne in f:
            if re.match(r'^>.*', ligne):
                if len(seq_tmp) > 0:
                    sequences.append(seq_tmp)
                    seq_tmp = ''
            else:
                seq_tmp = seq_tmp + ligne.strip()

    return sequences


def main():
    assert len(sys.argv) > 5, \
        f'Usage: python {sys.argv[0]} suffixe nbMin nbMax longMin longMax'

    suffixe = sys.argv[1]
    nb_seq_min = int(sys.argv[2])
    nb_seq_max = int(sys.argv[3])
    long_min = int(sys.argv[4])
    long_max = int(sys.argv[5])
    larg_fasta = 60

    random.seed(suffixe)
    assert 0 < nb_seq_min <= nb_seq_max, 'Requis: 0 < nbMin <= nbMax'
    assert nb_seq_max <= 38400, 'Requis: nbMax <= 38400'
    assert 0 < long_min <= long_max, 'Requis: 0 < longMin <= longMax'
    assert long_max <= 1600, 'Requis: longMax <= 1600'

    seq_especes = charger_especes()

    nb_sequences = random.randint(nb_seq_min, nb_seq_max)

    for seqid in range(nb_sequences):
        seq_espece = random.choice(seq_especes)
        nb_bases = random.randint(long_min, long_max)

        if nb_bases > len(seq_espece):
            nb_bases = len(seq_espece)

        position = random.randrange(len(seq_espece) - nb_bases)
        sequence = seq_espece[position:position + nb_bases]

        for deplacement in range(8):
            pos1 = random.randrange(nb_bases)
            pos2 = random.randrange(nb_bases - pos1) + pos1
            sequence = (
                sequence[:pos1] +
                sequence[pos2] +
                sequence[pos1 + 1:pos2] +
                sequence[pos1] +
                sequence[pos2 + 1:])

        for mutation in range(16):
            position = random.randrange(nb_bases)
            sequences = (
                sequence[:position] +
                random.choice(['A', 'C', 'G', 'T']) +
                sequence[position + 1:])

        print(f'>SCIP201-{suffixe}.{seqid:04x}')
        for depart in range(0, nb_bases, larg_fasta):
            print(sequence[depart:depart + larg_fasta])


if __name__ == '__main__':
    main()
