	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$44:
	PUSH 4
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 87
	PUSH 10
	PUSH 5
	PUSH 4
	PUSH 3
	PUSH 2
	PUSH 1
	PUSH %eax
	CALL LPrime$test_it
	ADD %esp, 32
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$43:
	MOV %esp, %ebp
	POP %ebp
	RET
LPrime$or:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$46:
L$$2:
	XOR %esi, %esi
	MOV %eax, DWORD PTR [%ebp+12]
	XOR %eax, 1
	TEST %eax, %eax
	JE L$$4
L$$5:
	MOV %eax, DWORD PTR [%ebp+16]
	XOR %eax, 1
	MOV %esi, %eax
L$$4:
	MOV %eax, %esi
	XOR %eax, 1
L$$45:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LPrime$divides:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
	MOV %edx, %esi
	MOV %ecx, %edi
L$$48:
	MOV %ebx, 1
	XOR %esi, %esi
L$$14:
	CMP %esi, 0
	JNE L$$16
L$$17:
	CMP %ebx, DWORD PTR [%ebp+16]
	JGE L$$16
L$$15:
	MOV %eax, %ebx
	IMUL %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$12
L$$11:
	LEA %eax, DWORD PTR [%ebx+1]
	MOV %ebx, %eax
L$$13:
	JMP L$$14
L$$12:
	MOV %eax, %ebx
	IMUL %eax, DWORD PTR [%ebp+12]
	CMP DWORD PTR [%ebp+16], %eax
	JGE L$$9
L$$8:
	MOV %ebx, DWORD PTR [%ebp+16]
L$$10:
	JMP L$$13
L$$9:
	MOV %esi, 1
	JMP L$$10
L$$16:
L$$6:
	MOV %eax, %esi
L$$47:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LPrime$isprime:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-8], %ebx
L$$50:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-12], %eax
	XOR %ebx, %ebx
	XOR %ecx, %ecx
	MOV %eax, 1
	CMP %eax, DWORD PTR [%ebp+12]
	JL L$$20
L$$21:
	TEST %ecx, %ecx
	JE L$$24
L$$25:
	XOR %eax, %eax
	CMP DWORD PTR [%ebp+12], 3
	JL L$$22
L$$23:
	MOV %ebx, %eax
L$$24:
	MOV DWORD PTR [%ebp-4], %ebx
	XOR %ebx, %ebx
	XOR %ecx, %ecx
	MOV %eax, 2
	CMP %eax, DWORD PTR [%ebp+12]
	JL L$$26
L$$27:
	TEST %ecx, %ecx
	JE L$$28
L$$29:
	PUSH DWORD PTR [%ebp+12]
	PUSH 2
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$divides
	ADD %esp, 12
	XOR %eax, 1
	MOV %ebx, %eax
L$$28:
	PUSH %ebx
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LPrime$or
	ADD %esp, 12
	MOV %ecx, %eax
	MOV %ebx, 3
L$$32:
	CMP %ecx, 0
	JNE L$$35
L$$34:
L$$18:
	MOV %eax, %ecx
	JMP L$$49
L$$35:
	CMP %ebx, DWORD PTR [%ebp+12]
	JGE L$$34
L$$33:
	XOR %eax, %eax
	TEST %ecx, %ecx
	JE L$$30
L$$31:
	PUSH DWORD PTR [%ebp+12]
	PUSH %ebx
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$divides
	ADD %esp, 12
	XOR %eax, 1
L$$30:
	MOV %ecx, %eax
	LEA %eax, DWORD PTR [%ebx+2]
	MOV %ebx, %eax
	JMP L$$32
L$$26:
	MOV %ecx, 1
	JMP L$$27
L$$22:
	MOV %eax, 1
	JMP L$$23
L$$20:
	MOV %ecx, 1
	JMP L$$21
L$$49:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LPrime$b2i:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$52:
	CMP DWORD PTR [%ebp+12], 0
	JNE L$$38
L$$39:
	XOR %eax, %eax
L$$40:
L$$36:
	JMP L$$51
L$$38:
	MOV %eax, 1
	JMP L$$40
L$$51:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LPrime$test_it:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$54:
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$isprime
	ADD %esp, 8
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$b2i
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$isprime
	ADD %esp, 8
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$b2i
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+20]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$isprime
	ADD %esp, 8
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$b2i
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+24]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$isprime
	ADD %esp, 8
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$b2i
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+28]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$isprime
	ADD %esp, 8
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$b2i
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+32]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$isprime
	ADD %esp, 8
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$b2i
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+36]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$isprime
	ADD %esp, 8
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrime$b2i
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$41:
	MOV %eax, 999
L$$53:
	MOV %esp, %ebp
	POP %ebp
	RET
