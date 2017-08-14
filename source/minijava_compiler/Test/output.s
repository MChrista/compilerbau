	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$34:
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
	JMP L$$35
L$$35:
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
L$$36:
	MOV %eax, 4
	ADD %eax, DWORD PTR [%ebp+8]
	MOV %ebx, %eax
	MOV %esi, 4
	MOV %eax, %esi
	INC %eax
	SHL %eax, 2
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], %esi
	ADD %eax, 4
	MOV DWORD PTR [%ebx], %eax
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
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 2
	SHL %ebx, 2
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 3
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
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 3
	SHL %ebx, 2
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 5
	MOV %eax, 7
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LPrimeNumbers$isprime
	ADD %esp, 8
	MOV %eax, 99
	JMP L$$37
L$$37:
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
L$$38:
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
	MOV %eax, 0
	MOV %edx, DWORD PTR [%ebp+16]
	MOV %ecx, 1
	CMP %edx, %ecx
	JL L$$16
L$$17:
	MOV %ecx, 1
	CMP %eax, %ecx
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
	JMP L$$39
L$$11:
	MOV %eax, 1
	JMP L$$12
L$$16:
	MOV %eax, 1
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
L$$39:
	MOV %esp, %ebp
	POP %ebp
	RET
LPrimeNumbers$isprime:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-16], %eax
	MOV %eax, %esi
	MOV DWORD PTR [%ebp-12], %eax
	MOV %eax, %edi
	MOV DWORD PTR [%ebp-8], %eax
L$$40:
	MOV %ebx, 1
	MOV %eax, 1
	MOV %ecx, 0
	MOV DWORD PTR [%ebp-4], %ecx
L$$18:
	MOV %ecx, 1
	CMP %ebx, %ecx
	JE L$$22
L$$20:
	MOV %eax, %ebx
	JMP L$$41
L$$22:
	MOV %edx, 0
	MOV %ecx, 4
	MOV %edi, DWORD PTR [%ebp-4]
	CMP %edi, %ecx
	JL L$$23
L$$24:
	MOV %ecx, 1
	CMP %edx, %ecx
	JNE L$$20
L$$21:
	MOV %ecx, 1
	CMP %eax, %ecx
	JNE L$$20
L$$19:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ecx, DWORD PTR [%eax+%ecx]
	MOV %eax, DWORD PTR [%ebp-4]
	CMP %eax, %ecx
	JL L$$25
L$$26:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$25:
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp-4]
	MOV %ecx, %eax
	SHL %ecx, 2
	MOV %eax, DWORD PTR [%edx+4]
	MOV %esi, DWORD PTR [%ecx+%eax]
	MOV %edi, 0
	MOV %eax, 1
	CMP %ebx, %eax
	JE L$$27
L$$29:
	MOV %ebx, %edi
	MOV %eax, DWORD PTR [%ebp-4]
	INC %eax
	MOV DWORD PTR [%ebp-4], %eax
	MOV %ecx, 0
	MOV %eax, %esi
	IMUL %esi
	MOV %edx, %eax
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %edx, %eax
	JL L$$32
L$$33:
	MOV %eax, %ecx
	JMP L$$18
L$$23:
	MOV %edx, 1
	JMP L$$24
L$$27:
	MOV %ebx, 0
	PUSH DWORD PTR [%ebp+12]
	PUSH %esi
	PUSH DWORD PTR [%ebp+8]
	CALL LPrimeNumbers$gcd
	ADD %esp, 12
	MOV %ecx, %eax
	MOV %eax, 2
	CMP %ecx, %eax
	JL L$$30
L$$31:
	MOV %eax, 1
	CMP %ebx, %eax
	JNE L$$29
L$$28:
	MOV %edi, 1
	JMP L$$29
L$$30:
	MOV %ebx, 1
	JMP L$$31
L$$32:
	MOV %ecx, 1
	JMP L$$33
L$$41:
	MOV %ebx, DWORD PTR [%ebp-16]
	MOV %ecx, DWORD PTR [%ebp-12]
	MOV %esi, %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET

