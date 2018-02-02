#include <stdio.h>
#include <unistd.h>

main()
{
	char* av[]={"ls","-1",NULL};
	execv("/bin/ls",av);
	perror("execv failed");
	exit(1);
}
