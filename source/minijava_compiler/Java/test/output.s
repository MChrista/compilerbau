	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$31:
	MOV %eax, 28
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	PUSH %eax
	CALL LMandel$m
	ADD %esp, 4
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 0
	JMP L$$30
L$$30:
	MOV %esp, %ebp
	POP %ebp
	RET
LMandel$init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$33:
	MOV %ecx, 0
	SUB %ecx, 600
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+8], %ecx
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+12], 0
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+16], 50
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+20], 255
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+24], 2
	MOV %eax, 27
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 91
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 63
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 55
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 108
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 0
	JMP L$$32
L$$32:
	MOV %esp, %ebp
	POP %ebp
	RET
LMandel$m:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$35:
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$init
	ADD %esp, 4
L$$0:
	MOV %eax, 0
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %edx, DWORD PTR [%ecx+24]
	MOV %ecx, 100
	CMP %edx, %ecx
	JL L$$3
L$$4:
	MOV %ecx, 1
	CMP %eax, %ecx
	JE L$$1
L$$2:
	MOV %eax, 0
	JMP L$$34
L$$3:
	MOV %eax, 1
	JMP L$$4
L$$1:
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$cursorToOrigin
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$n
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+24]
	ADD %ecx, 1
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+24], %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$delay
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$delay
	ADD %esp, 4
	JMP L$$0
L$$34:
	MOV %esp, %ebp
	POP %ebp
	RET
LMandel$n:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 32
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-32], %eax
	MOV %eax, %esi
	MOV DWORD PTR [%ebp-28], %eax
	MOV %eax, %edi
	MOV DWORD PTR [%ebp-24], %eax
L$$37:
	MOV %eax, 0
	MOV DWORD PTR [%ebp-20], %eax
L$$5:
	MOV %ebx, 0
	MOV %ecx, 20
	MOV %eax, DWORD PTR [%ebp-20]
	CMP %eax, %ecx
	JL L$$8
L$$9:
	MOV %eax, 1
	CMP %ebx, %eax
	JE L$$6
L$$7:
	MOV %eax, 10
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 0
	JMP L$$36
L$$8:
	MOV %ebx, 1
	JMP L$$9
L$$6:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp-20]
	MOV %ebx, %eax
	SUB %ebx, 10
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %eax, 2
	IMUL DWORD PTR [%edx+16]
	MOV %edx, %eax
	MOV %eax, %ebx
	IMUL %edx
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ecx+12]
	ADD %eax, %ebx
	MOV DWORD PTR [%ebp-16], %eax
	MOV %eax, 0
	MOV DWORD PTR [%ebp-12], %eax
L$$10:
	MOV %ebx, 0
	MOV %ecx, 80
	MOV %eax, DWORD PTR [%ebp-12]
	CMP %eax, %ecx
	JL L$$13
L$$14:
	MOV %eax, 1
	CMP %ebx, %eax
	JE L$$11
L$$12:
	MOV %eax, 10
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-20]
	ADD %eax, 1
	MOV DWORD PTR [%ebp-20], %eax
	JMP L$$5
L$$13:
	MOV %ebx, 1
	JMP L$$14
L$$11:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp-12]
	SUB %eax, 40
	MOV %ecx, DWORD PTR [%ebp+8]
	IMUL DWORD PTR [%ecx+16]
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebx+8]
	ADD %eax, %ecx
	MOV DWORD PTR [%ebp-8], %eax
	MOV %edi, 0
	MOV %eax, 0
	MOV DWORD PTR [%ebp-4], %eax
	MOV %edx, 0
	MOV %ebx, 0
L$$15:
	MOV %ecx, 0
	MOV %eax, 0
	MOV %esi, 4194304
	CMP %edx, %esi
	JL L$$21
L$$22:
	MOV %edx, 1
	CMP %eax, %edx
	JE L$$18
L$$20:
	MOV %eax, 1
	CMP %ecx, %eax
	JE L$$16
L$$17:
	PUSH %ebx
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$printdot
	ADD %esp, 8
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp-12]
	ADD %eax, 1
	MOV DWORD PTR [%ebp-12], %eax
	JMP L$$10
L$$21:
	MOV %eax, 1
	JMP L$$22
L$$18:
	MOV %eax, 0
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %edx, DWORD PTR [%edx+24]
	CMP %ebx, %edx
	JL L$$23
L$$24:
	MOV %edx, 1
	CMP %eax, %edx
	JNE L$$20
L$$19:
	MOV %ecx, 1
	JMP L$$20
L$$23:
	MOV %eax, 1
	JMP L$$24
L$$16:
	MOV %esi, %edi
	MOV %eax, %edi
	IMUL %edi
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$shr10
	ADD %esp, 8
	MOV %edi, %eax
	MOV %eax, DWORD PTR [%ebp-4]
	MOV %ecx, DWORD PTR [%ebp-4]
	IMUL %ecx
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$shr10
	ADD %esp, 8
	MOV %ecx, %edi
	SUB %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	ADD %ecx, %eax
	MOV %edi, %ecx
	MOV %eax, %esi
	MOV %ecx, DWORD PTR [%ebp-4]
	IMUL %ecx
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$shr10
	ADD %esp, 8
	MOV %ecx, %eax
	MOV %eax, 2
	IMUL %ecx
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-16]
	ADD %ecx, %eax
	MOV %eax, %ecx
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, %edi
	IMUL %edi
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-4]
	MOV %edx, DWORD PTR [%ebp-4]
	IMUL %edx
	MOV %edx, %eax
	MOV %eax, %ecx
	ADD %eax, %edx
	MOV %edx, %eax
	MOV %eax, %ebx
	ADD %eax, 1
	MOV %ebx, %eax
	JMP L$$15
L$$36:
	MOV %ebx, DWORD PTR [%ebp-32]
	MOV %ecx, DWORD PTR [%ebp-28]
	MOV %esi, %ecx
	MOV %ecx, DWORD PTR [%ebp-24]
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LMandel$shr10:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %edi
L$$39:
	MOV %eax, DWORD PTR [%ebp+12]
	MOV %edi, 1024
	MOV %edx, %eax
	SAR %edx, 31
	IDIV %edi
	JMP L$$38
L$$38:
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LMandel$cursorToOrigin:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$41:
	MOV %eax, 27
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 91
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 72
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 0
	JMP L$$40
L$$40:
	MOV %esp, %ebp
	POP %ebp
	RET
LMandel$printcol:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$43:
	MOV %eax, 27
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 91
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 52
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+12]
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 109
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 32
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 27
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 91
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 48
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 109
	PUSH %eax
	CALL L_print_char
	ADD %esp, 4
	MOV %eax, 0
	JMP L$$42
L$$42:
	MOV %esp, %ebp
	POP %ebp
	RET
LMandel$printdot:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-4], %eax
L$$45:
	MOV %eax, 6
	IMUL DWORD PTR [%ebp+12]
	MOV %ebx, 1024
	IMUL %ebx
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %edx, %eax
	SAR %edx, 31
	IDIV DWORD PTR [%ebx+24]
	MOV %ecx, %eax
	MOV %eax, 6
	IMUL DWORD PTR [%ebp+12]
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %edx, %eax
	SAR %edx, 31
	IDIV DWORD PTR [%ebx+24]
	MOV %ebx, %eax
	MOV %eax, %ebx
	MOV %edx, 1024
	IMUL %edx
	MOV %edx, %eax
	MOV %eax, %ecx
	SUB %eax, %edx
	MOV %ecx, 1024
	SUB %ecx, %eax
	MOV %eax, %ecx
	MOV %eax, 48
	ADD %eax, %ebx
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LMandel$printcol
	ADD %esp, 8
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp+12]
	JMP L$$44
L$$44:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LMandel$delay:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$47:
	MOV %edi, 0
L$$25:
	MOV %eax, 0
	MOV %esi, 100000000
	CMP %edi, %esi
	JL L$$28
L$$29:
	MOV %esi, 1
	CMP %eax, %esi
	JE L$$26
L$$27:
	MOV %eax, %edi
	JMP L$$46
L$$28:
	MOV %eax, 1
	JMP L$$29
L$$26:
	MOV %eax, %edi
	ADD %eax, 1
	MOV %edi, %eax
	JMP L$$25
L$$46:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET

