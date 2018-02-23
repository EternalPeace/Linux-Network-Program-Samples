/* gpq.c - newq, enq, headq, deq, seeq, freeq, initq */

/* generic priority queue processing functions */

#include <conf.h>
#include <kernel.h>
#include <q.h>

struct	qinfo {
	Bool	q_valid;
	int	q_type;		/* mutex type	*/
	int	q_max;
	int	q_count;
	int	q_seen;
	int	q_mutex;
	int	*q_key;
	char	**q_elt;
};

static	int	qinit = FALSE;
static	int	initq();

#ifndef	MAXNQ
#define	MAXNQ	100
#endif	!MAXNQ

static	struct	qinfo Q[MAXNQ];

/*------------------------------------------------------------------------
 * enq  --	insert an item at the tail of a list, based on priority
 *	Returns the number of slots available; -1, if full
 *------------------------------------------------------------------------
 */
int
enq(int q, void *elt, int key)
{
	STATWORD	ps;
	struct	qinfo	*qp;
	int	i, j, left;

	if (q < 0 || q >= MAXNQ)
		return -1;
	if (!Q[q].q_valid || Q[q].q_count >= Q[q].q_max)
		return -1;

	qp = &Q[q];

	if (qp->q_type == QF_NOWAIT)
		disable(ps);
	else
		wait(qp->q_mutex);

	/* start at tail and move towards head, as long as key is greater */

	/* this shouldn't happen, but... */
	if (qp->q_count < 0)
		qp->q_count = 0;
	i = qp->q_count-1;

	while(i >= 0 && key > qp->q_key[i])
		--i;
	/* i can be -1 (new head) -- it still works */

	for (j = qp->q_count-1; j > i; --j) {
		qp->q_key[j+1] = qp->q_key[j];
		qp->q_elt[j+1] = qp->q_elt[j];
	}
	qp->q_key[i+1] = key;
	qp->q_elt[i+1] = elt;
	qp->q_count++;
	left = qp->q_max - qp->q_count;
	if (qp->q_type == QF_NOWAIT)
		restore(ps);
	else
		signal(qp->q_mutex);
	
	return left;
}


/*------------------------------------------------------------------------
 *  deq --  remove an item from the head of a list and return it
 *------------------------------------------------------------------------
 */
void *
deq(int q)
{
	struct	qinfo	*qp;
	STATWORD	ps;
	char	*elt;
	int	i;

	if (q < 0 || q >= MAXNQ)
		return NULL;
	if (!Q[q].q_valid || Q[q].q_count <= 0)
		return NULL;

	qp = &Q[q];

	if (qp->q_type == QF_NOWAIT)
		disable(ps);
	else
		wait(qp->q_mutex);

	elt = qp->q_elt[0];

	for (i=1; i<qp->q_count; ++i) {
		qp->q_elt[i-1] = qp->q_elt[i];
		qp->q_key[i-1] = qp->q_key[i];
	}
	qp->q_count--;
	if (qp->q_type == QF_NOWAIT)
		restore(ps);
	else
		signal(qp->q_mutex);
	return(elt);
}

/*------------------------------------------------------------------------
 * headq -- return the first element in the queue without removing it
 *------------------------------------------------------------------------
 */
void *
headq(int q)
{
	struct	qinfo	*qp;
	STATWORD	ps;
	char		*elt;

	if (q < 0 || q >= MAXNQ)
		return NULL;
	if (!Q[q].q_valid || Q[q].q_count == 0)
		return NULL;

	qp = &Q[q];

	if (qp->q_type == QF_NOWAIT)
		disable(ps);
	else
		wait(qp->q_mutex);

	elt = qp->q_elt[0];
	if (qp->q_type == QF_NOWAIT)
		restore(ps);
	else
		signal(qp->q_mutex);

	return(elt);
}

/*------------------------------------------------------------------------
 *  seeq --  peek at queue elements in order, without removing them
 *	return the elements until all out; then return NULL and reset q_seen
 *------------------------------------------------------------------------
 */
void *
seeq(int q)
{
	struct	qinfo	*qp;
	STATWORD	ps;
	char	*elt;

	if (q < 0 || q >= MAXNQ)
		return NULL;
	if (!Q[q].q_valid || Q[q].q_count == 0)
		return NULL;

	qp = &Q[q];

	if (qp->q_type == QF_NOWAIT)
		disable(ps);
	else
		wait(qp->q_mutex);

	qp->q_seen++;
	if (qp->q_seen >= qp->q_count) {
		qp->q_seen = -1;
		if (qp->q_type == QF_NOWAIT)
			restore(ps);
		else
			signal(qp->q_mutex);
		return NULL;
	}

	elt = qp->q_elt[qp->q_seen];
	if (qp->q_type == QF_NOWAIT)
		restore(ps);
	else
		signal(qp->q_mutex);

	return(elt);
}

/*------------------------------------------------------------------------
 *  newq --  allocate a new queue, return the queue's index
 *------------------------------------------------------------------------
 */
int
newq(unsigned size, unsigned mtype)
{
	struct	qinfo	*qp;
	int i;

	if (!qinit)
		initq();
	for (i=0; i<MAXNQ; ++i) {
		if (!Q[i].q_valid)
			break;
	}
	if (i == MAXNQ)
		return -1;
	qp = &Q[i];
	qp->q_valid = TRUE;
	qp->q_type = mtype;
	qp->q_max = size;
	qp->q_count = 0;
	qp->q_seen = -1;
	if (mtype != QF_NOWAIT)
		qp->q_mutex = screate(1);
	qp->q_elt = (char **) getmem(sizeof(char *) * size);
	qp->q_key = (int *) getmem(sizeof(int) * size);
	if (qp->q_key == (int *) SYSERR || qp->q_elt == (char **) SYSERR)
		return -1;
	return i;
}

int
freeq(int q)
{
	struct	qinfo	*qp;

	if (q < 0 || q >= MAXNQ)
		return FALSE;
	if (!Q[q].q_valid || Q[q].q_count != 0)		/* user frees elts */
		return FALSE;

	qp = &Q[q];
	/* free resources */
	freemem(qp->q_key, sizeof(int) * qp->q_max);
	freemem(qp->q_elt, sizeof (char *) * qp->q_max);
	if (qp->q_type != QF_NOWAIT)
		sdelete(qp->q_mutex);
	qp->q_valid = FALSE;
	return TRUE;
}

int
lenq(int q)
{
	if (q < 0 || q >= MAXNQ || !Q[q].q_valid)
		return SYSERR;
	return Q[q].q_count;
}

static int
initq()
{
	int i;

	for (i=0; i<MAXNQ; ++i)
		Q[i].q_valid = FALSE;
	qinit = TRUE;
}
