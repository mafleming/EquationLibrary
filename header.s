;;; *******************************************************************
;;;
;;; Equation Library module header
;;;
;;; *******************************************************************

              .section HEADER
              .con   17                      ; XROM number
              .con   .fatsize fatend
fatstart:     .fat   header

              .section FATEND
;;; End marker for function address table
fatend:       .con   0,0

              .section Code
;;; Make an empty name function for the module to show up in CAT 2
              .name  "EQNLIB 1B"        ; The name of the module
header:       rtn

              .section PollVectors
;;; Tail of the module with empty poll points and module ID
              .con   0               ; Pause
              .con   0               ; Running
              .con   0               ; Wake w/o key
              .con   0               ; Powoff
              .con   0               ; I/O
              .con   0               ; Deep wake-up
              nop                   ; Memory lost
              .text  "B1QE"             ; EQ1B
