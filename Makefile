RPN_SRCS = eqnlib.rpn ch2x.rpn eslv.rpn eslv+.rpn sar.rpn appeqn.rpn inieqn.rpn
RPN_RAWS =
ASM_SRCS = header.s support.s

OBJS =$(RPN_SRCS:%.rpn=%.o) $(RPN_RAWS:%.raw=%.o) $(ASM_SRCS:%.s=%.o) 
ARGS = header.o eqnlib.o ch2x.o eslv.o eslv+.o sar.o appeqn.o inieqn.o support.o
MOD = eqnlib.mod

all:	$(MOD)

clean:
	-rm -f ${OBJS} *.lst $(MOD)

%.o: %.rpn
	rpncomp -I/usr/local/include/module-export $<

%.o: %.raw
	rpncomp -I/usr/local/include/module-export $<

%.o: %.s
	asnut -I/usr/local/include $<

$(MOD): $(OBJS) plugin4k.scm eqnlib.moddesc Makefile
	lnnut $(ARGS) plugin4k.scm eqnlib.moddesc -o $(MOD)


