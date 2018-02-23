
#include <stdlib.h>
#include <stdio.h>
#include <process.h>

int	addem(int);

int
main(int argc, char *argv[])
{
	_beginthread((void (*)(void *))addem, 0, (void *)5);
	addem(5);
	return 0;
}

int
addem(int count)
{
	int	i, sum;

	sum = 0;
	for (i=0; i<=count; ++i) {
		printf("The value of i is %d\n", i);
		fflush(stdout);
		sum += i;
	}
	printf("The sum is %d\n", sum);
	fflush(stdout);
	return 0;
}
