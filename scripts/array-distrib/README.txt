Array job generating random normal distributions
------------------------------------------------

Generate normal distributions (1000 points each) with random mean (0 to 1) and
std (0.5 to 1.5), save them to a CSV file, and print statistics. The Python code
is in `distrib.py`. An array job is used to generate 4 distributions saved to
the `results` directory.

Submit the array job script to the scheduler:

$ sbatch distrib-job.sh
