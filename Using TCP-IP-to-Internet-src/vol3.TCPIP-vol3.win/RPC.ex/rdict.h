#define MAXWORD 50
#define DICTSIZ 100

struct example {
	int exfield1;
	char exfield2;
};
typedef struct example example;
bool_t xdr_example();


#define RDICTPROG ((u_long)0x30090949)
#define RDICTVERS ((u_long)1)

#ifdef RPC_CLNT
#define INITW ((u_long)1)
extern int *initw_1(void *, CLIENT *);
#define INSERTW ((u_long)2)
extern int *insertw_1(char **, CLIENT *);
#define DELETEW ((u_long)3)
extern int *deletew_1(char **, CLIENT *);
#define LOOKUPW ((u_long)4)
extern int *lookupw_1(char **, CLIENT *);
#endif

#ifdef RPC_SVC
#define INITW ((u_long)1)
extern int *initw_1(void *, struct svc_req *);
#define INSERTW ((u_long)2)
extern int *insertw_1(void *, struct svc_req *);
#define DELETEW ((u_long)3)
extern int *deletew_1(void *, struct svc_req *);
#define LOOKUPW ((u_long)4)
extern int *lookupw_1(void *, struct svc_req *);
#endif

