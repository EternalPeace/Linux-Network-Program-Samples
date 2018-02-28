/* $begin nodeuniontag-c */
struct NODE { 
    int is_leaf; 
    union { 
	struct {  
	    struct NODE *left; 
	    struct NODE *right; 
	} internal; 
	double data; 
    } info; 
}; 
/* $end nodeuniontag-c */
