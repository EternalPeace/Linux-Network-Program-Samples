/* Test of union */

/* $begin union2-c */
union ele {
    struct {
        int *p;
        int y;
    } e1;
    struct {
        int x;
        union ele *next;
    } e2;
};
/* $end union2-c */

/* $begin union2-ans-c */
void proc (union ele *up)
{
    up->e2.next->e1.y = *(up->e2.next->e1.p) - up->e2.x;
}
/* $end union2-ans-c */
