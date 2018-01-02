RPN_SRCS = eqnlib.rpn ch2x.rpn eslv.rpn eslv+.rpn sar.rpn appeqn.rpn inieqn.rpn
RPN_RAWS =
ASM_SRCS = header.s mainframe.s support.s

OBJS =$(RPN_SRCS:%.rpn=%.o) $(RPN_RAWS:%.raw=%.o) $(ASM_SRCS:%.s=%.o) 
ARGS = header.o mainframe.o eqnlib.o ch2x.o eslv.o eslv+.o sar.o appeqn.o inieqn.o support.o
MOD = eqnlib.mod

all:	$(MOD)

clean:
	-rm -f ${OBJS} *.lst $(MOD)

%.o: %.rpn
	rpncomp -I../module-descriptor $<

%.o: %.raw
	rpncomp -I../module-descriptor $<

%.o: %.s
	nutasm $<

$(MOD): $(OBJS) Plugin4K.rules eqnlib.ModDesc Makefile
	nutlink $(ARGS) --rules=Plugin4K.rules --modfile-description=eqnlib.ModDesc \
		-o $(MOD)


