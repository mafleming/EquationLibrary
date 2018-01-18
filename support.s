;;; *******************************************************************
;;;
;;; Equation Library MCODE Support Routines
;;;
;;; *******************************************************************

              .section   FAT

`FAT entry: Z=T?`:
              .fat      `entry_Z=T?`
              
              .public    `FAT entry: Z=T?`

#include "mainframe.h"
              .section  Code
              
              .name     "Z=T?"
`entry_Z=T?`:
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
