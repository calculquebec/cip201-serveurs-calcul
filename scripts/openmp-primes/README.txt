OpenMP count of prime numbers
-----------------------------

Count the number of prime numbers from 1 to N. This is a parallel OpenMP
program. The C code is in `primes.c`.

1. Compile the program:

$ module load StdEnv/2023 gcc/12.3
$ mpicc -o primes primes.c -fopenmp

2. Submit the job script to the scheduler:

$ sbatch primes-job.sh
