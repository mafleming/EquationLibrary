;;; *******************************************************************
;;;
;;; Equation Library MCODE Support Routines
;;;
;;; *******************************************************************

              section   FAT

`FAT entry: Z=T?`:
              FAT       `entry_Z=T?`
              
              public    `FAT entry: Z=T?`

              include "entry.i"
              
              section   Code
              
              name      "Z=T?"
`entry_Z=T?`:
              c=regn    z
              a=c       w              ;con       0x10E      ;a=c       all
              c=0       w              ;con       0x04E      ;c=0       all
              dadd=c
              c=regn    t
              ?a#c      w              ;con       0x36E      ;?a#c      all
              golnc     NOSKP
              gsubnc    GETPC
              gsubnc    SKPLIN
              gsubnc    PUTPCX
              rtn
