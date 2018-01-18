;;; *******************************************************************
;;;
;;; Equation Library MCODE Support Routines
;;;
;;; *******************************************************************

              
              .public    ZEQT

#include "mainframe.h"
              .section  Code
              
              .name     "Z=T?"
ZEQT:
              c=regn    z
              a=c       w              ;a=c       all
              c=0       w              ;c=0       all
              dadd=c
              c=regn    t
              ?a#c      w              ;?a#c      all 
              golnc     NOSKP
              gsubnc    GETPC
              gsubnc    SKPLIN
              gsubnc    PUTPCX
              rtn
