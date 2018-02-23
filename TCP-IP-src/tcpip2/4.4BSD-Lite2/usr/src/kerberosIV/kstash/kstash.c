/*
 * $Source: /usr/src/kerberosIV/kstash/RCS/kstash.c,v $
 * $Author: kfall $
 *
 * Copyright 1985, 1986, 1987, 1988 by the Massachusetts Institute
 * of Technology 
 *
 * For copying and distribution information, please see the file
 * <mit-copyright.h>.
 *
 * Description.
 */

#ifndef	lint
static char rcsid_kstash_c[] =
"$Header: /usr/src/kerberosIV/kstash/RCS/kstash.c,v 4.1 90/06/25 21:33:13 kfall Exp $";
#endif	lint

#include <mit-copyright.h>

#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <signal.h>
#include <sgtty.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <sys/file.h>

#include <des.h>
#include <krb.h>
#include <klog.h>
#include <prot.h>
#include <krb_db.h>
#include <kdc.h>

extern int errno;

/* change this later, but krblib_dbm needs it for now */
char   *progname;

static C_Block master_key;
static Key_schedule master_key_schedule;
static Principal s_name_data;	/* for services requested */
static unsigned char master_key_version;
int     debug;
static int more;
static int kfile;
static void clear_secrets();

main(argc, argv)
    int     argc;
    char  **argv;
{
    long    n;
    if (n = kerb_init()) {
	fprintf(stderr, "Kerberos db and cache init failed = %d\n", n);
	exit(1);
    }

    if (kdb_get_master_key (TRUE, master_key, master_key_schedule) != 0) {
      fprintf (stderr, "%s: Couldn't read master key.\n", argv[0]);
      fflush (stderr);
      clear_secrets();
      exit (-1);
    }

    if (kdb_verify_master_key (master_key, master_key_schedule, stderr) < 0) {
      clear_secrets();
      exit (-1);
    }

    kfile = open(MKEYFILE, O_TRUNC | O_RDWR | O_CREAT, 0600);
    if (kfile < 0) {
	clear_secrets();
	fprintf(stderr, "\n\07\07%s: Unable to open master key file\n",
		argv[0]);
	exit(1);
    }
    if (write(kfile, (char *) master_key, 8) < 0) {
	clear_secrets();
	fprintf(stderr, "\n%s: Write I/O error on master key file\n",
		argv[0]);
	exit(1);
    }
    (void) close(kfile);
    clear_secrets();
}

static void 
clear_secrets()
{
    bzero(master_key_schedule, sizeof(master_key_schedule));
    bzero(master_key, sizeof(master_key));
}
