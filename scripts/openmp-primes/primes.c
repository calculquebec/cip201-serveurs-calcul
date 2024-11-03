#include <omp.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

bool* find_primes(unsigned long n)
{
	bool* is_prime = malloc(n * sizeof(bool));
	#pragma omp parallel
	{
		int thread = omp_get_thread_num();
		int nthreads = omp_get_num_threads();
		for (unsigned long i = thread; i < n; i+= nthreads)
		{
			is_prime[i] = true;
			for (unsigned long j = 2; j < i; j++)
			{
				if (i % j == 0)
				{
					is_prime[i] = false;
				}
			}
		}
	}
	is_prime[0] = false;
	return is_prime;
}

int main(int argc, char* argv[])
{
	if (argc != 2)
	{
		printf("usage: primes <up-to-n>\n");
		return(1);
	}
	unsigned long n = atol(argv[1]);

	bool* is_prime = find_primes(n);
	int nprimes = 0;
	for (int i = 0; i < n; i++)
	{
		if (is_prime[i])
		{
			nprimes++;
		}
	}
	printf("There are %d primes up to %lu.\n", nprimes, n);

	return 0;
}
