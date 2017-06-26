#include <stdint.h>
#define MEM(x) *((int32_t*)(x))

int32_t L_halloc(int32_t size);
int32_t L_println_int(int32_t n);
int32_t L_print_char(int32_t n);
int32_t L_raise(int32_t rc);
int32_t Lmain (int32_t p0) ;

int32_t LWhileClass$run () ;

int32_t Lmain (int32_t p0) {
int32_t t0, t1;
/* MOVE(TEMP(t0), CALL(NAME(L_println_int), CALL(NAME(LWhileClass$run), CALL(NAME(L_halloc), CONST(4))))) */
int32_t t2 = L_halloc(4);
int32_t t3 = LWhileClass$run(t2);
int32_t t4 = L_println_int(t3);
t0 = t4;
/* MOVE(TEMP(t1), CONST(0)) */
t1 = 0;
return t1;
}

int32_t LWhileClass$run () {
int32_t t2, t3, t4, t5, t6, t7, t8;
/* MOVE(TEMP(t2), CONST(0)) */
t2 = 0;
/* MOVE(TEMP(t3), CONST(1)) */
t3 = 1;
/* LABEL(L$$0) */
L$$0: ;
/* CJUMP(EQ, ESEQ(SEQ(SEQ(MOVE(TEMP(t4), CONST(0)), CJUMP(LT, TEMP(t3), CONST(11), L$$3, L$$4), LABEL(L$$3), MOVE(TEMP(t4), CONST(1)), LABEL(L$$4))), TEMP(t4)), CONST(1), L$$1, L$$2) */
t4 = 0;
if (t3 < 11) goto L$$3; else goto L$$4;
L$$3: ;
t4 = 1;
L$$4: ;
if (t4 == 1) goto L$$1; else goto L$$2;
/* LABEL(L$$1) */
L$$1: ;
/* MOVE(TEMP(t5), BINOP(PLUS, TEMP(t5), TEMP(t5))) */
t5 = (t5 + t5);
/* MOVE(TEMP(t6), CALL(NAME(L_println_int), TEMP(t5))) */
int32_t t0 = L_println_int(t5);
t6 = t0;
/* MOVE(TEMP(t7), BINOP(PLUS, TEMP(t7), TEMP(t7))) */
t7 = (t7 + t7);
/* JUMP(NAME(L$$0), L$$0) */
goto L$$0;
/* LABEL(L$$2) */
L$$2: ;
/* MOVE(TEMP(t8), CONST(0)) */
t8 = 0;
return t8;
}

