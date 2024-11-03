#include <math.h>
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double monte_carlo_pi(unsigned long long n, MPI_Comm comm)
{
	int rank, nranks;
	MPI_Comm_rank(comm, &rank);
	MPI_Comm_size(comm, &nranks);
	srand(time(NULL) + rank);
	double x, y;
	unsigned long long local_p = 0;
	for (unsigned long long i = rank; i < n; i += nranks)
	{
		x = (double) rand() / RAND_MAX;
		y = (double) rand() / RAND_MAX;
		if (sqrt(x*x + y*y) <= 1.0)
		{
			local_p++;
		}
	}
	unsigned long long p;
	MPI_Allreduce(&local_p, &p, 1, MPI_UNSIGNED_LONG_LONG, MPI_SUM, comm);
	return 4*((double)p)/n;
}

int main(int argc, char* argv[])
{
	MPI_Init(&argc, &argv);

	int rank;
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	
	if (argc == 2)
	{
		char* endptr;
		unsigned long long n = strtoll(argv[1], &endptr, 10);

		double pi = monte_carlo_pi(n, MPI_COMM_WORLD);
		if (rank == 0)
		{
			printf("After %llu points, pi estimate is %f.\n", n, pi);
		}
	}
	else
	{
		if (rank == 0)
		{
			printf("usage: pi <n-points>\n");
		}
	}

	MPI_Finalize();
	return 0;
}
