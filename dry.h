#define Version "C, Version 2.2"

/* Compiler and system dependent definitions: */

/* variables for time measurement: */

#define CLOCK_TYPE "times()"
#include <sys/types.h>
#include <sys/times.h>
#ifndef HZ	/* Added by SP 900619 */
#include <sys/param.h> /* If your system doesn't have this, use -DHZ=xxx */
#else
	*** You must define HZ!!! ***
#endif /* HZ */
#ifndef PASS2
struct tms      time_info;
#endif
/*extern  int     times ();*/
                /* see library function "times" */
#define Too_Small_Time (2*HZ)
                /* Measurements should last at least about 2 seconds */
#define Start_Timer() times(&time_info); Begin_Time=(long)time_info.tms_utime
#define Stop_Timer()  times(&time_info); End_Time = (long)time_info.tms_utime


#define Mic_secs_Per_Second     1000000.0
#define NUMBER_OF_RUNS		50000 /* Default number of runs */

#define structassign(d, s)      d = s

  typedef       enum    {Ident_1, Ident_2, Ident_3, Ident_4, Ident_5}
                Enumeration;

/* General definitions: */

#include <stdio.h>	/* I/O */
#include <string.h>	/* strcpy, strcmp */

#define Null 0 
                /* Value of a Null pointer */
#define true  1
#define false 0

typedef int     One_Thirty;
typedef int     One_Fifty;
typedef char    Capital_Letter;
typedef int     Boolean;
typedef char    Str_30 [31];
typedef int     Arr_1_Dim [50];
typedef int     Arr_2_Dim [50] [50];

typedef struct record 
    {
    struct record *Ptr_Comp;
    Enumeration    Discr;
    union {
          struct {
                  Enumeration Enum_Comp;
                  int         Int_Comp;
                  char        Str_Comp [31];
                  } var_1;
          struct {
                  Enumeration E_Comp_2;
                  char        Str_2_Comp [31];
                  } var_2;
          struct {
                  char        Ch_1_Comp;
                  char        Ch_2_Comp;
                  } var_3;
          } variant;
      } Rec_Type, *Rec_Pointer;

/* prototype declarations which are needed in both files */
void Proc_6(Enumeration Enum_Val_Par, Enumeration *Enum_Ref_Par);
void Proc_7(One_Fifty Int_1_Par_Val, One_Fifty Int_2_Par_Val,
	    One_Fifty *Int_Par_Ref);
void Proc_8(Arr_1_Dim Arr_1_Par_Ref, Arr_2_Dim Arr_2_Par_Ref,
	    int Int_1_Par_Val, int Int_2_Par_Val);
Enumeration Func_1(Capital_Letter Ch_1_Par_Val, Capital_Letter Ch_2_Par_Val);
Boolean Func_2(Str_30 Str_1_Par_Ref, Str_30 Str_2_Par_Ref);
