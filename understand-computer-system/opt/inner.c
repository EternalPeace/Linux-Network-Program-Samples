#include "inner.h"

/* Inner Product functions */

char abstract_descr[] = "Maximum use of data abstraction";
void abstract_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    *dest = (data_t) 0;
    for (i = 0; i < vec_length(u); i++) {
	data_t uval, vval;
	get_vec_element(u, i, &uval);
	get_vec_element(v, i, &vval);
	*dest = *dest + uval * vval;
    }
}

char motion_descr[] = "Take vec_length() out of loop";
void motion_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    *dest = (data_t) 0;
    for (i = 0; i < length; i++) {
	data_t uval, vval;
	get_vec_element(u, i, &uval);
	get_vec_element(v, i, &vval);
	*dest = *dest + uval * vval;
    }
}

char array_descr[] = "Array reference to vector data";
void array_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    *dest = (data_t) 0;
    for (i = 0; i < length; i++) {
	*dest = *dest + udata[i] * vdata[i];
    }
}

char inner4_descr[] = "inner4: Array reference, accumulate in temporary";
/* $begin inner4 */
/* Accumulate in temporary */
void inner4(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t sum = (data_t) 0;

    for (i = 0; i < length; i++) {
	sum = sum + udata[i] * vdata[i];
    }
    *dest = sum;
}
/* $end inner4 */

char pointer_descr[] = "Pointer reference, accumulate in temporary";
void pointer_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t *uend = udata+length;
    data_t x = (data_t) 0;
    for (; udata < uend; udata++,vdata++) {
	x = x + *udata * *vdata;
    }
    *dest = x;
}

char unroll2a_descr[] = "Array code, unrolled by 2";

void unroll2a_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    int limit = length-1;
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t x = (data_t) 0;
    /* Do two elements at a time */
    for (i = 0; i < limit; i+=2) {
	x = x + udata[i] * vdata[i]
	    + udata[i+1] * vdata[i+1];
    }
    /* Finish off any remaining elements */
    for (; i < length; i++) {
	x = x + udata[i] * vdata[i];
    }
    *dest = x;
}


char unroll8a_descr[] = "Array code, unrolled by 8";
void unroll8a_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    int limit = length-7;
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t x = (data_t) 0;
    /* Do eight elements at a time */
    for (i = 0; i < limit; i+=8) {
	x = x + udata[i]   * vdata[i]
	    + udata[i+1] * vdata[i+1]
	    + udata[i+2] * vdata[i+2]
	    + udata[i+3] * vdata[i+3]
	    + udata[i+4] * vdata[i+4]
	    + udata[i+5] * vdata[i+5]
	    + udata[i+6] * vdata[i+6]
	    + udata[i+7] * vdata[i+7];
    }
    /* Finish off any remaining elements */
    for (; i < length; i++) {
	x = x + udata[i] * vdata[i];
    }
    *dest = x;
}

char unroll16a_descr[] = "Array code, unrolled by 16";
void unroll16a_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    int limit = length-15;
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t x = (data_t) 0;
    /* Do sixteen elements at a time */
    for (i = 0; i < limit; i+=16) {
	x = x + udata[i]    * vdata[i]
	    + udata[i+1]  * vdata[i+1]
	    + udata[i+2]  * vdata[i+2]
	    + udata[i+3]  * vdata[i+3]
	    + udata[i+4]  * vdata[i+4]
	    + udata[i+5]  * vdata[i+5]
	    + udata[i+6]  * vdata[i+6]
	    + udata[i+7]  * vdata[i+7]
	    + udata[i+8]  * vdata[i+8]
	    + udata[i+9]  * vdata[i+9]
	    + udata[i+10] * vdata[i+10]
	    + udata[i+11] * vdata[i+11]
	    + udata[i+12] * vdata[i+12]
	    + udata[i+13] * vdata[i+13]
	    + udata[i+14] * vdata[i+14]
	    + udata[i+15] * vdata[i+15];
    }
    /* Finish off any remaining elements */
    for (; i < length; i++) {
	x = x + udata[i] * vdata[i];
    }
    *dest = x;
}

char unroll2_descr[] = "Pointer code, unrolled by 2";
void unroll2_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t *uend = udata+length-1;
    data_t x = (data_t) 0;
    /* Do two elements at a time */
    for (; udata < uend; udata+=2,vdata+=2) {
	x = x + udata[0] * vdata[0]
	    + udata[1] * vdata[1];
    }
    uend += 1;
    /* Finish off remaining elements */
    for (; udata < uend; udata++,vdata++) {
	x = x + udata[0] * vdata[0];
    }
    *dest = x;
}

char unroll4_descr[] = "Pointer code, unrolled by 4";
void unroll4_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t *uend = udata+length-3;
    data_t x = (data_t) 0;
    /* Do four elements at a time */
    for (; udata < uend; udata+=4,vdata+=4) {
	x = x + udata[0] * vdata[0]
	    + udata[1] * vdata[1]
	    + udata[2] * vdata[2]
	    + udata[3] * vdata[3];
    }
    uend += 3;
    /* Finish off remaining elements */
    for (; udata < uend; udata++,vdata++) {
	x = x + udata[0] * vdata[0];
    }
    *dest = x;
}

char unroll8_descr[] = "Pointer code, unrolled by 8";
void unroll8_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t *uend = udata+length-7;
    data_t x = (data_t) 0;
    /* Do eight elements at a time */
    for (; udata < uend; udata+=8,vdata+=8) {
	x = x + udata[0] * vdata[0]
	    + udata[1] * vdata[1]
	    + udata[2] * vdata[2]
	    + udata[3] * vdata[3]
	    + udata[4] * vdata[4]
	    + udata[5] * vdata[5]
	    + udata[6] * vdata[6]
	    + udata[7] * vdata[7];
    }
    uend += 7;
    /* Finish off remaining elements */
    for (; udata < uend; udata++,vdata++) {
	x = x + udata[0] * vdata[0];
    }
    *dest = x;
}

char unroll16_descr[] = "Pointer code, unrolled by 16";
void unroll16_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t *uend = udata+length-15;
    data_t x = (data_t) 0;
    /* Do sixteen elements at a time */
    for (; udata < uend; udata+=16,vdata+=16) {
	x = x + udata[0]  * vdata[0]
	    + udata[1]  * vdata[1]
	    + udata[2]  * vdata[2]
	    + udata[3]  * vdata[3]
	    + udata[4]  * vdata[4]
	    + udata[5]  * vdata[5]
	    + udata[6]  * vdata[6]
	    + udata[7]  * vdata[7]
	    + udata[8]  * vdata[8]
	    + udata[9]  * vdata[9]
	    + udata[10] * vdata[10]
	    + udata[11] * vdata[11]
	    + udata[12] * vdata[12]
	    + udata[13] * vdata[13]
	    + udata[14] * vdata[14]
	    + udata[15] * vdata[15];
    }
    uend += 15;
    /* Finish off remaining elements */
    for (; udata < uend; udata++,vdata++) {
	x = x + udata[0] * vdata[0];
    }
    *dest = x;
}


char unroll8x2a_descr[] = "Array code, unrolled by 8, Superscalar x2";
void unroll8x2a_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    int limit = length-7;
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t x0 = (data_t) 0;
    data_t x1 = (data_t) 0;
    /* Do eight elements at a time */
    for (i = 0; i < limit; i+=8) {
	x0 = x0 + udata[i]   * vdata[i];
	x1 = x1 + udata[i+1] * vdata[i+1];
	x0 = x0 + udata[i+2] * vdata[i+2];
	x1 = x1 + udata[i+3] * vdata[i+3];
	x0 = x0 + udata[i+4] * vdata[i+4];
	x1 = x1 + udata[i+5] * vdata[i+5];
	x0 = x0 + udata[i+6] * vdata[i+6];
	x1 = x1 + udata[i+7] * vdata[i+7];
    }
    /* Finish off any remaining elements */
    for (; i < length; i++) {
	x0 = x0 + udata[i] * vdata[i];
    }
    *dest = x0 + x1;
}

char unroll8x4a_descr[] = "Array code, unrolled by 8, Superscalar x4";
void unroll8x4a_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    int limit = length-7;
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t x0 = (data_t) 0;
    data_t x1 = (data_t) 0;
    data_t x2 = (data_t) 0;
    data_t x3 = (data_t) 0;
    /* Do eight elements at a time */
    for (i = 0; i < limit; i+=8) {
	x0 = x0 + udata[i]   * vdata[i];
	x1 = x1 + udata[i+1] * vdata[i+1];
	x2 = x2 + udata[i+2] * vdata[i+2];
	x3 = x3 + udata[i+3] * vdata[i+3];
	x0 = x0 + udata[i+4] * vdata[i+4];
	x1 = x1 + udata[i+5] * vdata[i+5];
	x2 = x2 + udata[i+6] * vdata[i+6];
	x3 = x3 + udata[i+7] * vdata[i+7];
    }
    /* Finish off any remaining elements */
    for (; i < length; i++) {
	x0 = x0 + udata[i] * vdata[i];
    }
    *dest = x0 + x1 + x2 + x3;
}

char unroll12x6a_descr[] = "Array code, unrolled by 12, Superscalar x6";
void unroll12x6a_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    int limit = length-11;
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t x0 = (data_t) 0;
    data_t x1 = (data_t) 0;
    data_t x2 = (data_t) 0;
    data_t x3 = (data_t) 0;
    data_t x4 = (data_t) 0;
    data_t x5 = (data_t) 0;
    /* Do twelve elements at a time */
    for (i = 0; i < limit; i+=12) {
	x0 = x0 + udata[i]   * vdata[i];
	x1 = x1 + udata[i+1] * vdata[i+1];
	x2 = x2 + udata[i+2] * vdata[i+2];
	x3 = x3 + udata[i+3] * vdata[i+3];
	x4 = x4 + udata[i+4] * vdata[i+4];
	x5 = x5 + udata[i+5] * vdata[i+5];
	x0 = x0 + udata[i+6] * vdata[i+6];
	x1 = x1 + udata[i+7] * vdata[i+7];
	x2 = x2 + udata[i+8] * vdata[i+8];
	x3 = x3 + udata[i+9] * vdata[i+9];
	x4 = x4 + udata[i+10] * vdata[i+10];
	x5 = x5 + udata[i+11] * vdata[i+11];
    }
    /* Finish off any remaining elements */
    for (; i < length; i++) {
	x0 = x0 + udata[i] * vdata[i];
    }
    *dest = x0 + x1 + x2 + x3 + x4 + x5;
}

char unroll8x8a_descr[] = "Array code, unrolled by 8, Superscalar x8";
void unroll8x8a_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int i;
    int length = vec_length(u);
    int limit = length-7;
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t x0 = (data_t) 0;
    data_t x1 = (data_t) 0;
    data_t x2 = (data_t) 0;
    data_t x3 = (data_t) 0;
    data_t x4 = (data_t) 0;
    data_t x5 = (data_t) 0;
    data_t x6 = (data_t) 0;
    data_t x7 = (data_t) 0;
    /* Do eight elements at a time */
    for (i = 0; i < limit; i+=8) {
	x0 = x0 + udata[i]   * vdata[i];
	x1 = x1 + udata[i+1] * vdata[i+1];
	x2 = x2 + udata[i+2] * vdata[i+2];
	x3 = x3 + udata[i+3] * vdata[i+3];
	x4 = x4 + udata[i+4] * vdata[i+4];
	x5 = x5 + udata[i+5] * vdata[i+5];
	x6 = x6 + udata[i+6] * vdata[i+6];
	x7 = x7 + udata[i+7] * vdata[i+7];
    }
    /* Finish off any remaining elements */
    for (; i < length; i++) {
	x0 = x0 + udata[i] * vdata[i];
    }
    *dest = x0 + x1 + x2 + x3 + x4 + x5 + x6 + x7;
}

char unrollx2as_descr[] = "Array code, Unroll x2, Superscalar x2, noninterleaved";
void unrollx2as_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    int limit = length/2;
    data_t *udata = get_vec_start(u);
    data_t *udata2 = udata+limit;
    data_t *vdata = get_vec_start(v);
    data_t *vdata2 = vdata+limit;
    data_t x0 = (data_t) 0;
    data_t x1 = (data_t) 0;
    int i;
    /* Inner 2 elements at a time */
    for (i = 0; i < limit; i++) {
	x0 = x0 + udata[i] * vdata[i];
	x1 = x1 + udata2[i] * vdata2[i];
    }
    /* Finish any remaining elements */
    for (i = limit*2; i < length; i++) {
	x1 = x1 + udata[i] * vdata[i];
    }
    *dest = x0 + x1;
}


char unroll8x2_descr[] = "Pointer code, unrolled by 8, Superscalar x2";
void unroll8x2_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t *uend = udata+length-7;
    data_t x0 = (data_t) 0;
    data_t x1 = (data_t) 0;
    /* Do eight elements at a time */
    for (; udata < uend; udata+=8,vdata+=8) {
	x0 = x0 + udata[0] * vdata[0];
	x1 = x1 + udata[1] * vdata[1];
	x0 = x0 + udata[2] * vdata[2];
	x1 = x1 + udata[3] * vdata[3];
	x0 = x0 + udata[4] * vdata[4];
	x1 = x1 + udata[5] * vdata[5];
	x0 = x0 + udata[6] * vdata[6];
	x1 = x1 + udata[7] * vdata[7];
    }
    uend += 7;
    /* Finish off remaining elements */
    for (; udata < uend; udata++,vdata++) {
	x0 = x0 + udata[0] * vdata[0];
    }
    *dest = x0 + x1;
}

char unroll9x3_descr[] = "Pointer code, unrolled by 9, Superscalar x3";
void unroll9x3_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t *uend = udata+length-8;
    data_t x0 = (data_t) 0;
    data_t x1 = (data_t) 0;
    data_t x2 = (data_t) 0;
    /* Do nine elements at a time */
    for (; udata < uend; udata+=9,vdata+=9) {
	x0 = x0 + udata[0] * vdata[0];
	x1 = x1 + udata[1] * vdata[1];
	x2 = x2 + udata[2] * vdata[2];
	x0 = x0 + udata[3] * vdata[3];
	x1 = x1 + udata[4] * vdata[4];
	x2 = x2 + udata[5] * vdata[5];
	x0 = x0 + udata[6] * vdata[6];
	x1 = x1 + udata[7] * vdata[7];
	x2 = x2 + udata[8] * vdata[8];
    }
    uend += 8;
    /* Finish off remaining elements */
    for (; udata < uend; udata++,vdata++) {
	x0 = x0 + udata[0] * vdata[0];
    }
    *dest = x0 + x1 + x2;
}


char unroll8x4_descr[] = "Pointer code, unrolled by 8, Superscalar x4";
void unroll8x4_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t *uend = udata+length-7;
    data_t x0 = (data_t) 0;
    data_t x1 = (data_t) 0;
    data_t x2 = (data_t) 0;
    data_t x3 = (data_t) 0;
    /* Do eight elements at a time */
    for (; udata < uend; udata+=8,vdata+=8) {
	x0 = x0 + udata[0] * vdata[0];
	x1 = x1 + udata[1] * vdata[1];
	x2 = x2 + udata[2] * vdata[2];
	x3 = x3 + udata[3] * vdata[3];
	x0 = x0 + udata[4] * vdata[4];
	x1 = x1 + udata[5] * vdata[5];
	x2 = x2 + udata[6] * vdata[6];
	x3 = x3 + udata[7] * vdata[7];
    }
    uend += 7;
    /* Finish off remaining elements */
    for (; udata < uend; udata++,vdata++) {
	x0 = x0 + udata[0] * vdata[0];
    }
    *dest = x0 + x1 + x2 + x3;
}

char unroll8x8_descr[] = "Pointer code, unrolled by 8, Superscalar x8";
void unroll8x8_inner(vec_ptr u, vec_ptr v, data_t *dest)
{
    int length = vec_length(u);
    data_t *udata = get_vec_start(u);
    data_t *vdata = get_vec_start(v);
    data_t *uend = udata+length-7;
    data_t x0 = (data_t) 0;
    data_t x1 = (data_t) 0;
    data_t x2 = (data_t) 0;
    data_t x3 = (data_t) 0;
    data_t x4 = (data_t) 0;
    data_t x5 = (data_t) 0;
    data_t x6 = (data_t) 0;
    data_t x7 = (data_t) 0;
    /* Do eight elements at a time */
    for (; udata < uend; udata+=8,vdata+=8) {
	x0 = x0 + udata[0] * vdata[0];
	x1 = x1 + udata[1] * vdata[1];
	x2 = x2 + udata[2] * vdata[2];
	x3 = x3 + udata[3] * vdata[3];
	x4 = x4 + udata[4] * vdata[4];
	x5 = x5 + udata[5] * vdata[5];
	x6 = x6 + udata[6] * vdata[6];
	x7 = x7 + udata[7] * vdata[7];
    }
    uend += 7;
    /* Finish off remaining elements */
    for (; udata < uend; udata++,vdata++) {
	x0 = x0 + udata[0] * vdata[0];
    }
    *dest = x0 + x1 + x2 + x3 + x4 + x5 + x6 + x7;
}


void register_inners(void)
{
    add_inner(abstract_inner, abstract_inner, abstract_descr);
    add_inner(motion_inner, abstract_inner, motion_descr);
    add_inner(array_inner, abstract_inner, array_descr);
    add_inner(inner4, abstract_inner, inner4_descr);
    add_inner(pointer_inner, abstract_inner, pointer_descr);
    add_inner(unroll2a_inner, abstract_inner, unroll2a_descr);

    /* deleted because it is a solution to an excercise */
    /* add_inner(unroll4a_inner, abstract_inner, unroll4a_descr); */

    add_inner(unroll8a_inner, abstract_inner, unroll8a_descr);
    add_inner(unroll16a_inner, abstract_inner, unroll16a_descr);
    add_inner(unroll2_inner, abstract_inner, unroll2_descr);
    add_inner(unroll4_inner, abstract_inner, unroll4_descr);
    add_inner(unroll8_inner, abstract_inner, unroll8_descr);
    add_inner(unroll16_inner, abstract_inner, unroll16_descr);
    /* deleted because it is a solution to an excercise */
    /* add_inner(unroll4x2a_inner, abstract_inner, unroll4x2a_descr);*/

    add_inner(unroll8x2a_inner, abstract_inner, unroll8x2a_descr); 
    add_inner(unroll8x4a_inner, abstract_inner, unroll8x4a_descr);
    add_inner(unroll8x8a_inner, abstract_inner, unroll8x8a_descr);
    add_inner(unroll12x6a_inner, abstract_inner, unroll12x6a_descr);
    add_inner(unroll8x2_inner, abstract_inner, unroll8x2_descr);
    add_inner(unroll8x4_inner, abstract_inner, unroll8x4_descr);
    add_inner(unroll8x8_inner, abstract_inner, unroll8x8_descr);
    add_inner(unroll9x3_inner, abstract_inner, unroll9x3_descr);
    add_inner(unrollx2as_inner, abstract_inner, unrollx2as_descr);
}







