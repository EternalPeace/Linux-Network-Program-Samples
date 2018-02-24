/*-
 * Copyright (c) 1982, 1986 The Regents of the University of California.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 *	@(#)qvreg.h	7.1 (Berkeley) 5/9/91
 */

/*
 *	derived from: @(#)qvreg.h	1.3 (ULTRIX) 8/21/85 
 */

/*
 * QVSS definitions.
 */
struct qvdevice {
	unsigned short	qv_csr;		/* csr				*/
	unsigned short	qv_xcur;	/* cursor x-position		*/
	unsigned short	qv_mouse;	/* mouse position		*/
	unsigned short	qv_spare1;
	unsigned short	qv_crtaddr;	/* crt controller address reg	*/
	unsigned short	qv_crtdata;	/* crt controller data register	*/
	unsigned short	qv_intdata;	/* int controller data register	*/
	unsigned short	qv_intcsr;	/* int controller command/status*/
	unsigned short	qv_dummy[8];
	unsigned short	qv_uartmode;	/* uart mode			*/
	unsigned short	qv_uartstatus;	/* uart status			*/
	unsigned short	qv_uartcmd;	/* uart command			*/
	unsigned short	qv_uartdata;	/* uart data			*/
	unsigned short	qv_spare2;
	unsigned short	qv_uartintstatus; /* uart interrupt status	*/
};


/*
 * csr bit definations
 */
#define	QV_19INCH	0x1
#define QV_VIDEO_ENA	0x4
#define QV_CUR_MODE	0x8
#define QV_VIDEO_LP	0x10
#define QV_TEST_BIT	0x20
#define QV_INT_ENABLE	0x40
#define QV_CURSOR_ON	0x80
#define QV_MOUSE_ANY	0x700
#define QV_MOUSE_A	0x100
#define QV_MOUSE_B	0x200
#define QV_MOUSE_C	0x400
#define QV_MEM_BANK	0x7800

/*
 * Lk201 keyboard 
 */
#define LK_UPDOWN 	0x86		/* bits for setting lk201 modes */
#define LK_AUTODOWN 	0x82
#define LK_DOWN 	0x80
#define LK_DEFAULTS 	0xd3		/* reset (some) default settings */
#define LK_AR_ENABLE 	0xe3		/* global auto repeat enable */
#define LK_CL_ENABLE 	0x1b		/* keyclick enable */
#define LK_KBD_ENABLE 	0x8b		/* keyboard enable */
#define LK_BELL_ENABLE 	0x23		/* the bell */
#define LK_LED_ENABLE 	0x13		/* light led */
#define LK_LED_DISABLE 	0x11		/* turn off led */
#define LK_RING_BELL 	0xa7		/* ring keyboard bell */
#define LED_1 		0x81		/* led bits */
#define LED_2 		0x82
#define LED_3 		0x84
#define LED_4 		0x88
#define LED_ALL 	0x8f
#define LK_KDOWN_ERROR	0x3d		/* key down on powerup error */
#define LK_POWER_ERROR 	0x3e		/* keyboard failure on powerup test */
#define LK_OUTPUT_ERROR	0xb5		/* keystrokes lost during inhibit */
#define LK_INPUT_ERROR 	0xb6		/* garbage command to keyboard */
#define LK_LOWEST	0x56		/* lowest significant keycode */
#define LK_DIV6_START	0xad		/* start of div 6 */
#define LK_DIV5_END	0xb2		/* end of div 5 */

/*
 * Keycodes for special keys and functions
 */
#define SHIFT	0xae
#define LOCK	0xb0
#define REPEAT	0xb4
#define CNTRL	0xaf
#define ALLUP	0xb3

