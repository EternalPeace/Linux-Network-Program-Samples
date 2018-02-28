/* $begin rect-decl-c */
struct rect {
    int llx;    /* X coordinate of lower-left corner */
    int lly;    /* Y coordinate of lower-left corner */
    int color;  /* Coding of color                   */
    int width;  /* Width (in pixels)                 */
    int height; /* Height (in pixels)                */
};
/* $end rect-decl-c */


void nothing()
{
    /* $begin rect-init-c */
    struct rect r;
    r.llx = r.lly = 0;
    r.color = 0xFF00FF;
    r.width = 10;
    r.height = 20;  
    /* $end rect-init-c */
}

/* $begin rect-area-c */
int area(struct rect *rp)
{
    return (*rp).width * (*rp).height;
}
/* $end rect-area-c */

/* $begin rect-rotate-c */
void rotate_left(struct rect *rp)
{
    /* Exchange width and height */
    int t      = rp->height;
    rp->height = rp->width;
    rp->width  = t;
}
/* $end rect-rotate-c */
