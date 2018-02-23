/* dict2.c - initw, insertw, deletew, lookupw */

#define	MAXWORD	50		/* maximum length of a command or word	*/
#define DICTSIZ 100		/* maximum number of entries in diction.*/
char	dict[DICTSIZ][MAXWORD+1];/* storage for a dictionary of words	*/
int	nwords = 0;		/* number of words in the dictionary	*/

/*------------------------------------------------------------------------
 * initw - initialize the dictionary to contain no words at all
 *------------------------------------------------------------------------
 */
int
initw()
{
	nwords = 0;
	return 1;
}

/*------------------------------------------------------------------------
 * insertw - insert a word in the dictionary
 *------------------------------------------------------------------------
 */
int
insertw(word)
char	*word;
{
	strcpy(dict[nwords], word);
	nwords++;
	return nwords;
}

/*------------------------------------------------------------------------
 * deletew - delete a word from the dictionary
 *------------------------------------------------------------------------
 */
int
deletew(word)
char	*word;
{
	int	i;

	for (i=0 ; i<nwords ; i++)
		if (strcmp(word, dict[i]) == 0) {
			nwords--;
			strcpy(dict[i], dict[nwords]);
			return 1;
		}
	return 0;
}

/*------------------------------------------------------------------------
 * lookupw - look up a word in the dictionary
 *------------------------------------------------------------------------
 */
int
lookupw(word)
char	*word;
{
	int	i;

	for (i=0 ; i<nwords ; i++)
		if (strcmp(word, dict[i]) == 0)
			return 1;
	return 0;
}
