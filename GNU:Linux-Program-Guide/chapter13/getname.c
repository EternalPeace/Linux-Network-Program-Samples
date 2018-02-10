/*
 * getname.c - Get login names
 */
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <pwd.h>

int main(void)
{
	char *login;
	struct passwd *pentry;
	
	/* Get the login name */
	if((login = getlogin()) == NULL) { /* oops */
	perror("getlogin");
	exit(EXIT_FAILURE);
	}
	
	/* Get the password entry for login */
	if((pentry = getpwnam(login)) == NULL) {
	perror("getpwnam");
	exit(EXIT_FAILURE);
	}

	/* Display the password entry */
	printf("user name: %s\n", pentry->pw_name);
	printf("UID	     : %d\n", pentry->pw_uid);
	printf("GID	     : %d\n", pentry->pw_gid);
   	printf("gecos    : %s\n", pentry->pw_gecos);
   	printf("home dir : %s\n", pentry->pw_dir);
   	printf("shell    : %s\n", pentry->pw_shell);

	exit(EXIT_SUCCESS);
}
