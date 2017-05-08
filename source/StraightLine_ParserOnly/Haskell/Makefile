SRCS = $(shell ls *.hs) $(subst .x,.hs,$(shell ls *.x)) $(subst .y,.hs,$(shell ls *.y))
OBJS = $(subst .hs,.o,$(SRCS))
TARGET = sleval
TEST_PRGS = $(ls ../examples/*.sl)

.PHONY : all parse run-all clean veryclean distrib
.PRECIOUS : *.hs 

all: $(TARGET)

parser : SLLex.hs SLParse.hs

run-all: all
	@for i in $(TEST_PRGS); do ./$(TARGET) < $i; done

%.hs:	%.y
	happy -iGRM.LOG $<

%.hs:	%.x
	alex $<

%.o:	%.hs
	ghc -c -o $@ $<

$(TARGET): $(SRCS)
	ghc --make -o $@ SLMain.hs

clean:
	-rm *.o *.hi 

veryclean: clean
	-rm SLLex.hs SLParse.hs $(TARGET)

distrib:
	tar cvfz StraightLine.tgz $(SRCS) SLLex.x SLParse.y Makefile

SLLex.o:	SLTokens.o
SLParse.o:	SLLex.o
SLParse.o:	SLAbsSyn.o
SLInterp.o:	SLParse.o
SLMain.o:	SLInterp.o
SLMain.o:	SLParse.o
# EOF
