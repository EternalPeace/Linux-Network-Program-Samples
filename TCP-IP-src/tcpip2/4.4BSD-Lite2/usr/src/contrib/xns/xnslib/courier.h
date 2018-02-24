/* $Header: courier.h,v 3.2 87/05/11 09:27:36 ed Exp $ */
/*
 $Log:	courier.h,v $
 * Revision 3.2  87/05/11  09:27:36  ed
 * Added MAX_SEQUENCE_LENGTH.
 * 
 * Revision 3.1  87/03/17  09:30:33  ed
 * changes from webster: Sequence_of_Unspecified, mc68xxx conditionals
 * 
 * Revision 3.1  87/03/17  09:30:33  ed
 * Added conditions for mc68000 family
 * 
 * Revision 3.0  87/01/14  14:40:39  ed
 * release containing Xerox (Webster Research Center) modifications
 * 
 * Revision 2.0  85/11/21  07:22:05  jqj
 * 4.3BSD standard release
 * 
 * Revision 1.3  85/10/23  16:43:30  root
 * Probably correct versions of basic conversion operators for the Gould.
 * 
 * Revision 1.2  85/10/21  12:49:15  root
 * Gould version:  definitions for MoveLong, etc. (the MoveLong routine is in misc.c)
 * 
 * Revision 1.2  85/10/17  16:46:55  jqj
 * first Gould version: definitions for MoveLong etc.
 * 
 * Revision 1.5  85/05/23  06:18:06  jqj
 * Public Beta-test version, released 24 May 1985
 * 
 * Revision 1.3  85/03/11  16:36:54  jqj
 * Public alpha-test version, released 11 March 1985
 * 
 * Revision 1.2  85/01/27  07:37:18  jqj
 * finished but undebugged version
 * 
 */

#ifndef COURIERVERSION
/*
 * the version of Courier we support
 */
#define COURIERVERSION 3

/*
 * Predefined Courier types.
 */
typedef char		Boolean;
typedef unsigned short	Cardinal;
typedef unsigned long	LongCardinal;
typedef short		Integer;
typedef long		LongInteger;
typedef char		*String;
typedef unsigned short	Unspecified;
typedef unsigned long	LongUnspecified;
typedef int		NilRecord;


/*
 * Low-level byte moving, with byte-swapping.
 * Use these definitions for VAX and other low-enders.
 */
#if vax
#define externalize_Boolean(p, buf)	(*(short*)(buf) = *((char*)(p))<<8, 1)
#define internalize_Boolean(p, buf)	(*(char*)(p) = *((char*)(buf)+1), 1)
#define MoveShort(a, b)	(*(char*)(b) = *((char*)(a)+1),\
			 *((char*)(b)+1) = *(char*)(a),1)
#define MoveLong(a, b)	(*(char*)(b) = *((char*)(a)+3),\
			 *((char*)(b)+1) = *((char*)(a)+2),\
			 *((char*)(b)+2) = *((char*)(a)+1),\
			 *((char*)(b)+3) = *(char*)(a), 2)
#endif

/*
 * Low-level byte moving, without byte-swapping.
 * Use these definitions for SUN and other high-enders.
 */
#if sun || mc68000 || mc68010 || mc68020
#define externalize_Boolean(p, buf)  (*(Unspecified*)(buf) = 1&*(char*)(p), 1)
#define internalize_Boolean(p, buf)  (*(char*)(p) = 1&*(Unspecified*)(buf), 1)
#define MoveShort(a, b)	(*(short *)(b) = *(short *)(a),1)
#define MoveLong(a, b)	(*(long *)(b) = *(long *)(a),2)
#endif

/*
 * Low-level byte moving, without byte-swapping.
 * Use these definitions for sel and other high-enders that require
 * longword alignment.
 */
#if sel || tahoe
#define externalize_Boolean(p, buf)  (*(Unspecified*)(buf) = 1&*(char*)(p), 1)
#define internalize_Boolean(p, buf)  (*(p) = 1&*(Unspecified*)(buf), 1)
#define MoveShort(a, b)	(*(short *)(b) = *(short *)(a),1)
int MoveLong();
#endif

/*
 * sizeof_Foo(p) is a function that returns the externalized size of
 * the variable specified as argument (assumed to be of type Foo).
 * clear_Foo(p) is a function that deallocates any components of Foo.
 * externalize_Foo translates a variable from C form to external
 * serialized form.
 * internalize_Foo translates a variable from external serializedform 
 * to internal C form
 */
#define sizeof_NilRecord(p)		0
#define clear_NilRecord(p)
#define externalize_NilRecord(p, buf)		0
#define internalize_NilRecord(p, buf)		0

#define sizeof_Boolean(p)		1
#define clear_Boolean(p)

#define sizeof_Cardinal(p)		1
#define clear_Cardinal(p)
#define externalize_Cardinal(p, buf)		MoveShort(p, buf)
#define internalize_Cardinal(p, buf)		MoveShort(buf, p)

#define sizeof_LongCardinal(p)		2
#define clear_LongCardinal(p)
#define externalize_LongCardinal(p, buf)	MoveLong(p, buf)
#define internalize_LongCardinal(p, buf)	MoveLong(buf, p)

#define sizeof_Integer(p)		1
#define clear_Integer(p)
#define externalize_Integer(p, buf)		MoveShort(p, buf)
#define internalize_Integer(p, buf)		MoveShort(buf, p)

#define sizeof_LongInteger(p)		2
#define clear_LongInteger(p)
#define externalize_LongInteger(p, buf)		MoveLong(p, buf)
#define internalize_LongInteger(p, buf)		MoveLong(buf, p)

#define sizeof_Unspecified(p)		1
#define clear_Unspecified(p)
#define externalize_Unspecified(p, buf)		MoveShort(p, buf)
#define internalize_Unspecified(p, buf)		MoveShort(buf, p)

#define sizeof_LongUnspecified(p)	2
#define clear_LongUnspecified(p)
#define externalize_LongUnspecified(p, buf)	MoveLong(p, buf)
#define internalize_LongUnspecified(p, buf)	MoveLong(buf, p)


/* 
 * SPP stream types used by Courier
 */
#define SPPSST_RPC 0
#define SPPSST_BDT 1
#define SPPSST_END 254
#define SPPSST_ENDREPLY 255

/*
 * the following should be in xn.h or spp.h
 */
#define IDPPORT_COURIER 5
#ifndef MAXWORDS
#define MAXWORDS 267
#endif
#ifndef SPPMAXDATA
#define SPPMAXDATA (MAXWORDS*2)
#endif

/*
 * For streams
 */
typedef enum {
	nextSegment = 0,
	lastSegment = 1
} StreamEnumerator;
#define sizeof_StreamEnumerator sizeof_enumeration
#define clear_StreamEnumerator clear_enumeration
#define externalize_StreamEnumerator externalize_enumeration
#define internalize_StreamEnumerator internalize_enumeration


/*
 * miscellaneous structures and values used by Courier
 * runtimes
 */

#define MAX_SEQUENCE_LENGTH	65535

typedef struct {
	Cardinal length;
	Unspecified *sequence;
} Sequence_of_Unspecified;

/* 
 * message types for Courier messages (should be mixed case?)
 * (should only be of interest to the runtimes)
 */
#define CALL 0
#define REJECT 1
#define RETURN 2
#define ABORT 3

/*
 * components of Courier error messages
 */

typedef struct {
	Cardinal lowest;
	Cardinal highest;
} ImplementedVersionNumbers;

typedef struct {
	enum {
		unspecifiedError = 65535,
		invalidArgument = 3,
		noSuchProcedureValue = 2,
		noSuchVersionNumber = 1,
		noSuchProgramNumber = 0
	} designator;
	union {
		NilRecord u_noSuchProgramNumber;
#define noSuchProgramNumber_case u.u_noSuchProgramNumber
		ImplementedVersionNumbers u_noSuchVersionNumber;
#define noSuchVersionNumber_case u.u_noSuchVersionNumber
		NilRecord u_noSuchProcedureValue;
#define noSuchProcedureValue_case u.u_noSuchProcedureValue
		NilRecord u_invalidArgument;
#define invalidArgument_case u.u_invalidArgument
		NilRecord u_unspecifiedError;
#define unspecifiedError_case u.u_unspecifiedError
	} u;
} rejectionDetails;

/*
 * Macro for unpacking error arguments given a typedef and a field name
 */
#define CourierErrArgs(type,field) \
	(((type *)Exception.Message)->field)

/*
 * miscellaneous constants
 */

#ifndef TRUE
#define TRUE (1)
#endif

#ifndef FALSE
#define FALSE (0)
#endif

#ifndef NULL
#define NULL ((char*) 0)
#endif


/*
 * exceptions defined in Courier
 */

#define REJECT_ERROR 65535
#define PROTOCOL_VIOLATION 65534

/* plus all user-defined ERROR values, offset by ERROR_OFFSET */
#define ERROR_OFFSET 65536

/*
 * External declarations.
 */

extern Unspecified *Allocate();
extern Unspecified *ReceiveCallMessage(), *ReceiveReturnMessage();
extern Unspecified *ReadMessage();
extern int BDTwrite(),BDTclosewrite(),BDTread();
extern int sppclose(),sppclosereply();

#endif COURIERVERSION
