	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$39:
	MOV %eax, 12
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	PUSH %eax
	CALL LPrimeNumbers$start
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, 0
	JMP L$$38
L$$38:
	MOV %esp, %ebp
	POP %ebp
	RET
LPrimeNumbers$start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, %esi
	MOV DWORD PTR [%ebp-4], %eax
L$$41:
	MOV %eax, 4
	ADD %eax, DWORD PTR [%ebp+8]
	MOV %esi, %eax
	MOV %ebx, 4
	MOV %eax, %ebx
	ADD %eax, 1
	MOV %ecx, 4
	IMUL %ecx
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], %ebx
	ADD %eax, 4
	MOV DWORD PTR [%esi], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 0
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$0
L$$1:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$0:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%eax], 1
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 1
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$2
L$$3:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$2:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%eax+4], 2
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 2
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$4
L$$5:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$4:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, 2
	MOV %ecx, 4
	IMUL %ecx
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebx+4]
	MOV DWORD PTR [%ecx+%eax], 3
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 3
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$6
L$$7:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$6:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, 3
	MOV %ecx, 4
	IMUL %ecx
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebx+4]
	MOV DWORD PTR [%ecx+%eax], 5
	MOV %eax, 7
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrimeNumbers$isprime
	ADD %esp, 8
	MOV %eax, 99
	JMP L$$40
L$$40:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %ecx, DWORD PTR [%ebp-4]
	MOV %esi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LPrimeNumbers$gcd:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$43:
	MOV %eax, 0
	MOV %edx, DWORD PTR [%ebp+12]
	MOV %ecx, DWORD PTR [%ebp+16]
	CMP %edx, %ecx
	JL L$$11
L$$12:
	MOV %ecx, 1
	CMP %eax, %ecx
	JE L$$8
L$$9:
	MOV %ecx, 0
	MOV %eax, DWORD PTR [%ebp+16]
	MOV %edx, 1
	CMP %eax, %edx
	JL L$$16
L$$17:
	MOV %eax, 1
	CMP %ecx, %eax
	JE L$$13
L$$14:
	MOV %ecx, DWORD PTR [%ebp+16]
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, %ecx
	PUSH %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LPrimeNumbers$gcd
	ADD %esp, 12
L$$15:
L$$10:
	JMP L$$42
L$$11:
	MOV %eax, 1
	JMP L$$12
L$$16:
	MOV %ecx, 1
	JMP L$$17
L$$13:
	MOV %eax, DWORD PTR [%ebp+12]
	JMP L$$15
L$$8:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LPrimeNumbers$gcd
	ADD %esp, 12
	JMP L$$10
L$$42:
	MOV %esp, %ebp
	POP %ebp
	RET
LPrimeNumbers$isprime:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 20
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-16], %eax
	MOV %eax, %esi
	MOV DWORD PTR [%ebp-12], %eax
	MOV %eax, %edi
	MOV DWORD PTR [%ebp-8], %eax
L$$45:
	MOV %eax, 1
	MOV DWORD PTR [%ebp-20], %eax
	MOV %edx, 1
	MOV %eax, 0
	MOV DWORD PTR [%ebp-4], %eax
L$$18:
	MOV %ecx, 0
	MOV %ebx, 0
	MOV %edi, 1
	MOV %eax, DWORD PTR [%ebp-20]
	CMP %eax, %edi
	JE L$$24
L$$26:
	MOV %eax, 1
	CMP %ebx, %eax
	JE L$$21
L$$23:
	MOV %eax, 1
	CMP %ecx, %eax
	JE L$$19
L$$20:
	MOV %eax, DWORD PTR [%ebp-20]
	JMP L$$44
L$$24:
	MOV %eax, 0
	MOV %esi, 4
	MOV %edi, DWORD PTR [%ebp-4]
	CMP %edi, %esi
	JL L$$27
L$$28:
	MOV %edi, 1
	CMP %eax, %edi
	JNE L$$26
L$$25:
	MOV %ebx, 1
	JMP L$$26
L$$27:
	MOV %eax, 1
	JMP L$$28
L$$21:
	MOV %eax, 1
	CMP %edx, %eax
	JNE L$$23
L$$22:
	MOV %ecx, 1
	JMP L$$23
L$$19:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, DWORD PTR [%eax+%ebx]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, %ebx
	JL L$$29
L$$30:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$29:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp-4]
	MOV %ecx, 4
	IMUL %ecx
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebx+4]
	MOV %esi, DWORD PTR [%ecx+%eax]
	MOV %edi, 0
	MOV %ebx, 1
	MOV %eax, DWORD PTR [%ebp-20]
	CMP %eax, %ebx
	JE L$$31
L$$33:
	MOV %eax, %edi
	MOV DWORD PTR [%ebp-20], %eax
	MOV %eax, DWORD PTR [%ebp-4]
	ADD %eax, 1
	MOV DWORD PTR [%ebp-4], %eax
	MOV %ebx, 0
	MOV %eax, %esi
	IMUL %esi
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %ecx, %eax
	JL L$$36
L$$37:
	MOV %edx, %ebx
	JMP L$$18
L$$31:
	MOV %ebx, 0
	PUSH DWORD PTR [%ebp+12]
	PUSH %esi
	PUSH DWORD PTR [%ebp+8]
	CALL LPrimeNumbers$gcd
	ADD %esp, 12
	MOV %ecx, 2
	CMP %eax, %ecx
	JL L$$34
L$$35:
	MOV %eax, 1
	CMP %ebx, %eax
	JNE L$$33
L$$32:
	MOV %edi, 1
	JMP L$$33
L$$34:
	MOV %ebx, 1
	JMP L$$35
L$$36:
	MOV %ebx, 1
	JMP L$$37
L$$44:
	MOV %ebx, DWORD PTR [%ebp-16]
	MOV %ecx, DWORD PTR [%ebp-12]
	MOV %esi, %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET

