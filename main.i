# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "gba.h"
void DMANow(int channel, volatile void *src, volatile void *dest, unsigned int ctrl);
# 2 "main.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 3 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"

# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 4 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
  int x;
  int y;
  int xVel;
  int yVel;
  int width;
  int height;
  int timeUntilNextFrame;
  int direction;
  int isAnimating;
  int isAttacking;
  int currentFrame;
  int numFrames;
  int health;
  int damageTimer;
  u8 oamIndex;
} SPRITE;
# 5 "main.c" 2
# 1 "print.h" 1
# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 6 "main.c" 2
# 1 "intro.h" 1
# 21 "intro.h"
extern const unsigned short introBitmap[19200];


extern const unsigned short introPal[256];
# 7 "main.c" 2


# 1 "tilesetfaketown.h" 1
# 21 "tilesetfaketown.h"
extern const unsigned short decor_8x8Tiles[512];


extern const unsigned short decor_8x8Pal[256];
# 10 "main.c" 2
# 1 "town1fake.h" 1







extern const unsigned short town1fakeMap[1024];
# 11 "main.c" 2
# 1 "tilesetsample.h" 1
# 21 "tilesetsample.h"
extern const unsigned short tilesetsampleTiles[32768];


extern const unsigned short tilesetsamplePal[256];
# 12 "main.c" 2
# 1 "tilemapsample.h" 1







extern const unsigned short tilemapsampleMap[1024];
# 13 "main.c" 2
# 1 "512.h" 1
# 21 "512.h"
extern const unsigned short _12Tiles[131072];


extern const unsigned short _12Pal[256];
# 14 "main.c" 2
# 1 "512map.h" 1







extern const unsigned short _512Map[4096];
# 15 "main.c" 2


# 1 "sprite.h" 1
# 21 "sprite.h"
extern const unsigned short spriteTiles[40000];


extern const unsigned short spritePal[256];
# 18 "main.c" 2
# 1 "myspritesheet.h" 1
# 21 "myspritesheet.h"
extern const unsigned short myspritesheetTiles[16384];


extern const unsigned short myspritesheetPal[256];
# 19 "main.c" 2



# 1 "paused.h" 1
# 21 "paused.h"
extern const unsigned short pausedBitmap[19200];


extern const unsigned short pausedPal[256];
# 23 "main.c" 2
# 1 "win.h" 1
# 21 "win.h"
extern const unsigned short winBitmap[19200];


extern const unsigned short winPal[256];
# 24 "main.c" 2
# 1 "lose.h" 1
# 21 "lose.h"
extern const unsigned short loseBitmap[19200];


extern const unsigned short losePal[256];
# 25 "main.c" 2


# 1 "bossroom1.h" 1







extern const unsigned short bossroom1Map[1024];
# 28 "main.c" 2
# 1 "bossmovement.h" 1
# 27 "bossmovement.h"
extern SPRITE player;




typedef struct {
    int x, y;
    int width, height;
    int lives;
    int behaviorState;
    int behaviorTimer;
    int attackCooldown;
    int damageDelay;
    int isInvulnerable;
    int invulnerableTimer;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;

} BOSS;

void initBoss(BOSS* boss, int x, int y, int width, int height);


void updateBoss(BOSS* boss, SPRITE* player);


void drawBoss(BOSS* boss, OBJ_ATTR* shadowOAM, int index, int hOff, int vOff);


int checkBossCollision(BOSS* boss, SPRITE* player);
# 29 "main.c" 2


# 1 "MAP1col.h" 1
# 21 "MAP1col.h"
extern const unsigned short MAP1colBitmap[16384];


extern const unsigned short MAP1colPal[256];
# 32 "main.c" 2
# 1 "map2col.h" 1
# 21 "map2col.h"
extern const unsigned short map2colBitmap[32768];


extern const unsigned short map2colPal[256];
# 33 "main.c" 2


# 1 "instructions.h" 1
# 21 "instructions.h"
extern const unsigned short instructionsBitmap[19200];


extern const unsigned short instructionsPal[256];
# 36 "main.c" 2



# 1 "parallaxtileset.h" 1
# 21 "parallaxtileset.h"
extern const unsigned short parallaxtilesetTiles[22528];


extern const unsigned short parallaxtilesetPal[256];
# 40 "main.c" 2


# 1 "parallaxbg.h" 1







extern const unsigned short parallaxbgMap[1024];
# 43 "main.c" 2
# 1 "parallaxclouds.h" 1







extern const unsigned short parallaxcloudsMap[1024];
# 44 "main.c" 2


# 1 "digitalSound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "digitalSound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 47 "main.c" 2
# 1 "play.h" 1





typedef struct {

    char* title;
    unsigned short color;

    unsigned int sampleRate;
    unsigned int length;
    signed char* data;

} SONG;

SONG songs[3];

void init();
void update();
void draw();

void playSong(int);
void prevSong();
void nextSong();

extern int paused;
extern int shuffle;
extern int currentSong;

extern int minute;
extern int second;
# 48 "main.c" 2
# 1 "surge.h" 1


extern const unsigned int surge_sampleRate;
extern const unsigned int surge_length;
extern const signed char surge_data[];
# 49 "main.c" 2
# 1 "analogSound.h" 1
# 257 "analogSound.h"
enum note {

  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;

typedef struct noteWithDuration {
  enum note note;
  unsigned char duration;
} NoteWithDuration;

void initSound();
void playDrumSound(unsigned char r, unsigned char s, unsigned char b, unsigned char length, unsigned char steptime);
void playNoteWithDuration(NoteWithDuration *n, unsigned char duty);
void playChannel1(unsigned short note, unsigned char length, unsigned char sweepShift, unsigned char sweepTime, unsigned char sweepDir, unsigned char envStepTime, unsigned char envDir, unsigned char duty);
void playAnalogSound(unsigned short sound);
# 50 "main.c" 2

void playPauseSound() {
    playAnalogSound(7);
}




void setupInterrupts();
void interruptHandler();



enum {SUNID = 6, FLOWERID = 12} tileid;


int hScroll;






OBJ_ATTR shadowOAM[128];



void goToStart();
void goToMap();
void goToInstructions();
void goToGame1();
void goToBoss1();
void goToPause();
void goToWin();
void goToLose();

void start();
void game1();
void pause();
void win();
void lose();



enum {START, INSTRUCTIONS, GAME1, BOSS1, PAUSE, WIN, LOSE};
int state;


SPRITE player;
SPRITE bossEntrance;
BOSS waterBoss;
SPRITE startsprite;
typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;


int muShengUnlocked = 0;
int currentCharacter = 0;

int animationCounter = 0;
int animationSpeed = 10;


unsigned short buttons;
unsigned short oldButtons;


int hOff;
int vOff;


int prevState;
# 132 "main.c"
int main() {
    initSound();
    initialize();
    state = START;


   while (1) {
    oldButtons = buttons;
    buttons = (*(volatile unsigned short *)0x04000130);
    switch (state) {
        case START:
            drawstartsprite();
            start();
            updatestart();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME1:
            game1();
            break;
        case BOSS1:
            boss();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
    }

}
}



void initialize() {

    setupSounds();
    setupInterrupts();
    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    init();
    goToStart();

}


void goToStart() {

    hideSprites();



    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);


    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((8) << 8) | (0 << 14) | (1 << 7) | 2;
    (*(volatile unsigned short*) 0x400000A) = ((0) << 2) | ((16) << 8) | (0 << 14) | (1 << 7)| 0;



    DMANow(3, parallaxtilesetPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, parallaxtilesetTiles, &((CB*) 0x6000000)[0], 45056 / 2);
    DMANow(3, parallaxtilesetTiles, &((CB*) 0x6000000)[0], 45056 / 2);

    DMANow(3, parallaxbgMap, &((SB*) 0x6000000)[8], (2048) / 2);



    DMANow(3, parallaxcloudsMap, &((SB*) 0x6000000)[16], (2048) / 2);



     DMANow(3, myspritesheetTiles, &((CB*) 0x6000000)[4], 32768/2);
     DMANow(3, myspritesheetPal, ((u16 *)0x5000200), 256);

     startsprite.width = 16;
     startsprite.height = 40;
     startsprite.x = 40;
     startsprite.y = 64;

    playSoundA(surge_data, surge_length, 1);
    state = START;


}

void updatestart() {







    hScroll++;

    (*(volatile unsigned short*) 0x04000014) = hScroll;
    (*(volatile unsigned short*) 0x04000010) = hScroll/2;

}

void start() {


    drawstartsprite();


    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {

        goToInstructions();
    }

}

    void goToInstructions() {
        (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));



        DMANow(3, instructionsPal, ((unsigned short *)0x5000000), 256);

        drawFullscreenImage4(instructionsBitmap);

        hideSprites();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
        waitForVBlank();

        state = INSTRUCTIONS;


    }
    void instructions() {
        waitForVBlank();

        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
            goToGame1();
        }
    }

    void goToPause() {

        playPauseSound();
        (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));



        DMANow(3, pausedPal, ((unsigned short *)0x5000000), 256);

        drawFullscreenImage4(pausedBitmap);

        hideSprites();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
        waitForVBlank();

        if (state == GAME1) {
            prevState = 0;
        } else if (state == BOSS1) {
            prevState = 1;
        }
        state = PAUSE;
    }



    void pause() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToStart();
    }

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) && prevState == 0) {
        goToGame1();
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3)))) && prevState == 1) {
        goToBoss1();
    }
}


void goToWin() {
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));



        DMANow(3, winPal, ((unsigned short *)0x5000000), 256);

        drawFullscreenImage4(winBitmap);

    hideSprites();

    waitForVBlank();


    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    muShengUnlocked = 1;
    prevState = 2;
    state = WIN;
}


void win() {
    waitForVBlank();
    prevState = 2;

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGame1();
        return;
    }
}


void goToLose() {

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));



    DMANow(3, losePal, ((unsigned short *)0x5000000), 256);

    drawFullscreenImage4(loseBitmap);


    hideSprites();

     waitForVBlank();


     DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

     state = LOSE;
}


void lose() {
    waitForVBlank();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {

        goToStart();
        return;
    }
}


void goToGame1() {

    if (prevState == 2) {
        muShengUnlocked = 1;
    }

    if (state == PAUSE) {
        (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
        (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((28) << 8) | (1 << 7) | (0 << 14);


        DMANow(3, tilesetsampleTiles, &((CB*) 0x6000000)[0], 65536/2);
        DMANow(3, tilemapsampleMap, &((SB*) 0x6000000)[28], (2048)/2);
        DMANow(3, tilesetsamplePal, ((unsigned short *)0x5000000), 256);


        DMANow(3, myspritesheetTiles, &((CB*) 0x6000000)[4], 32768/2);
        DMANow(3, myspritesheetPal, ((u16 *)0x5000200), 256);
        state = GAME1;
        return;
    }


    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);


    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((28) << 8) | (1 << 7) | (0 << 14);



    DMANow(3, tilesetsampleTiles, &((CB*) 0x6000000)[0], 65536/2);
    DMANow(3, tilemapsampleMap, &((SB*) 0x6000000)[28], (2048)/2);
    DMANow(3, tilesetsamplePal, ((unsigned short *)0x5000000), 256);


    DMANow(3, myspritesheetTiles, &((CB*) 0x6000000)[4], 32768/2);
    DMANow(3, myspritesheetPal, ((u16 *)0x5000200), 256);


    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    hOff = 0;
    vOff = 0;


    player.width = 16;
    player.height = 40;
    player.x = 30;
    player.y = 14;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.currentFrame = 0;
    player.isAnimating = 0;
    player.health = 20;



    bossEntrance.width = 16;
    bossEntrance.height = 32;
    bossEntrance.x = 200;
    bossEntrance.y = 160;


    initBoss(&waterBoss, 100, 90, 64, 64);

    state = GAME1;
}


void game1() {

    updatePlayer();





        if (muShengUnlocked && (!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {

            currentCharacter = (currentCharacter == 0) ? 1 : 0;
        }

    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))){
        goToBoss1();
        return;
    }


    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
        return;
    }


    drawPlayer();
    drawBossEntrance();


    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

}


void goToBoss1() {
    prevState = 1;

    if (state == PAUSE) {
        (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
        (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((28) << 8) | (1 << 7) | (0 << 14);


        DMANow(3, decor_8x8Tiles, &((CB*) 0x6000000)[0], 1024/2);
        DMANow(3, bossroom1Map, &((SB*) 0x6000000)[28], (2048)/2);
        DMANow(3, decor_8x8Pal, ((unsigned short *)0x5000000), 256);

        DMANow(3, myspritesheetTiles, &((CB*) 0x6000000)[4], 32768/2);
        DMANow(3, myspritesheetPal, ((u16 *)0x5000200), 256);
        state = BOSS1;
        return;
    }


    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);


    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((28) << 8) | (1 << 7) | (0 << 14);



        DMANow(3, decor_8x8Tiles, &((CB*) 0x6000000)[0], 1024/2);
        DMANow(3, bossroom1Map, &((SB*) 0x6000000)[28], (2048)/2);
        DMANow(3, decor_8x8Pal, ((unsigned short *)0x5000000), 256);
        DMANow(3, myspritesheetTiles, &((CB*) 0x6000000)[4], 32768/2);
        DMANow(3, myspritesheetPal, ((u16 *)0x5000200), 256);


    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    hOff = 0;
    vOff = 0;



    player.x = 100;
    player.y = 100;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.currentFrame = 0;
    player.isAnimating = 0;
    player.health = 20;
    player.damageTimer = 0;

    state = BOSS1;
}



void boss() {
    updatePlayer();
    updateBoss(&waterBoss, &player);


    if (player.damageTimer > 0) {
        player.damageTimer--;
    }



    if (checkBossCollision(&waterBoss, &player)) {

        if (waterBoss.currentFrame == 2 && player.damageTimer == 0) {
            player.health -= 5;
            player.damageTimer = 60;


            if (player.health <= 0) {
                player.health = 0;
                goToLose();
            }
        }


        if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1)))) && player.isAttacking) {
            waterBoss.lives-=5;


            if (waterBoss.lives <= 0) {
                goToWin();
            }
        }
    }

    drawPlayer();
    drawWaterBoss();



        waitForVBlank();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);


        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
            goToPause();
        }

}


    void updatePlayer() {

        player.isAnimating = 0;

        int leftX = player.x;
        int rightX = player.x + player.width - 1;
        int topY = player.y;
        int bottomY = player.y + player.height - 1;


        if ((~(buttons) & ((1<<6)))) {
            player.direction = UP;
            player.isAnimating = 1;
            if (player.y > 0 ) {
                player.y -= player.yVel;
            }
        }

        if ((~(buttons) & ((1<<7)))) {
            player.direction = DOWN;
            player.isAnimating = 1;
            if (player.y < 256 - player.height ) {
                player.y += player.yVel;
            }
        }


        if ((~(buttons) & ((1<<5)))) {
            player.direction = LEFT;
            player.isAnimating = 1;
            if (player.x > 0 ) {
                player.x -= player.xVel;
            }
        }


        if ((~(buttons) & ((1<<4)))) {
            player.direction = RIGHT;
            player.isAnimating = 1;
            if (player.x < 256 - player.width ) {
                player.x += player.xVel;
            }
        }



    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1)))) && !player.isAttacking) {
        player.isAttacking = 1;






    }



    if (player.isAttacking) {
        if (--player.timeUntilNextFrame <= 0) {
            player.timeUntilNextFrame = 5;
            player.currentFrame++;
            if (player.currentFrame >= player.numFrames) {
                player.currentFrame = 0;
                player.isAttacking = 0;
            }
        }

    }





    if (player.x < 0) player.x = 0;
    if (player.y < 0) player.y = 0;
    if (player.x + player.width > 256) player.x = 256 - player.width;
    if (player.y + player.height > 256) player.y = 256 - player.height;


    hOff = player.x - (240 - player.width) / 2;
    vOff = player.y - (160 - player.height) / 2;


    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > 256 - 240) hOff = 256 - 240;
    if (vOff > 256 - 160) vOff = 256 - 160;
    }






    void drawPlayer() {

        shadowOAM[0].attr0 = ((player.y - vOff) & 0xFF) | (0<<13) | (2<<14);
        shadowOAM[0].attr1 = ((player.x - hOff) & 0x1FF) | (2<<14);



        (*(volatile unsigned short*) 0x04000010) = hOff;
        (*(volatile unsigned short*) 0x04000012) = vOff;

        int baseTileIndex = 0;
        int row = 0;


        animationCounter++;
        if (animationCounter >= animationSpeed) {
            animationCounter = 0;
            player.currentFrame = (player.currentFrame + 1) % 7;
        }

        if (player.isAttacking) {

            if (currentCharacter == 1) {
                shadowOAM[0].attr2 = ((((16) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {
                shadowOAM[0].attr2 = ((((1) * (32) + (2))) & 0x3FF) | (((0) & 0xF) <<12);
            }
        } else {

            if (currentCharacter == 1) {
                shadowOAM[0].attr2 = ((((16) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);
            } else {


            if (player.direction == DOWN) {
                row = 0;


            } else if (player.direction == UP) {
                row = 1;
            } else if (player.direction == LEFT) {
                row = 2;
            } else if (player.direction == RIGHT) {
                row = 3;
            }


            row += (currentCharacter * 4);



            int column = player.currentFrame % 7;

            shadowOAM[0].attr2 = ((((row * 4) * (32) + (column * 2))) & 0x3FF) | (((0) & 0xF) <<12);
            }
        }

    }


    void drawBossEntrance(){
        int screenX = bossEntrance.x - hOff;
        int screenY = bossEntrance.y - vOff;

         shadowOAM[1].attr0 = ((screenY) & 0xFF) | (1<<13) | (2<<14);
         shadowOAM[1].attr1 = ((screenX) & 0x1FF) | (2<<14);
         shadowOAM[1].attr2 = ((((17) * (32) + (0))) & 0x3FF) | (((0) & 0xF) <<12);
    }

    void drawstartsprite(){
        shadowOAM[5].attr0 = ((startsprite.y) & 0xFF) | (0<<13) | (0<<14);
        shadowOAM[5].attr1 = ((startsprite.x) & 0x1FF) | (3<<14);
        shadowOAM[5].attr2 = ((((90) * (32) + (0))) & 0x3FF) | (((1) & 0xF) <<12) | (((1) & 3) << 10);

    }

    void drawWaterBoss(){
        int screenX = waterBoss.x - hOff;
        int screenY = waterBoss.y - vOff;

        shadowOAM[2].attr0 = ((screenY) & 0xFF) | (0<<13) | (0<<14);
        shadowOAM[2].attr1 = ((screenX) & 0x1FF) | (3<<14);
        shadowOAM[2].attr2 = ((((17) * (32) + (2))) & 0x3FF) | (((0) & 0xF) <<12);




        if (waterBoss.currentFrame == 0) {
            shadowOAM[3].attr0 = (2<<8);

            shadowOAM[2].attr2 = ((((17) * (32) + (2))) & 0x3FF) | (((0) & 0xF) <<12);
        } else if (waterBoss.currentFrame == 1) {

            shadowOAM[3].attr0 = (2<<8);
            shadowOAM[2].attr2 = ((((17) * (32) + (9))) & 0x3FF) | (((0) & 0xF) <<12);
        } else if (waterBoss.currentFrame == 2) {

            shadowOAM[2].attr0 = ((screenY) & 0xFF) | (0<<13) | (0<<14);
            shadowOAM[2].attr1 = ((screenX-64) & 0x1FF) | (3<<14);
            shadowOAM[2].attr2 = ((((17) * (32) + (15))) & 0x3FF) | (((0) & 0xF) <<12);

            shadowOAM[3].attr0 = ((screenY) & 0xFF) | (0<<13) | (0<<14);
            shadowOAM[3].attr1 = ((screenX) & 0x1FF) | (3<<14);
            shadowOAM[3].attr2 = ((((17) * (32) + (23))) & 0x3FF) | (((0) & 0xF) <<12);
        }


        waterBoss.timeUntilNextFrame--;
        if(waterBoss.timeUntilNextFrame <= 0) {
            waterBoss.currentFrame = (waterBoss.currentFrame + 1) % 3;
            waterBoss.timeUntilNextFrame = (rand() % (50 - 20 + 1)) + 20;
        }
    }





    void playBackgroundMusic() {

        playSoundA(surge_data, surge_length, 1);
    }


    void setupInterrupts() {

        *(unsigned short*)0x4000208 = 0;


        *(unsigned short*)0x4000200 = (1 << 0) | (1 << ((2 % 4) + 3)) | (1 << ((3 % 4) + 3));

        *(unsigned short*)0x4000004 = (1 << 3);
        *((ihp*)0x03007FFC) = &interruptHandler;

        *(unsigned short*)0x4000208 = 1;

    }


    void interruptHandler() {
        *(unsigned short*)0x4000208 = 0;

        if (*(volatile unsigned short*)0x4000202 & (1 << 0)) {

            if (soundA.isPlaying) {
                soundA.vBlankCount++;
                if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                    if (soundA.looping) {
                        playSoundA(soundA.data, soundA.dataLength, 1);
                    } else {
                        soundA.isPlaying = 0;
                        ((DMAChannel*)0x040000B0)[1].ctrl = 0;
                        *(volatile unsigned short*)0x4000102 = 0;
                    }
                }
            }

        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundB.looping) {
                    playSoundB(soundB.data, soundB.dataLength, 1);
                } else {
                    soundB.isPlaying = 0;
                    ((DMAChannel*)0x040000B0)[2].ctrl = 0;
                    *(volatile unsigned short*)0x4000106 = 0;
                }
            }
        }
        }

        *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
        *(unsigned short*)0x4000208 = 1;
    }
