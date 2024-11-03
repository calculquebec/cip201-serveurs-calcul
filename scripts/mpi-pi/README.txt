MPI pi estimate using Monte Carlo
---------------------------------

Estimate the pi number, the ratio of a circle’s circumference to its diameter,
using a Monte Carlo approach. This is an MPI (Message Passing Interface)
parallel program. The C code is in `pi.c`.

1. Compile the program:

$ module load StdEnv/2023 gcc/12.3 openmpi/4.1.5
$ mpicc -o pi pi.c -lm

2. Submit the job script to the scheduler:

$ sbatch pi-job.sh
