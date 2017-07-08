	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$14:
	PUSH 4
	CALL L_halloc
	MOV %edx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edx], 0
	PUSH %edx
	CALL LTestEqMain$run
	MOV %edx, %eax
	ADD %esp, 4
	PUSH %edx
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
L$$0:
	XOR %edx, %edx
L$$13:
	MOV %eax, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LTestEqMain$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$16:
	XOR %eax, %eax
	XOR %edx, %edx
	MOV %ecx, 4
	CMP %ecx, 5
	JL L$$4
L$$5:
	TEST %edx, %edx
	JE L$$8
L$$9:
	XOR %edx, %edx
	MOV %eax, 4
	CMP %eax, 5
	JL L$$6
L$$7:
	MOV %eax, %edx
L$$8:
	MOV %edx, %eax
	CMP %edx, 0
	JNE L$$10
L$$11:
	PUSH 0
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
L$$12:
L$$2:
	XOR %edx, %edx
	JMP L$$15
L$$10:
	PUSH 1
	CALL L_println_int
	MOV %edx, %eax
	ADD %esp, 4
	JMP L$$12
L$$6:
	MOV %edx, 1
	JMP L$$7
L$$4:
	MOV %edx, 1
	JMP L$$5
L$$15:
	MOV %eax, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
