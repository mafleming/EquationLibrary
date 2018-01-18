RPN_SRCS = eqnlib.rpn ch2x.rpn eslv.rpn eslv+.rpn sar.rpn appeqn.rpn inieqn.rpn
RPN_RAWS =
ASM_SRCS = header.s support.s

OBJS =$(RPN_SRCS:%.rpn=%.o) $(RPN_RAWS:%.raw=%.o) $(ASM_SRCS:%.s=%.o) 
ARGS = header.o eqnlib.o ch2x.o eslv.o eslv+.o sar.o appeqn.o inieqn.o support.o
MOD = eqnlib.mod

XEQLST = --xeq-from-rom="ESLV ESLV+"
all:	$(MOD)

clean:
	-rm -f ${OBJS} *.lst $(MOD)

%.o: %.rpn
	rpncomp -l --no-fat ${XEQLST} $<

%.o: %.raw
	rpncomp $<

%.o: %.s
	asnut -l $<

$(MOD): $(OBJS) plugin4k.scm eqnlib.moddesc Makefile
	lnnut -leqnmod.lst $(ARGS) plugin4k.scm eqnlib.moddesc -o $(MOD)


