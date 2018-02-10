/* 
 * getcaps.c - Get and show terminal capabilities using 
 *             terminfo data structures and functions
 */
#include <stdlib.h>
#include <stdio.h>
#include <term.h>
#include <curses.h>

#define NUMCAPS 3

int main(void)
{
    int i; 
    int retval = 0;
    char *buf;
    char *boolcaps[NUMCAPS] = { "am", "bce", "km" };
    char *numcaps[NUMCAPS] = { "cols", "lines", "colors" };
    char *strcaps[NUMCAPS] = { "cup", "flash", "hpa" };

    if(setupterm(NULL, fileno(stdin), NULL) != OK) {
        perror("setupterm");
        exit(EXIT_FAILURE);
    }
  
    for(i = 0; i < NUMCAPS; ++i) {
        retval = tigetflag(boolcaps[i]);
        if(retval == FALSE) {
            printf("`%s' unsupported\n", boolcaps[i]);
        } else {
            printf("`%s' supported\n", boolcaps[i]);
		}
    }
    fputc('\n', stdout);

    for(i = 0; i < NUMCAPS; ++i) {
        retval = tigetnum(numcaps[i]);
        if(retval == ERR) {
            printf("`%s' unsupported\n", numcaps[i]);
        } else {
            printf("`%s' is %d\n", numcaps[i], retval);
		}	
    }
    fputc('\n', stdout);
  
    for(i = 0; i < NUMCAPS; ++i) {
        buf = tigetstr(strcaps[i]);
        if(buf == NULL) {
            printf("`%s' unsupported\n", strcaps[i]);
        } else {
	    	printf("`%s' is \\E%s\n", strcaps[i], &buf[1]);
            /*printf("`%s' is %s\n", strcaps[i], buf);*/
		}
    }
  
    exit(EXIT_SUCCESS);
}
