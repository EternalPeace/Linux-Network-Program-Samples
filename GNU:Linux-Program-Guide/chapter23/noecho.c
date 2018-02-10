/*
 * noecho.c - Using termios to disable key echo
 */
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>

#define PASS_LEN 8

void err_quit(char *msg, struct termios flags);

int main(void)
{
	struct termios old_flags, new_flags;
	char password[PASS_LEN + 1];
	int retval;

	/* Get the current terminal settings */
	tcgetattr(fileno(stdin), &old_flags);
	new_flags = old_flags;

	/* Turn off local echo, but pass the newlines through */
	new_flags.c_lflag &= ~ECHO;
	new_flags.c_lflag |= ECHONL;

	/* Did it work?  */
	retval = tcsetattr(fileno(stdin), TCSAFLUSH, &new_flags);
	if(retval != 0) 
		err_quit("Failed to set attributes", old_flags);

	/* Did the settings change? */
	tcgetattr(fileno(stdin), &new_flags);
	if(new_flags.c_lflag & ECHO) {
		err_quit("Failed to turn off ECHO", old_flags);
	}
	if(!new_flags.c_lflag & ECHONL) {
		err_quit("Failed to turn on ECHONL", old_flags); 
	}

	printf("Enter password: ");
	fgets(password, PASS_LEN + 1, stdin);
	printf("You typed: %s", password);

	/* Restore the old termios settings */
	tcsetattr(fileno(stdin), TCSANOW, &old_flags);

	exit(EXIT_SUCCESS);
}

void err_quit(char *msg, struct termios flags)
{
	fprintf(stderr, "%s\n", msg);
	tcsetattr(fileno(stdin), TCSANOW, &flags);
	exit(EXIT_FAILURE);
}
