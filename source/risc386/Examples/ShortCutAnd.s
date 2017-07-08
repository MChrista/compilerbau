	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$13:
	PUSH 4
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 0
	PUSH %eax
	CALL LTestAnd$run
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$12:
	MOV %esp, %ebp
	POP %ebp
	RET
LTestAnd$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$15:
	XOR %eax, %eax
	CMP DWORD PTR [%ebp+12], 0
	JE L$$4
L$$5:
	PUSH DWORD PTR [%ebp+8]
	CALL LTestAnd$sideEffect
	ADD %esp, 4
L$$4:
	MOV DWORD PTR [%ebp+12], %eax
	CMP DWORD PTR [%ebp+12], 0
	JNE L$$9
L$$7:
	XOR %eax, %eax
L$$8:
L$$2:
	JMP L$$14
L$$9:
	PUSH DWORD PTR [%ebp+8]
	CALL LTestAnd$sideEffect
	ADD %esp, 4
	TEST %eax, %eax
	JE L$$7
L$$6:
	MOV %eax, 1
	JMP L$$8
L$$14:
	MOV %esp, %ebp
	POP %ebp
	RET
LTestAnd$sideEffect:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$17:
	PUSH -9999
	CALL L_println_int
	ADD %esp, 4
	PUSH -9999
	CALL L_println_int
	ADD %esp, 4
	PUSH -9999
	CALL L_println_int
	ADD %esp, 4
	PUSH -9999
	CALL L_println_int
	ADD %esp, 4
	PUSH -9999
	CALL L_println_int
	ADD %esp, 4
L$$10:
	MOV %eax, 1
L$$16:
	MOV %esp, %ebp
	POP %ebp
	RET
