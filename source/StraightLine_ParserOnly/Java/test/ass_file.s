
0: PUSH %ebp in: [%ebx, %esi, %edi] out: [%ebx, %esi, %edi]
1: MOV %ebp, %esp in: [%ebx, %esi, %edi] out: [%ebx, %esi, %edi]
2: SUB %esp, 0 in: [%ebx, %esi, %edi] out: [%ebx, %esi, %edi]
3: MOV t16, %ebx in: [%ebx, %esi, %edi] out: [t16, %esi, %edi]
4: MOV t17, %esi in: [t16, %esi, %edi] out: [t16, t17, %edi]
5: MOV t18, %edi in: [t16, t17, %edi] out: [t16, t17, t18]
6: L$$6: in: [t16, t17, t18] out: [t16, t17, t18]
7: MOV t19, 4 in: [t16, t17, t18] out: [t16, t17, t18, t19]
8: PUSH t19 in: [t16, t17, t18, t19] out: [t16, t17, t18]
9: CALL L_halloc in: [t16, t17, t18] out: [t16, t17, t18, %eax]
10: ADD %esp, 4 in: [t16, t17, t18, %eax] out: [t16, t17, t18, %eax]
11: MOV t6, %eax in: [t16, t17, t18, %eax] out: [t16, t17, t18, t6]
12: MOV t20, 55 in: [t16, t17, t18, t6] out: [t16, t17, t18, t20, t6]
13: PUSH t20 in: [t16, t17, t18, t20, t6] out: [t16, t17, t18, t6]
14: PUSH t6 in: [t16, t17, t18, t6] out: [t16, t17, t18]
15: CALL LStckClass$stckme in: [t16, t17, t18] out: [t16, t17, t18, %eax]
16: ADD %esp, 8 in: [t16, t17, t18, %eax] out: [t16, t17, t18, %eax]
17: MOV t7, %eax in: [t16, t17, t18, %eax] out: [t16, t17, t18, t7]
18: PUSH t7 in: [t16, t17, t18, t7] out: [t16, t17, t18]
19: CALL L_println_int in: [t16, t17, t18] out: [t16, t17, t18, %eax]
20: ADD %esp, 4 in: [t16, t17, t18, %eax] out: [t16, t17, t18, %eax]
21: MOV t0, %eax in: [t16, t17, t18, %eax] out: [t16, t17, t18]
22: MOV t1, 0 in: [t16, t17, t18] out: [t16, t17, t1, t18]
23: JMP L$$5 in: [t16, t17, t1, t18] out: [t16, t17, t1, t18]
24: L$$5: in: [t16, t17, t1, t18] out: [t16, t17, t1, t18]
25: MOV %eax, t1 in: [t16, t17, t1, t18] out: [t16, t17, t18, %eax]
26: MOV %ebx, t16 in: [t16, t17, t18, %eax] out: [t17, t18, %eax]
27: MOV %esi, t17 in: [t17, t18, %eax] out: [t18, %eax]
28: MOV %edi, t18 in: [t18, %eax] out: [%eax]
29: MOV %esp, %ebp in: [%eax] out: [%eax]
30: POP %ebp in: [%eax] out: [%eax]
31: RET in: [%eax] out: []

0: PUSH %ebp in: [%ebx, %esi, %edi] out: [%ebx, %esi, %edi]
1: MOV %ebp, %esp in: [%ebx, %esi, %edi] out: [%ebx, %esi, %edi]
2: SUB %esp, 8 in: [%ebx, %esi, %edi] out: [%ebx, %esi, %edi]
3: MOV t16, %ebx in: [%ebx, %esi, %edi] out: [t16, %esi, %edi]
4: MOV t17, %esi in: [t16, %esi, %edi] out: [t16, t17, %edi]
5: MOV t18, %edi in: [t16, t17, %edi] out: [t16, t17, t18]
6: L$$8: in: [t16, t17, t18] out: [t16, t17, t18]
7: MOV t2, DWORD PTR [%ebp+12] in: [t16, t17, t18] out: [t16, t17, t18, t2]
8: MOV t3, 0 in: [t16, t17, t18, t2] out: [t16, t17, t18, t2, t3]
9: MOV t21, DWORD PTR [%ebp+12] in: [t16, t17, t18, t2, t3] out: [t16, t17, t18, t2, t3, t21]
10: MOV t22, 1 in: [t16, t17, t18, t2, t3, t21] out: [t16, t17, t18, t2, t3, t21, t22]
11: CMP t21, t22 in: [t16, t17, t18, t2, t3, t21, t22] out: [t16, t17, t18, t2, t3]
12: JL L$$3 in: [t16, t17, t18, t2, t3] out: [t16, t17, t18, t2, t3]
13: L$$4: in: [t16, t17, t18, t2, t3] out: [t16, t17, t18, t2, t3]
14: MOV t23, 1 in: [t16, t17, t18, t2, t3] out: [t16, t17, t18, t2, t3, t23]
15: CMP t3, t23 in: [t16, t17, t18, t2, t3, t23] out: [t16, t17, t18, t2]
16: JE L$$0 in: [t16, t17, t18, t2] out: [t16, t17, t18, t2]
17: L$$1: in: [t16, t17, t18, t2] out: [t16, t17, t18, t2]
18: MOV t24, DWORD PTR [%ebp+12] in: [t16, t17, t18, t2] out: [t16, t17, t18, t2, t24]
19: SUB t24, 1 in: [t16, t17, t18, t2, t24] out: [t16, t17, t18, t2, t24]
20: PUSH t24 in: [t16, t17, t18, t2, t24] out: [t16, t17, t18, t2]
21: PUSH DWORD PTR [%ebp+8] in: [t16, t17, t18, t2] out: [t16, t17, t18, t2]
22: CALL LStckClass$stckme in: [t16, t17, t18, t2] out: [t16, t17, t18, t2, %eax]
23: ADD %esp, 8 in: [t16, t17, t18, t2, %eax] out: [t16, t17, t18, t2, %eax]
24: MOV t4, %eax in: [t16, t17, t18, t2, %eax] out: [t16, t17, t18, t2]
25: L$$2: in: [t16, t17, t18, t2] out: [t16, t17, t18, t2]
26: MOV t5, t2 in: [t16, t17, t18, t2] out: [t16, t17, t18, t5]
27: JMP L$$7 in: [t16, t17, t18, t5] out: [t16, t17, t18, t5]
28: L$$3: in: [t16, t17, t18, t2] out: [t16, t17, t18, t2]
29: MOV t3, 1 in: [t16, t17, t18, t2] out: [t16, t17, t18, t2, t3]
30: JMP L$$4 in: [t16, t17, t18, t2, t3] out: [t16, t17, t18, t2, t3]
31: L$$0: in: [t16, t17, t18, t2] out: [t16, t17, t18, t2]
32: JMP L$$2 in: [t16, t17, t18, t2] out: [t16, t17, t18, t2]
33: L$$7: in: [t16, t17, t18, t5] out: [t16, t17, t18, t5]
34: MOV %eax, t5 in: [t16, t17, t18, t5] out: [t16, t17, t18, %eax]
35: MOV %ebx, t16 in: [t16, t17, t18, %eax] out: [t17, t18, %eax]
36: MOV %esi, t17 in: [t17, t18, %eax] out: [t18, %eax]
37: MOV %edi, t18 in: [t18, %eax] out: [%eax]
38: MOV %esp, %ebp in: [%eax] out: [%eax]
39: POP %ebp in: [%eax] out: [%eax]
40: RET in: [%eax] out: []

0: PUSH %ebp in: [%ebx, %esi, %edi] out: [%ebx, %esi, %edi]
1: MOV %ebp, %esp in: [%ebx, %esi, %edi] out: [%ebx, %esi, %edi]
2: SUB %esp, 8 in: [%ebx, %esi, %edi] out: [%ebx, %esi, %edi]
3: MOV t25, %ebx in: [%ebx, %esi, %edi] out: [t25, %esi, %edi]
4: MOV DWORD PTR [%ebp-4], t25 in: [t25, %esi, %edi] out: [%esi, %edi]
5: MOV t17, %esi in: [%esi, %edi] out: [t17, %edi]
6: MOV t18, %edi in: [t17, %edi] out: [t17, t18]
7: L$$8: in: [t17, t18] out: [t17, t18]
8: MOV t2, DWORD PTR [%ebp+12] in: [t17, t18] out: [t17, t18, t2]
9: MOV t3, 0 in: [t17, t18, t2] out: [t17, t18, t2, t3]
10: MOV t21, DWORD PTR [%ebp+12] in: [t17, t18, t2, t3] out: [t17, t18, t2, t3, t21]
11: MOV t22, 1 in: [t17, t18, t2, t3, t21] out: [t17, t18, t2, t3, t21, t22]
12: CMP t21, t22 in: [t17, t18, t2, t3, t21, t22] out: [t17, t18, t2, t3]
13: JL L$$3 in: [t17, t18, t2, t3] out: [t17, t18, t2, t3]
14: L$$4: in: [t17, t18, t2, t3] out: [t17, t18, t2, t3]
15: MOV t23, 1 in: [t17, t18, t2, t3] out: [t17, t18, t2, t3, t23]
16: CMP t3, t23 in: [t17, t18, t2, t3, t23] out: [t17, t18, t2]
17: JE L$$0 in: [t17, t18, t2] out: [t17, t18, t2]
18: L$$1: in: [t17, t18, t2] out: [t17, t18, t2]
19: MOV t24, DWORD PTR [%ebp+12] in: [t17, t18, t2] out: [t17, t18, t2, t24]
20: SUB t24, 1 in: [t17, t18, t2, t24] out: [t17, t18, t2, t24]
21: PUSH t24 in: [t17, t18, t2, t24] out: [t17, t18, t2]
22: PUSH DWORD PTR [%ebp+8] in: [t17, t18, t2] out: [t17, t18, t2]
23: CALL LStckClass$stckme in: [t17, t18, t2] out: [t17, t18, t2, %eax]
24: ADD %esp, 8 in: [t17, t18, t2, %eax] out: [t17, t18, t2, %eax]
25: MOV t4, %eax in: [t17, t18, t2, %eax] out: [t17, t18, t2]
26: L$$2: in: [t17, t18, t2] out: [t17, t18, t2]
27: MOV t5, t2 in: [t17, t18, t2] out: [t17, t18, t5]
28: JMP L$$7 in: [t17, t18, t5] out: [t17, t18, t5]
29: L$$3: in: [t17, t18, t2] out: [t17, t18, t2]
30: MOV t3, 1 in: [t17, t18, t2] out: [t17, t18, t2, t3]
31: JMP L$$4 in: [t17, t18, t2, t3] out: [t17, t18, t2, t3]
32: L$$0: in: [t17, t18, t2] out: [t17, t18, t2]
33: JMP L$$2 in: [t17, t18, t2] out: [t17, t18, t2]
34: L$$7: in: [t17, t18, t5] out: [t17, t18, t5]
35: MOV %eax, t5 in: [t17, t18, t5] out: [t17, t18, %eax]
36: MOV t26, DWORD PTR [%ebp-4] in: [t17, t18, %eax] out: [t17, t18, %eax, t26]
37: MOV %ebx, t26 in: [t17, t18, %eax, t26] out: [t17, t18, %eax]
38: MOV %esi, t17 in: [t17, t18, %eax] out: [t18, %eax]
39: MOV %edi, t18 in: [t18, %eax] out: [%eax]
40: MOV %esp, %ebp in: [%eax] out: [%eax]
41: POP %ebp in: [%eax] out: [%eax]
42: RET in: [%eax] out: []

	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ebx, %ebx
	MOV %edx, %esi
	MOV %ecx, %edi
L$$6:
	MOV %eax, 4
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV %edi, %eax
	MOV %eax, 55
	PUSH %eax
	PUSH %edi
	CALL LStckClass$stckme
	ADD %esp, 8
	MOV %eax, %eax
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, %eax
	MOV %eax, 0
	JMP L$$5
L$$5:
	MOV %eax, %eax
	MOV %ebx, %ebx
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LStckClass$stckme:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-4], %eax
	MOV %edx, %esi
	MOV %ecx, %edi
L$$8:
	MOV %ebx, DWORD PTR [%ebp+12]
	MOV %esi, 0
	MOV %edi, DWORD PTR [%ebp+12]
	MOV %eax, 1
	CMP %edi, %eax
	JL L$$3
L$$4:
	MOV %eax, 1
	CMP %esi, %eax
	JE L$$0
L$$1:
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, 1
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LStckClass$stckme
	ADD %esp, 8
	MOV %eax, %eax
L$$2:
	MOV %eax, %ebx
	JMP L$$7
L$$3:
	MOV %esi, 1
	JMP L$$4
L$$0:
	JMP L$$2
L$$7:
	MOV %eax, %eax
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %ebx, %ebx
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET

