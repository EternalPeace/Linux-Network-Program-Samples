/* $begin list_len */
/* Linked list structure */
typedef struct ELE {
    struct ELE *next;
    int data;
} list_ele, *list_ptr;

/* Compute length of list */
int list_len(list_ptr ls)
{
    int len = 0;

    for (; ls; ls = ls->next)
	len++;
    return len;
}
/* $end list_len */

/* $begin list_sum */
/* Sum values in list */
static int list_sum(list_ptr ls)
{
    int sum = 0;
    
    while (ls) {
	sum += ls->data;
	ls = ls->next;
    }
    return sum;
}
/* $end list_sum */
