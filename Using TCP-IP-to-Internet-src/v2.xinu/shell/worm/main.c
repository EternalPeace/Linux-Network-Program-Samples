/* main.c -- playworm, worm2, playgame */

/*
 * worm -- the game
 * 
 * Simple example of a larger Xinu process for Version 7
 *
 * Written by Shawn Ostermann, and a sample solution to an
 * operating systems lab on different approaches to message
 * passing.  Intended as an example, and not as a finished product.
 * 
 * Only works on "some" terminals, sorry...
 */

#include <conf.h>
#include <kernel.h>
#include <io.h>
#include <tty.h>
#include "game.h"
    
int mover(), plotter(), targeter(), referee(), robot();

int wormx, wormy;

int targetx, targety;

int worm2();

int pidmover, pidplotter, pidtargeter, pidreferee, pidmain, pidtimer, pidrobot;
int pids, pidr;

int semwait;

playworm()
{
    kprintf("Type 'Q' to quit game.....\n");
    sleep(1);
    semwait = screate(0);
    resume(create(worm2,5000,20,"worm2",0));
    wait(semwait);
}

worm2()
{
    terminit();
    msginit();

    clearscreen();
    playgame();
    clearscreen();

    termrepair();

    signal(semwait);
}


playgame()
{
    int x,y;
    int l;

    pidmain = getpid();
    targetx = 0;
    targety = 0;

    resume(pidplotter = create(plotter,2000,50,"plotter",0));
    
    /* draw the border */
    for (l=1; l<=(XMAXFIELD/2)+1; ++l) {
	x = l;
	if (x>1) {
	    newsend(pidplotter,3,x,YMAXFIELD,'=');
	    newsend(pidplotter,3,x,1,'=');
	    newsend(pidplotter,3,XMAXFIELD-x+1,YMAXFIELD,'=');
	    newsend(pidplotter,3,XMAXFIELD-x+1,1,'=');
	}
	y = (l%3==0)?(l/3):YMAXFIELD;
	if (y<=(YMAXFIELD/2)) {
	    newsend(pidplotter,3,XMAXFIELD,y,'|');
	    newsend(pidplotter,3,1,y,'|');
	    newsend(pidplotter,3,XMAXFIELD,YMAXFIELD-y+1,'|');
	    newsend(pidplotter,3,1,YMAXFIELD-y+1,'|');
	}
    }

    resume(pidmover = create(mover,5000,12,"mover",0));
    resume(pidtargeter = create(targeter,5000,11,"targeter",0));
    resume(pidreferee = create(referee,5000,5,"referee",0));
    sleep10(1);
    resume(pidrobot = create(robot,5000,10,"robot",0));

    receive();

    kill(pidmover);
    kill(pidtargeter);
    kill(pidreferee);
    kill(pidtimer);
    kill(pidrobot);
    kill(pids);
    kill(pidr);
    printstring("Game Over!!!",XMAXFIELD/2-5,YMAXFIELD/2);
    sleep(2);
    kill(pidplotter);
}
