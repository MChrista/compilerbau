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
	MOV %eax, 2
	PUSH %eax
	PUSH %edi
	CALL LFac$ComputeFac
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
LFac$ComputeFac:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV %ebx, %ebx
	MOV %edx, %esi
	MOV %ecx, %edi
L$$8:
	MOV %eax, 0
	MOV %esi, DWORD PTR [%ebp+12]
	MOV %edi, 1
	CMP %esi, %edi
	JL L$$3
L$$4:
	MOV %edi, 1
	CMP %eax, %edi
	JE L$$0
L$$1:
	MOV %edi, DWORD PTR [%ebp+12]
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, 1
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LFac$ComputeFac
	ADD %esp, 8
	MOV %esi, %eax
	MOV %eax, %edi
	IMUL %eax, %esi
	MOV %eax, %eax
L$$2:
	MOV %eax, %eax
	JMP L$$7
L$$3:
	MOV %eax, 1
	JMP L$$4
L$$0:
	MOV %eax, 1
	JMP L$$2
L$$7:
	MOV %eax, %eax
	MOV %ebx, %ebx
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
