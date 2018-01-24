RPN_SRCS = eqnlib.rpn ch2x.rpn eslv.rpn eslv+.rpn sar.rpn appeqn.rpn inieqn.rpn
RPN_RAWS =
ASM_SRCS = header.s support.s

OBJS =$(RPN_SRCS:%.rpn=%.o) $(RPN_RAWS:%.raw=%.o) $(ASM_SRCS:%.s=%.o) 
MOD = eqnlib.mod
ROM = EqnLib1.rom

XEQLST = --xeq-from-rom="ESLV ESLV+"
all:	$(MOD) $(ROM)

mod:	$(MOD)

rom:	$(ROM)

clean:
	-rm -f ${OBJS} *.lst $(MOD) $(ROM)

%.o: %.rpn
	rpncomp --no-fat ${XEQLST} $<

%.o: %.raw
	rpncomp $<

%.o: %.s
	asnut $<

$(MOD): $(OBJS) eqnlib.scm eqnlib.moddesc Makefile
	lnnut -leqnmod.lst $(OBJS) eqnlib.scm eqnlib.moddesc -o $(MOD)

$(ROM):	$(MOD)
	modtool --extract-rom-pages $(MOD)


