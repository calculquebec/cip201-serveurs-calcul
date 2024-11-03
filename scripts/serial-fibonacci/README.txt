Serial Fibonacci using recursion
--------------------------------

Compute the Nth number in the Fibonacci sequence using recursion. This is a
serial program: computing Fibonacci numbers cannot be done in parallel. The C
code is in `fibonacci.c`.

1. Compile the program:

$ module load StdEnv/2023 gcc/12.3
$ gcc -o fibonacci fibonacci.c

2. Submit the job script to the scheduler:

$ sbatch fibonacci-job.sh
