/*
 * $Source: /usr/src/kerberosIV/include/RCS/des.h,v $
 * $Author: kfall $
 * $Header: /usr/src/kerberosIV/include/RCS/des.h,v 4.12 90/06/25 20:48:41 kfall Exp $ 
 *
 * Copyright 1987, 1988 by the Massachusetts Institute of Technology.
 *
 * For copying and distribution information, please see the file
 * <mit-copyright.h>.
 *
 * Include file for the Data Encryption Standard library.
 */

/* only do the whole thing once	 */
#ifndef DES_DEFS
#define DES_DEFS

#ifdef	ATHENA
#include <mit-copyright.h>
#endif

typedef unsigned char des_cblock[8];	/* crypto-block size */
/* Key schedule */
typedef struct des_ks_struct { des_cblock _; } des_key_schedule[16];

#define DES_KEY_SZ 	(sizeof(des_cblock))
#define DES_ENCRYPT	1
#define DES_DECRYPT	0

#ifndef NCOMPAT
#define C_Block des_cblock
#define Key_schedule des_key_schedule
#define ENCRYPT DES_ENCRYPT
#define DECRYPT DES_DECRYPT
#define KEY_SZ DES_KEY_SZ
#define string_to_key des_string_to_key
#define read_pw_string des_read_pw_string
#define random_key des_random_key
#define pcbc_encrypt des_pcbc_encrypt
#define key_sched des_key_sched
#define cbc_encrypt des_cbc_encrypt
#define cbc_cksum des_cbc_cksum
#define C_Block_print des_cblock_print
#define quad_cksum des_quad_cksum
typedef struct des_ks_struct bit_64;
#endif

#define des_cblock_print(x) des_cblock_print_file(x, stdout)

#endif	DES_DEFS
