/*
 * Copyright (c) 1986 The Regents of the University of California.
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
 *	@(#)psproto.h	7.3 (Berkeley) 6/28/90
 */

/*
 * PS300-Host Handshake Protocol Definitions.
 */

/*
 * Commands sent from host->PS300.
 *
 * In the initial handshake carried out when requesting
 * one of these commands be performed, the PS300 always
 * returns the identical code to indicate success.
 */
#define PS_ABORT        0x1000  /* abort current command */
#define PS_RESET        0x3000  /* reset device */
#define PS_RDNET        0x5000  /* logical read */
#define PS_LOOKUP       0x8000  /* name lookup */
#define PS_RDPHY        0x9000  /* physical read */
#define PS_WRPHY_SYNC   0xa000  /* physical write w/ sync */
#define PS_WRPHY        0xb000  /* physical write */
#define PS_WRNET        0xc000  /* logical write */
#define PS_DETACH       0xd000  /* normal/diagnostic detach */
#define PS_ATTACH       0xe000  /* normal attach */
#define PS_DATTACH      0xf000  /* diagnostic attach */

#define PS_DIOREAD      0x4000  /* internal, wait for dioread attention */

/*
 * Command responses from PS300->host.
 */
#define PS_DMAOK(code)  ((code)|0x0a00) /* successful dma transfer */ 
#define PS_ADROK(code)  ((code)|0x0100) /* successful address tranfer */

#define PS_CODE(v)      ((v)&0xf000)    /* extract code from PS300 msg */
#define PS_LUNIT(v)     ((v)&0x000f)    /* extract PS300 unit from msg */

/*
 * Single unit PS300 address list.
 */
struct  psalist {
        u_short nblocks;                /* # of i/o vectors (we always use 1) */
        u_short addr[2];                /* PS300 address */
        u_short wc;                     /* transfer size */
};

/*
 * The max dma size is actually 64KB, but
 * we limit it to be just large enough for
 * the maximum vector list as this is sufficient
 * for our needs and we must allocate real
 * memory to the intermediate buffer.
 */
#define PS_MAXDMA       (1024+2048*12)

/*
 * Pseudo commands used internally by the driver.
 */
#define PS_DMAOUT       0x0100          /* dma buffer host->PS300 */
#define PS_DMAIN        0x0200          /* dma buffer PS300->host */

/*
 * Default timeouts.
 */
#define PS_TIMEOUT      30              /* dma/attention timeout (in hz) */
#define PS_DIOTIMO      1000            /* dio polling timeout */
