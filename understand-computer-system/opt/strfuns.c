#include <stdio.h>
#include <stdlib.h>

/* $begin strfuns */
/* Compute length of string */
size_t strlen(const char *s)
{
    int n = 0;

    while (*s != '\0') {
	s++; 
	n++;
    }
    return n;
}

/* Convert string to lower case: slow */
void lower1(char *s)
{
    int i;

    for (i = 0; i < strlen(s); i++)
	if (s[i] >= 'A' && s[i] <= 'Z')
	    s[i] -= ('A' - 'a');
}

/* Convert string to lower case: faster */
void lower2(char *s)
{
    int i;
    int len = strlen(s);

    for (i = 0; i < len; i++)
	if (s[i] >= 'A' && s[i] <= 'Z')
	    s[i] -= ('A' - 'a');
}
/* $end strfuns */

