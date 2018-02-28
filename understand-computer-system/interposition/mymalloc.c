/* 
 * mymalloc.c - Examples of load/run-time, link-time, and compile-time 
 *              library interpositioning. 
 */

#ifdef RUNTIME
/*
 * Run-time interposition of malloc and free based 
 * on the dynamic linker's (ld-linux.so) LD_PRELOAD mechanism
 * 
 * Example (Assume a.out calls malloc and free):
 *   linux> gcc -O2 -Wall -o mymalloc.so -shared mymalloc.c
 *
 *   tcsh> setenv LD_PRELOAD "/usr/lib/libdl.so ./mymalloc.so"
 *   tcsh> ./a.out
 *   tcsh> unsetenv LD_PRELOAD
 * 
 *   ...or 
 * 
 *   bash> (LD_PRELOAD="/usr/lib/libdl.so ./mymalloc.so" ./a.out)	
 */

#include <stdio.h>
#include <dlfcn.h>

void *malloc(size_t size)
{
    static void *(*mallocp)(size_t size);
    char *error;
    void *ptr;

    /* get address of libc malloc */
    if (!mallocp) {
	mallocp = dlsym(RTLD_NEXT, "malloc");
	if ((error = dlerror()) != NULL) {
	    fputs(error, stderr);
	    exit(1);
	}
    }
    ptr = mallocp(size);
    printf("malloc(%d) = %p\n", size, ptr);     
    return ptr;
}

void free(void *ptr)
{
    static void (*freep)(void *);
    char *error;

    /* get address of libc free */
    if (!freep) {
	freep = dlsym(RTLD_NEXT, "free");
	if ((error = dlerror()) != NULL) {
	    fputs(error, stderr);
	    exit(1);
	}
    }
    printf("free(%p)\n", ptr);     
    freep(ptr);
}
#endif


#ifdef LINKTIME
/* 
 * Link-time interposition of malloc and free using the static
 * linker's (ld) "--wrap symbol" flag.
 * 
 * Compile the executable using "-Wl,--wrap,malloc -Wl,--wrap,free".
 * This tells the linker to resolve references to malloc as
 * __wrap_malloc, free as __wrap_free, __real_malloc as malloc, and
 * __real_free as free.
 */
#include <stdio.h>

void *__real_malloc(size_t size);
void __real_free(void *ptr);


/* 
 * __wrap_malloc - malloc wrapper function 
 */
void *__wrap_malloc(size_t size)
{
    void *ptr = __real_malloc(size);
    printf("malloc(%d) = %p\n", size, ptr);
    return ptr;
}

/* 
 * __wrap_free - free wrapper function 
 */
void __wrap_free(void *ptr)
{
    __real_free(ptr);
    printf("free(%p)\n", ptr);
}
#endif


#ifdef COMPILETIME
/*
 * Compile-time interposition of malloc and free using C
 * preprocessor. A local malloc.h file defines malloc (free) as
 * wrappers mymalloc (myfree) respectively. 
 */

#include <stdio.h>
#include <malloc.h>

/* 
 * mymalloc - malloc wrapper function 
 */
void *mymalloc(size_t size, char *file, int line)
{
    void *ptr = malloc(size);
    printf("%s:%d: malloc(%d)=%p\n", file, line, size, ptr); 
    return ptr;
} 

/* 
 * myfree - free wrapper function 
 */
void myfree(void *ptr, char *file, int line)
{
    free(ptr);
    printf("%s:%d: free(%p)\n", file, line, ptr); 
}
#endif
