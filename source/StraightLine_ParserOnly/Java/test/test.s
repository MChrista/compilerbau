	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ebx, %ebx
	MOV %edx, %esi
	MOV %ecx, %edi
Lstart2:
	MOV %eax, 4
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV %eax, %eax
	PUSH %eax
	CALL LWhileClass$run
	ADD %esp, 4
	MOV %eax, %eax
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, %eax
	MOV %eax, 0
	JMP Lend2
Lend2:
	MOV %eax, %eax
	MOV %ebx, %ebx
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LWhileClass$run:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-4], %eax
	MOV %esi, %esi
	MOV %edi, %edi
Lstart1:
	MOV %ecx, 0
	MOV %ebx, 1
L$$0:
	MOV %eax, 0
	MOV %edx, 11
	CMP %ebx, %edx
	JL L$$3
L$$4:
	MOV %edx, 1
	CMP %eax, %edx
	JE L$$1
L$$2:
	MOV %eax, 0
	JMP Lend1
L$$3:
	MOV %eax, 1
	JMP L$$4
L$$1:
	MOV %eax, %ecx
	ADD %eax, %ebx
	MOV %ecx, %eax
	PUSH %ecx
	CALL L_println_int
	POP %ecx
	MOV %eax, %eax
	MOV %eax, %ebx
	ADD %eax, 1
	MOV %ebx, %eax
	JMP L$$0
Lend1:
	MOV %eax, %eax
	MOV %eax, DWORD PTR [%ebp-4]
	MOV %ebx, %eax
	MOV %esi, %esi
	MOV %edi, %edi
	MOV %esp, %ebp
	POP %ebp
	RET
