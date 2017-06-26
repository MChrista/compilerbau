#include <stdint.h>
#define MEM(x) *((int32_t*)(x))

int32_t L_halloc(int32_t size);
int32_t L_println_int(int32_t n);
int32_t L_print_char(int32_t n);
int32_t L_raise(int32_t rc);
int32_t Lmain (int32_t p0) ;

int32_t LLL$Start (int32_t p0) ;

int32_t LList$Init (int32_t p0) ;

int32_t LList$InitNew (int32_t p0, int32_t p1, int32_t p2, int32_t p3) ;

int32_t LList$Insert (int32_t p0, int32_t p1) ;

int32_t LList$SetNext (int32_t p0, int32_t p1) ;

int32_t LList$Delete (int32_t p0, int32_t p1) ;

int32_t LList$Search (int32_t p0, int32_t p1) ;

int32_t LList$GetEnd (int32_t p0) ;

int32_t LList$GetElem (int32_t p0) ;

int32_t LList$GetNext (int32_t p0) ;

int32_t LList$Print (int32_t p0) ;

int32_t LElement$Init (int32_t p0, int32_t p1, int32_t p2, int32_t p3) ;

int32_t LElement$GetAge (int32_t p0) ;

int32_t LElement$GetSalary (int32_t p0) ;

int32_t LElement$GetMarried (int32_t p0) ;

int32_t LElement$Equal (int32_t p0, int32_t p1) ;

int32_t LElement$Compare (int32_t p0, int32_t p1, int32_t p2) ;

int32_t Lmain (int32_t p0) {
int32_t t0, t1;
/* MOVE(TEMP(t0), CALL(NAME(L_println_int), CALL(NAME(LLL$Start), CALL(NAME(L_halloc), CONST(4))))) */
int32_t t2 = L_halloc(4);
int32_t t3 = LLL$Start(t2);
int32_t t4 = L_println_int(t3);
t0 = t4;
/* MOVE(TEMP(t1), CONST(0)) */
t1 = 0;
return t1;
}

int32_t LLL$Start (int32_t p0) {
int32_t t11, t14, t17, t2, t22, t24, t25, t26, t3, t31, t34, t37, t38, t4, t7;
/* MOVE(TEMP(t2), CALL(NAME(L_halloc), CONST(16))) */
int32_t t0 = L_halloc(16);
t2 = t0;
/* MOVE(TEMP(t3), CALL(NAME(LList$Init), PARAM(0))) */
int32_t t1 = LList$Init(p0);
t3 = t1;
/* MOVE(TEMP(t4), TEMP(t2)) */
t4 = t2;
/* MOVE(TEMP(t3), CALL(NAME(LList$Init), PARAM(0))) */
int32_t t5 = LList$Init(p0);
t3 = t5;
/* MOVE(TEMP(t3), CALL(NAME(LList$Print), PARAM(0))) */
int32_t t6 = LList$Print(p0);
t3 = t6;
/* MOVE(TEMP(t7), CALL(NAME(L_halloc), CONST(16))) */
int32_t t8 = L_halloc(16);
t7 = t8;
/* MOVE(TEMP(t3), CALL(NAME(LElement$Init), PARAM(0), CONST(25), CONST(37000), CONST(0))) */
int32_t t9 = LElement$Init(p0, 25, 37000, 0);
t3 = t9;
/* MOVE(TEMP(t4), CALL(NAME(LList$Insert), PARAM(0), TEMP(t7))) */
int32_t t10 = LList$Insert(p0, t7);
t4 = t10;
/* MOVE(TEMP(t3), CALL(NAME(LList$Print), PARAM(0))) */
int32_t t12 = LList$Print(p0);
t3 = t12;
/* MOVE(TEMP(t11), CALL(NAME(L_println_int), CONST(10000000))) */
int32_t t13 = L_println_int(10000000);
t11 = t13;
/* MOVE(TEMP(t7), CALL(NAME(L_halloc), CONST(16))) */
int32_t t15 = L_halloc(16);
t7 = t15;
/* MOVE(TEMP(t3), CALL(NAME(LElement$Init), PARAM(0), CONST(39), CONST(42000), CONST(1))) */
int32_t t16 = LElement$Init(p0, 39, 42000, 1);
t3 = t16;
/* MOVE(TEMP(t14), TEMP(t7)) */
t14 = t7;
/* MOVE(TEMP(t4), CALL(NAME(LList$Insert), PARAM(0), TEMP(t7))) */
int32_t t18 = LList$Insert(p0, t7);
t4 = t18;
/* MOVE(TEMP(t3), CALL(NAME(LList$Print), PARAM(0))) */
int32_t t19 = LList$Print(p0);
t3 = t19;
/* MOVE(TEMP(t17), CALL(NAME(L_println_int), CONST(10000000))) */
int32_t t20 = L_println_int(10000000);
t17 = t20;
/* MOVE(TEMP(t7), CALL(NAME(L_halloc), CONST(16))) */
int32_t t21 = L_halloc(16);
t7 = t21;
/* MOVE(TEMP(t3), CALL(NAME(LElement$Init), PARAM(0), CONST(22), CONST(34000), CONST(0))) */
int32_t t23 = LElement$Init(p0, 22, 34000, 0);
t3 = t23;
/* MOVE(TEMP(t4), CALL(NAME(LList$Insert), PARAM(0), TEMP(t7))) */
int32_t t27 = LList$Insert(p0, t7);
t4 = t27;
/* MOVE(TEMP(t3), CALL(NAME(LList$Print), PARAM(0))) */
int32_t t28 = LList$Print(p0);
t3 = t28;
/* MOVE(TEMP(t22), CALL(NAME(L_halloc), CONST(16))) */
int32_t t29 = L_halloc(16);
t22 = t29;
/* MOVE(TEMP(t3), CALL(NAME(LElement$Init), PARAM(0), CONST(27), CONST(34000), CONST(0))) */
int32_t t30 = LElement$Init(p0, 27, 34000, 0);
t3 = t30;
/* MOVE(TEMP(t24), CALL(NAME(L_println_int), CALL(NAME(LList$Search), PARAM(0), TEMP(t14)))) */
int32_t t32 = LList$Search(p0, t14);
int32_t t33 = L_println_int(t32);
t24 = t33;
/* MOVE(TEMP(t25), CALL(NAME(L_println_int), CALL(NAME(LList$Search), PARAM(0), TEMP(t22)))) */
int32_t t35 = LList$Search(p0, t22);
int32_t t36 = L_println_int(t35);
t25 = t36;
/* MOVE(TEMP(t26), CALL(NAME(L_println_int), CONST(10000000))) */
int32_t t39 = L_println_int(10000000);
t26 = t39;
/* MOVE(TEMP(t7), CALL(NAME(L_halloc), CONST(16))) */
int32_t t40 = L_halloc(16);
t7 = t40;
/* MOVE(TEMP(t3), CALL(NAME(LElement$Init), PARAM(0), CONST(28), CONST(35000), CONST(0))) */
int32_t t41 = LElement$Init(p0, 28, 35000, 0);
t3 = t41;
/* MOVE(TEMP(t4), CALL(NAME(LList$Insert), PARAM(0), TEMP(t7))) */
int32_t t42 = LList$Insert(p0, t7);
t4 = t42;
/* MOVE(TEMP(t3), CALL(NAME(LList$Print), PARAM(0))) */
int32_t t43 = LList$Print(p0);
t3 = t43;
/* MOVE(TEMP(t31), CALL(NAME(L_println_int), CONST(2220000))) */
int32_t t44 = L_println_int(2220000);
t31 = t44;
/* MOVE(TEMP(t4), CALL(NAME(LList$Delete), PARAM(0), TEMP(t14))) */
int32_t t45 = LList$Delete(p0, t14);
t4 = t45;
/* MOVE(TEMP(t3), CALL(NAME(LList$Print), PARAM(0))) */
int32_t t46 = LList$Print(p0);
t3 = t46;
/* MOVE(TEMP(t34), CALL(NAME(L_println_int), CONST(33300000))) */
int32_t t47 = L_println_int(33300000);
t34 = t47;
/* MOVE(TEMP(t4), CALL(NAME(LList$Delete), PARAM(0), TEMP(t7))) */
int32_t t48 = LList$Delete(p0, t7);
t4 = t48;
/* MOVE(TEMP(t3), CALL(NAME(LList$Print), PARAM(0))) */
int32_t t49 = LList$Print(p0);
t3 = t49;
/* MOVE(TEMP(t37), CALL(NAME(L_println_int), CONST(44440000))) */
int32_t t50 = L_println_int(44440000);
t37 = t50;
/* MOVE(TEMP(t38), CONST(0)) */
t38 = 0;
return t38;
}

int32_t LList$Init (int32_t p0) {
int32_t t40;
/* MOVE(MEM(BINOP(PLUS, CONST(12), PARAM(0))), CONST(1)) */
int32_t t0 = (12 + p0);
MEM(t0) = 1;
/* MOVE(TEMP(t40), CONST(1)) */
t40 = 1;
return t40;
}

int32_t LList$InitNew (int32_t p0, int32_t p1, int32_t p2, int32_t p3) {
int32_t t44;
/* MOVE(MEM(BINOP(PLUS, CONST(12), PARAM(0))), PARAM(3)) */
int32_t t0 = (12 + p0);
MEM(t0) = p3;
/* MOVE(MEM(BINOP(PLUS, CONST(4), PARAM(0))), PARAM(1)) */
int32_t t1 = (4 + p0);
MEM(t1) = p1;
/* MOVE(MEM(BINOP(PLUS, CONST(8), PARAM(0))), PARAM(2)) */
int32_t t2 = (8 + p0);
MEM(t2) = p2;
/* MOVE(TEMP(t44), CONST(1)) */
t44 = 1;
return t44;
}

int32_t LList$Insert (int32_t p0, int32_t p1) {
int32_t t45, t46, t47, t48;
/* MOVE(TEMP(t45), PARAM(0)) */
t45 = p0;
/* MOVE(TEMP(t46), CALL(NAME(L_halloc), CONST(16))) */
int32_t t0 = L_halloc(16);
t46 = t0;
/* MOVE(TEMP(t47), CALL(NAME(LList$InitNew), PARAM(0), PARAM(1), TEMP(t45), CONST(0))) */
int32_t t1 = LList$InitNew(p0, p1, t45, 0);
t47 = t1;
/* MOVE(TEMP(t48), TEMP(t46)) */
t48 = t46;
return t48;
}

int32_t LList$SetNext (int32_t p0, int32_t p1) {
int32_t t50;
/* MOVE(MEM(BINOP(PLUS, CONST(8), PARAM(0))), PARAM(1)) */
int32_t t0 = (8 + p0);
MEM(t0) = p1;
/* MOVE(TEMP(t50), CONST(1)) */
t50 = 1;
return t50;
}

int32_t LList$Delete (int32_t p0, int32_t p1) {
int32_t t51, t52, t53, t54, t55, t56, t57, t58, t59, t60, t61, t63, t64, t65, t66, t68, t75;
/* MOVE(TEMP(t51), PARAM(0)) */
t51 = p0;
/* MOVE(TEMP(t52), CONST(0)) */
t52 = 0;
/* MOVE(TEMP(t53), BINOP(MINUS, CONST(0), CONST(1))) */
t53 = (0 - 1);
/* MOVE(TEMP(t54), PARAM(0)) */
t54 = p0;
/* MOVE(TEMP(t55), PARAM(0)) */
t55 = p0;
/* MOVE(TEMP(t56), MEM(BINOP(PLUS, CONST(12), PARAM(0)))) */
t56 = MEM((12 + p0));
/* MOVE(TEMP(t57), MEM(BINOP(PLUS, CONST(4), PARAM(0)))) */
t57 = MEM((4 + p0));
/* LABEL(L$$0) */
L$$0: ;
/* CJUMP(EQ, ESEQ(SEQ(SEQ(MOVE(TEMP(t58), CONST(0)), CJUMP(EQ, ESEQ(SEQ(MOVE(TEMP(t59), BINOP(MINUS, CONST(1), TEMP(t56)))), TEMP(t59)), CONST(1), L$$3, L$$5), LABEL(L$$3), CJUMP(EQ, ESEQ(SEQ(MOVE(TEMP(t60), BINOP(MINUS, CONST(1), TEMP(t52)))), TEMP(t60)), CONST(1), L$$4, L$$5), LABEL(L$$4), MOVE(TEMP(t58), CONST(1)), LABEL(L$$5))), TEMP(t58)), CONST(1), L$$1, L$$2) */
t58 = 0;
t59 = (1 - t56);
if (t59 == 1) goto L$$3; else goto L$$5;
L$$3: ;
t60 = (1 - t52);
if (t60 == 1) goto L$$4; else goto L$$5;
L$$4: ;
t58 = 1;
L$$5: ;
if (t58 == 1) goto L$$1; else goto L$$2;
/* LABEL(L$$1) */
L$$1: ;
/* CJUMP(EQ, CALL(NAME(LElement$Equal), PARAM(0), TEMP(t57)), CONST(1), L$$6, L$$7) */
int32_t t0 = LElement$Equal(p0, t57);
if (t0 == 1) goto L$$6; else goto L$$7;
/* LABEL(L$$7) */
L$$7: ;
/* MOVE(TEMP(t61), CONST(0)) */
t61 = 0;
/* JUMP(NAME(L$$8), L$$8) */
goto L$$8;
/* LABEL(L$$6) */
L$$6: ;
/* MOVE(TEMP(t52), CONST(1)) */
t52 = 1;
/* CJUMP(EQ, ESEQ(SEQ(SEQ(MOVE(TEMP(t63), CONST(0)), CJUMP(LT, TEMP(t53), CONST(0), L$$12, L$$13), LABEL(L$$12), MOVE(TEMP(t63), CONST(1)), LABEL(L$$13))), TEMP(t63)), CONST(1), L$$9, L$$10) */
t63 = 0;
if (t53 < 0) goto L$$12; else goto L$$13;
L$$12: ;
t63 = 1;
L$$13: ;
if (t63 == 1) goto L$$9; else goto L$$10;
/* LABEL(L$$10) */
L$$10: ;
/* MOVE(TEMP(t64), CALL(NAME(L_println_int), BINOP(MINUS, CONST(0), CONST(555)))) */
int32_t t1 = L_println_int((0 - 555));
t64 = t1;
/* MOVE(TEMP(t65), CALL(NAME(LList$SetNext), PARAM(0), CALL(NAME(LList$GetNext), PARAM(0)))) */
int32_t t3 = p0;
int32_t t2 = LList$GetNext(p0);
int32_t t4 = LList$SetNext(t3, t2);
t65 = t4;
/* MOVE(TEMP(t66), CALL(NAME(L_println_int), BINOP(MINUS, CONST(0), CONST(555)))) */
int32_t t5 = L_println_int((0 - 555));
t66 = t5;
/* JUMP(NAME(L$$11), L$$11) */
goto L$$11;
/* LABEL(L$$9) */
L$$9: ;
/* MOVE(TEMP(t51), CALL(NAME(LList$GetNext), PARAM(0))) */
int32_t t6 = LList$GetNext(p0);
t51 = t6;
/* LABEL(L$$11) */
L$$11: ;
/* LABEL(L$$8) */
L$$8: ;
/* CJUMP(EQ, ESEQ(SEQ(MOVE(TEMP(t68), BINOP(MINUS, CONST(1), TEMP(t52)))), TEMP(t68)), CONST(1), L$$14, L$$15) */
t68 = (1 - t52);
if (t68 == 1) goto L$$14; else goto L$$15;
/* LABEL(L$$15) */
L$$15: ;
/* MOVE(TEMP(t61), CONST(0)) */
t61 = 0;
/* JUMP(NAME(L$$16), L$$16) */
goto L$$16;
/* LABEL(L$$14) */
L$$14: ;
/* MOVE(TEMP(t55), TEMP(t54)) */
t55 = t54;
/* MOVE(TEMP(t54), CALL(NAME(LList$GetNext), PARAM(0))) */
int32_t t7 = LList$GetNext(p0);
t54 = t7;
/* MOVE(TEMP(t56), CALL(NAME(LList$GetEnd), PARAM(0))) */
int32_t t8 = LList$GetEnd(p0);
t56 = t8;
/* MOVE(TEMP(t57), CALL(NAME(LList$GetElem), PARAM(0))) */
int32_t t9 = LList$GetElem(p0);
t57 = t9;
/* MOVE(TEMP(t53), CONST(1)) */
t53 = 1;
/* LABEL(L$$16) */
L$$16: ;
/* JUMP(NAME(L$$0), L$$0) */
goto L$$0;
/* LABEL(L$$2) */
L$$2: ;
/* MOVE(TEMP(t75), TEMP(t51)) */
t75 = t51;
return t75;
}

int32_t LList$Search (int32_t p0, int32_t p1) {
int32_t t76, t77, t78, t79, t80, t81, t86;
/* MOVE(TEMP(t76), CONST(0)) */
t76 = 0;
/* MOVE(TEMP(t77), PARAM(0)) */
t77 = p0;
/* MOVE(TEMP(t78), MEM(BINOP(PLUS, CONST(12), PARAM(0)))) */
t78 = MEM((12 + p0));
/* MOVE(TEMP(t79), MEM(BINOP(PLUS, CONST(4), PARAM(0)))) */
t79 = MEM((4 + p0));
/* LABEL(L$$17) */
L$$17: ;
/* CJUMP(EQ, ESEQ(SEQ(MOVE(TEMP(t80), BINOP(MINUS, CONST(1), TEMP(t78)))), TEMP(t80)), CONST(1), L$$18, L$$19) */
t80 = (1 - t78);
if (t80 == 1) goto L$$18; else goto L$$19;
/* LABEL(L$$18) */
L$$18: ;
/* CJUMP(EQ, CALL(NAME(LElement$Equal), PARAM(0), TEMP(t79)), CONST(1), L$$20, L$$21) */
int32_t t0 = LElement$Equal(p0, t79);
if (t0 == 1) goto L$$20; else goto L$$21;
/* LABEL(L$$21) */
L$$21: ;
/* MOVE(TEMP(t81), CONST(0)) */
t81 = 0;
/* JUMP(NAME(L$$22), L$$22) */
goto L$$22;
/* LABEL(L$$20) */
L$$20: ;
/* MOVE(TEMP(t76), CONST(1)) */
t76 = 1;
/* LABEL(L$$22) */
L$$22: ;
/* MOVE(TEMP(t77), CALL(NAME(LList$GetNext), PARAM(0))) */
int32_t t1 = LList$GetNext(p0);
t77 = t1;
/* MOVE(TEMP(t78), CALL(NAME(LList$GetEnd), PARAM(0))) */
int32_t t2 = LList$GetEnd(p0);
t78 = t2;
/* MOVE(TEMP(t79), CALL(NAME(LList$GetElem), PARAM(0))) */
int32_t t3 = LList$GetElem(p0);
t79 = t3;
/* JUMP(NAME(L$$17), L$$17) */
goto L$$17;
/* LABEL(L$$19) */
L$$19: ;
/* MOVE(TEMP(t86), TEMP(t76)) */
t86 = t76;
return t86;
}

int32_t LList$GetEnd (int32_t p0) {
int32_t t87;
/* MOVE(TEMP(t87), MEM(BINOP(PLUS, CONST(12), PARAM(0)))) */
t87 = MEM((12 + p0));
return t87;
}

int32_t LList$GetElem (int32_t p0) {
int32_t t88;
/* MOVE(TEMP(t88), MEM(BINOP(PLUS, CONST(4), PARAM(0)))) */
t88 = MEM((4 + p0));
return t88;
}

int32_t LList$GetNext (int32_t p0) {
int32_t t89;
/* MOVE(TEMP(t89), MEM(BINOP(PLUS, CONST(8), PARAM(0)))) */
t89 = MEM((8 + p0));
return t89;
}

int32_t LList$Print (int32_t p0) {
int32_t t90, t91, t92, t93, t94, t98;
/* MOVE(TEMP(t90), PARAM(0)) */
t90 = p0;
/* MOVE(TEMP(t91), MEM(BINOP(PLUS, CONST(12), PARAM(0)))) */
t91 = MEM((12 + p0));
/* MOVE(TEMP(t92), MEM(BINOP(PLUS, CONST(4), PARAM(0)))) */
t92 = MEM((4 + p0));
/* LABEL(L$$23) */
L$$23: ;
/* CJUMP(EQ, ESEQ(SEQ(MOVE(TEMP(t93), BINOP(MINUS, CONST(1), TEMP(t91)))), TEMP(t93)), CONST(1), L$$24, L$$25) */
t93 = (1 - t91);
if (t93 == 1) goto L$$24; else goto L$$25;
/* LABEL(L$$24) */
L$$24: ;
/* MOVE(TEMP(t94), CALL(NAME(L_println_int), CALL(NAME(LElement$GetAge), PARAM(0)))) */
int32_t t0 = LElement$GetAge(p0);
int32_t t1 = L_println_int(t0);
t94 = t1;
/* MOVE(TEMP(t90), CALL(NAME(LList$GetNext), PARAM(0))) */
int32_t t2 = LList$GetNext(p0);
t90 = t2;
/* MOVE(TEMP(t91), CALL(NAME(LList$GetEnd), PARAM(0))) */
int32_t t3 = LList$GetEnd(p0);
t91 = t3;
/* MOVE(TEMP(t92), CALL(NAME(LList$GetElem), PARAM(0))) */
int32_t t4 = LList$GetElem(p0);
t92 = t4;
/* JUMP(NAME(L$$23), L$$23) */
goto L$$23;
/* LABEL(L$$25) */
L$$25: ;
/* MOVE(TEMP(t98), CONST(1)) */
t98 = 1;
return t98;
}

int32_t LElement$Init (int32_t p0, int32_t p1, int32_t p2, int32_t p3) {
int32_t t102;
/* MOVE(MEM(BINOP(PLUS, CONST(4), PARAM(0))), PARAM(1)) */
int32_t t0 = (4 + p0);
MEM(t0) = p1;
/* MOVE(MEM(BINOP(PLUS, CONST(8), PARAM(0))), PARAM(2)) */
int32_t t1 = (8 + p0);
MEM(t1) = p2;
/* MOVE(MEM(BINOP(PLUS, CONST(12), PARAM(0))), PARAM(3)) */
int32_t t2 = (12 + p0);
MEM(t2) = p3;
/* MOVE(TEMP(t102), CONST(1)) */
t102 = 1;
return t102;
}

int32_t LElement$GetAge (int32_t p0) {
int32_t t103;
/* MOVE(TEMP(t103), MEM(BINOP(PLUS, CONST(4), PARAM(0)))) */
t103 = MEM((4 + p0));
return t103;
}

int32_t LElement$GetSalary (int32_t p0) {
int32_t t104;
/* MOVE(TEMP(t104), MEM(BINOP(PLUS, CONST(8), PARAM(0)))) */
t104 = MEM((8 + p0));
return t104;
}

int32_t LElement$GetMarried (int32_t p0) {
int32_t t105;
/* MOVE(TEMP(t105), MEM(BINOP(PLUS, CONST(12), PARAM(0)))) */
t105 = MEM((12 + p0));
return t105;
}

int32_t LElement$Equal (int32_t p0, int32_t p1) {
int32_t t106, t107, t108, t109, t110, t111, t113, t118;
/* MOVE(TEMP(t106), CONST(1)) */
t106 = 1;
/* MOVE(TEMP(t107), CALL(NAME(LElement$GetAge), PARAM(0))) */
int32_t t0 = LElement$GetAge(p0);
t107 = t0;
/* CJUMP(EQ, ESEQ(SEQ(MOVE(TEMP(t108), BINOP(MINUS, CONST(1), CALL(NAME(LElement$Compare), PARAM(0), TEMP(t107), MEM(BINOP(PLUS, CONST(4), PARAM(0))))))), TEMP(t108)), CONST(1), L$$26, L$$27) */
int32_t t2 = 1;
int32_t t1 = LElement$Compare(p0, t107, MEM((4 + p0)));
t108 = (t2 - t1);
if (t108 == 1) goto L$$26; else goto L$$27;
/* LABEL(L$$27) */
L$$27: ;
/* MOVE(TEMP(t109), CALL(NAME(LElement$GetSalary), PARAM(0))) */
int32_t t3 = LElement$GetSalary(p0);
t109 = t3;
/* CJUMP(EQ, ESEQ(SEQ(MOVE(TEMP(t110), BINOP(MINUS, CONST(1), CALL(NAME(LElement$Compare), PARAM(0), TEMP(t109), MEM(BINOP(PLUS, CONST(8), PARAM(0))))))), TEMP(t110)), CONST(1), L$$29, L$$30) */
int32_t t5 = 1;
int32_t t4 = LElement$Compare(p0, t109, MEM((8 + p0)));
t110 = (t5 - t4);
if (t110 == 1) goto L$$29; else goto L$$30;
/* LABEL(L$$30) */
L$$30: ;
/* CJUMP(EQ, MEM(BINOP(PLUS, CONST(12), PARAM(0))), CONST(1), L$$32, L$$33) */
if (MEM((12 + p0)) == 1) goto L$$32; else goto L$$33;
/* LABEL(L$$33) */
L$$33: ;
/* CJUMP(EQ, CALL(NAME(LElement$GetMarried), PARAM(0)), CONST(1), L$$35, L$$36) */
int32_t t6 = LElement$GetMarried(p0);
if (t6 == 1) goto L$$35; else goto L$$36;
/* LABEL(L$$36) */
L$$36: ;
/* MOVE(TEMP(t111), CONST(0)) */
t111 = 0;
/* JUMP(NAME(L$$37), L$$37) */
goto L$$37;
/* LABEL(L$$35) */
L$$35: ;
/* MOVE(TEMP(t106), CONST(0)) */
t106 = 0;
/* LABEL(L$$37) */
L$$37: ;
/* JUMP(NAME(L$$34), L$$34) */
goto L$$34;
/* LABEL(L$$32) */
L$$32: ;
/* CJUMP(EQ, ESEQ(SEQ(MOVE(TEMP(t113), BINOP(MINUS, CONST(1), CALL(NAME(LElement$GetMarried), PARAM(0))))), TEMP(t113)), CONST(1), L$$38, L$$39) */
int32_t t8 = 1;
int32_t t7 = LElement$GetMarried(p0);
t113 = (t8 - t7);
if (t113 == 1) goto L$$38; else goto L$$39;
/* LABEL(L$$39) */
L$$39: ;
/* MOVE(TEMP(t111), CONST(0)) */
t111 = 0;
/* JUMP(NAME(L$$40), L$$40) */
goto L$$40;
/* LABEL(L$$38) */
L$$38: ;
/* MOVE(TEMP(t106), CONST(0)) */
t106 = 0;
/* LABEL(L$$40) */
L$$40: ;
/* LABEL(L$$34) */
L$$34: ;
/* JUMP(NAME(L$$31), L$$31) */
goto L$$31;
/* LABEL(L$$29) */
L$$29: ;
/* MOVE(TEMP(t106), CONST(0)) */
t106 = 0;
/* LABEL(L$$31) */
L$$31: ;
/* JUMP(NAME(L$$28), L$$28) */
goto L$$28;
/* LABEL(L$$26) */
L$$26: ;
/* MOVE(TEMP(t106), CONST(0)) */
t106 = 0;
/* LABEL(L$$28) */
L$$28: ;
/* MOVE(TEMP(t118), TEMP(t106)) */
t118 = t106;
return t118;
}

int32_t LElement$Compare (int32_t p0, int32_t p1, int32_t p2) {
int32_t t119, t120, t121, t122, t123, t127;
/* MOVE(TEMP(t119), CONST(0)) */
t119 = 0;
/* MOVE(TEMP(t120), BINOP(PLUS, PARAM(2), CONST(1))) */
t120 = (p2 + 1);
/* CJUMP(EQ, ESEQ(SEQ(SEQ(MOVE(TEMP(t121), CONST(0)), CJUMP(LT, PARAM(1), PARAM(2), L$$44, L$$45), LABEL(L$$44), MOVE(TEMP(t121), CONST(1)), LABEL(L$$45))), TEMP(t121)), CONST(1), L$$41, L$$42) */
t121 = 0;
if (p1 < p2) goto L$$44; else goto L$$45;
L$$44: ;
t121 = 1;
L$$45: ;
if (t121 == 1) goto L$$41; else goto L$$42;
/* LABEL(L$$42) */
L$$42: ;
/* CJUMP(EQ, ESEQ(SEQ(MOVE(TEMP(t122), BINOP(MINUS, CONST(1), ESEQ(SEQ(SEQ(MOVE(TEMP(t123), CONST(0)), CJUMP(LT, PARAM(1), TEMP(t120), L$$49, L$$50), LABEL(L$$49), MOVE(TEMP(t123), CONST(1)), LABEL(L$$50))), TEMP(t123))))), TEMP(t122)), CONST(1), L$$46, L$$47) */
int32_t t0 = 1;
t123 = 0;
if (p1 < t120) goto L$$49; else goto L$$50;
L$$49: ;
t123 = 1;
L$$50: ;
t122 = (t0 - t123);
if (t122 == 1) goto L$$46; else goto L$$47;
/* LABEL(L$$47) */
L$$47: ;
/* MOVE(TEMP(t119), CONST(1)) */
t119 = 1;
/* JUMP(NAME(L$$48), L$$48) */
goto L$$48;
/* LABEL(L$$46) */
L$$46: ;
/* MOVE(TEMP(t119), CONST(0)) */
t119 = 0;
/* LABEL(L$$48) */
L$$48: ;
/* JUMP(NAME(L$$43), L$$43) */
goto L$$43;
/* LABEL(L$$41) */
L$$41: ;
/* MOVE(TEMP(t119), CONST(0)) */
t119 = 0;
/* LABEL(L$$43) */
L$$43: ;
/* MOVE(TEMP(t127), TEMP(t119)) */
t127 = t119;
return t127;
}

