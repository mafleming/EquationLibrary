These are the source files and and build files for the HP-41CL Equation
Library. The files are compiled, assembled and linked to form a MOD file
by the NutStudio development tool set. See the documentation for how to
setup and use the program module.

To build the Equation Library module `eqnlib.mod' simply type "make".
You may need to alter the Makefile to point to the location of include
files and module description files.

Compilation of the eqnlib.rpn source leaves references to the module
solver programs "ESLV" and "ESLV+" as XEQ "ESLV" and XEQ "ESLV+" rather
than as XROM references so that they can be overridden by your own
solver code.