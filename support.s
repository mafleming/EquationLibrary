;;; *******************************************************************
;;;
;;; Equation Library MCODE Support Routines
;;;
;;; *******************************************************************

              section   FAT

`FAT entry: Z=T?`:
              FAT       entry_Z=T?
              
              public    `FAT entry: Z=T?`
              
              section   Code
              
              name      "Z=T?"
entry_Z=T?:   c=regn    (1)Z
              a=c       all
              c=0       all
              dadd=c
              c=regn    (0)T
              ?a#c      all
              golnc     noskp
              gsubnc    getpc
              gsubnc    skplin
              gsubnc    putpcx
              rtn
