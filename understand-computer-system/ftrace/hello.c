#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char **argv) 
{
    int status;

    if (fork() == 0) { /* child */
	printf("%s: hello from child\n", argv[0]);
	sleep(1);
	exit(0);
    }

    printf("%s: hello from parent\n", argv[0]);

    if (wait(&status) < 0) {
	perror("hello parent: wait");
	exit(0);
    }	
    if (WIFEXITED(status)) {
	printf("%s: child terminated normally with status of %d\n", 
	       argv[0], WEXITSTATUS(status));
    }
    else if (WIFSIGNALED(status)) {
	printf("%s: child terminated by signal %d\n", 
	       argv[0], WTERMSIG(status));
    }
    else {
	printf("%s: child terminated in unknown way\n", argv[0]); 
    }

    exit(0);
}
