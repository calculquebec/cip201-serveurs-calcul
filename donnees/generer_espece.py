#!/usr/bin/env python

import random
import sys


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
    assert nb_seq_max <= 9600, 'Requis: nbMax <= 9600'
    assert 0 < long_min <= long_max, 'Requis: 0 < longMin <= longMax'
    assert long_max <= 1600, 'Requis: longMax <= 1600'

    nb_sequences = random.randint(nb_seq_min, nb_seq_max)

    for seqid in range(nb_sequences):
        sequence = ''.join(random.choices(
            ['A', 'C', 'T', 'G'], k=random.randint(long_min, long_max)))

        print(f'>SCIP201-{suffixe}.{seqid:04x}')
        for depart in range(0, len(sequence), larg_fasta):
            print(sequence[depart:depart + larg_fasta])


if __name__ == '__main__':
    main()
