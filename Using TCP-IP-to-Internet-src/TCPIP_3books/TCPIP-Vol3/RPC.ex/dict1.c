/* dict1.c - main, nextin */

#include <stdio.h>
#include <ctype.h>

#define	MAXWORD	50		/* maximum length of a command or word	*/

/*------------------------------------------------------------------------
 * main - insert, delete, or look up words in a dictionary as specified
 *------------------------------------------------------------------------
 */
int
main(argc, argv)
int	argc;
char	*argv[];
{
	char	word[MAXWORD+1]; /* space to hold word from input line	*/
	char	cmd;
	int	wrdlen;		/* length of input word			*/

	while (1) {
		wrdlen = nextin(&cmd, word);
		if (wrdlen < 0)
			exit(0);
		switch (cmd) {
		case 'I':	/* "initialize" */
			initw();
			printf("Dictionary initialized to empty.\n");
			break;
		case 'i':	/* "insert" */
			insertw(word);
			printf("%s inserted.\n",word);
			break;
		case 'd':	/* "delete" */
			if (deletew(word))
				printf("%s deleted.\n",word);
			else
				printf("%s not found.\n",word);
			break;
		case 'l':	/* "lookup" */
			if (lookupw(word))
				printf("%s was found.\n",word);
			else
				printf("%s was not found.\n",word);
			break;
		case 'q':	/* quit */
			printf("program quits.\n");
			exit(0);
		default:	/* illegal input */
			printf("command %c invalid.\n", cmd);
			break;
		}
	}
}

/*------------------------------------------------------------------------
 * nextin - read a command and (possibly) a word from the next input line
 *------------------------------------------------------------------------
 */
int
nextin(cmd, word)
char	*cmd, *word;
{
	int	i, ch;

	ch = getc(stdin);
	while (ch == ' ')
		ch = getc(stdin);
	if (ch == EOF)
		return -1;
	*cmd = (char) ch;
	ch = getc(stdin);
	while (ch == ' ')
		ch = getc(stdin);
	if (ch == EOF)
		return -1;
	if (ch == '\n')
		return 0;
	i = 0;
	while ((ch != ' ') && (ch != '\n')) {
		if (++i > MAXWORD) {
			printf("error: word too long.\n");
			exit(1);
		}
		*word++ = ch;
		ch = getc(stdin);
	}
	*word = '\0';
	return i;
}
