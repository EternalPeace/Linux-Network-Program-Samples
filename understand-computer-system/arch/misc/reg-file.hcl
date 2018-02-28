## HCL description of write-before read register file



## declarations
intsig valW 'valW'
intsig dstW 'dstW'
intsig ivalR 'ivalR'
intsig srcR 'srcR'
intsig RNONE 'RNONE'

#/* $begin reg-file-hcl */
## Read port data
int valR = [
	srcR == dstW : valW;
	1 : ivalR;
];

## Internal read address
int isrcR = [
	srcR == dstW : RNONE;
	1 : srcR;
];
#/* $end reg-file-hcl */
