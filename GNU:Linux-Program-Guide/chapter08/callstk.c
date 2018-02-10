/*
 * callstk.c - Illustrate traversing the call stack with GDB
 */
#include <stdio.h>
#include <stdlib.h>

int make_key(void);
int get_key_num(void);
int number(void);

int main(void)
{
	int ret = make_key();
	printf("make_key returns %d\n", ret);
	exit(EXIT_SUCCESS);
}

int make_key(void)
{
	int ret = get_key_num();
	return ret;
}

int get_key_num(void)
{
	int ret = number();
	return ret;
}

int number(void)
{
	return 10;
}
