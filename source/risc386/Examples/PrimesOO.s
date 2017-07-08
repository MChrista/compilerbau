	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$66:
	PUSH 12
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 22
	PUSH %eax
	CALL LPrimes$test_it
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$65:
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$eq:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$68:
L$$2:
	XOR %esi, %esi
	XOR %edi, %edi
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JL L$$4
L$$5:
	MOV %eax, %edi
	XOR %eax, 1
	TEST %eax, %eax
	JE L$$8
L$$9:
	XOR %eax, %eax
	MOV %esi, DWORD PTR [%ebp+16]
	CMP %esi, DWORD PTR [%ebp+12]
	JL L$$6
L$$7:
	XOR %eax, 1
	MOV %esi, %eax
L$$8:
	MOV %eax, %esi
	JMP L$$67
L$$6:
	MOV %eax, 1
	JMP L$$7
L$$4:
	MOV %edi, 1
	JMP L$$5
L$$67:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$div:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$70:
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$16
L$$15:
	XOR %eax, %eax
L$$17:
L$$10:
	JMP L$$69
L$$16:
	PUSH 1
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$eq
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$12
L$$13:
	PUSH DWORD PTR [%ebp+16]
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, DWORD PTR [%ebp+16]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$div
	ADD %esp, 12
	LEA %eax, DWORD PTR [%eax+1]
L$$14:
	JMP L$$17
L$$12:
	MOV %eax, DWORD PTR [%ebp+12]
	JMP L$$14
L$$69:
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$rem:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-12], %ebx
	MOV DWORD PTR [%ebp-4], %esi
L$$72:
L$$18:
	MOV %ebx, DWORD PTR [%ebp+16]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	IMUL %eax, %ecx
	SUB %ebx, %eax
	MOV %eax, %ebx
L$$71:
	MOV %ebx, DWORD PTR [%ebp-12]
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$dividess:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-4], %ebx
	MOV DWORD PTR [%ebp-12], %edi
L$$74:
L$$20:
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebp+16]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	IMUL %eax, %ecx
	PUSH %eax
	PUSH %ebx
	PUSH %edi
	CALL LIntegral$eq
	ADD %esp, 12
L$$73:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %edi, DWORD PTR [%ebp-12]
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$divides:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
	MOV %ecx, %esi
	MOV %edx, %edi
L$$76:
	MOV %esi, 1
	XOR %ebx, %ebx
L$$30:
	CMP %ebx, 0
	JNE L$$32
L$$33:
	CMP %esi, DWORD PTR [%ebp+16]
	JGE L$$32
L$$31:
	MOV %eax, %esi
	IMUL %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$28
L$$27:
	LEA %eax, DWORD PTR [%esi+1]
	MOV %esi, %eax
L$$29:
	JMP L$$30
L$$28:
	MOV %eax, %esi
	IMUL %eax, DWORD PTR [%ebp+12]
	CMP DWORD PTR [%ebp+16], %eax
	JGE L$$25
L$$24:
	MOV %esi, DWORD PTR [%ebp+16]
L$$26:
	JMP L$$29
L$$25:
	MOV %ebx, 1
	JMP L$$26
L$$32:
L$$22:
	MOV %eax, %ebx
L$$75:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$hcf:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$78:
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$40
L$$39:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$hcf
	ADD %esp, 12
L$$41:
L$$34:
	JMP L$$77
L$$40:
	CMP DWORD PTR [%ebp+16], 1
	JGE L$$37
L$$36:
	MOV %eax, DWORD PTR [%ebp+12]
L$$38:
	JMP L$$41
L$$37:
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, DWORD PTR [%ebp+16]
	PUSH %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$hcf
	ADD %esp, 12
	JMP L$$38
L$$77:
	MOV %esp, %ebp
	POP %ebp
	RET
LPrimes$isprime:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %ebx
	MOV DWORD PTR [%ebp-8], %esi
L$$80:
	MOV %ecx, 1
	XOR %ebx, %ebx
L$$48:
	CMP %ecx, 0
	JNE L$$52
L$$50:
L$$42:
	MOV %eax, %ecx
	JMP L$$79
L$$52:
	MOV %eax, DWORD PTR [%ebp+8]
	CMP %ebx, DWORD PTR [%eax+8]
	JGE L$$50
L$$51:
	CMP %ebx, DWORD PTR [%ebp+12]
	JGE L$$50
L$$49:
	XOR %eax, %eax
	TEST %ecx, %ecx
	JE L$$46
L$$47:
	MOV %edx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+4]
	MOV %eax, %ebx
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$43
L$$44:
	CMP %eax, 0
	JL L$$43
L$$45:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ecx+%eax*4+4]
	PUSH %edx
	CALL LIntegral$divides
	ADD %esp, 12
	XOR %eax, 1
L$$46:
	MOV %ecx, %eax
	LEA %eax, DWORD PTR [%ebx+1]
	MOV %ebx, %eax
	JMP L$$48
L$$43:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$43
L$$79:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esi, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LPrimes$primes:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-4], %esi
L$$82:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-12], %eax
	MOV %ebx, 2
L$$60:
	CMP %ebx, DWORD PTR [%ebp+12]
	JGE L$$62
L$$61:
	PUSH %ebx
	PUSH DWORD PTR [%ebp+8]
	CALL LPrimes$isprime
	ADD %esp, 8
	CMP %eax, 0
	JNE L$$57
L$$58:
	LEA %eax, DWORD PTR [%ebx+1]
	MOV %ebx, %eax
L$$59:
	JMP L$$60
L$$57:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
	CMP %eax, DWORD PTR [%ecx]
	JGE L$$54
L$$55:
	CMP %eax, 0
	JL L$$54
L$$56:
	MOV DWORD PTR [%ecx+%eax*4+4], %ebx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	MOV %eax, DWORD PTR [%eax]
	ADD %eax, 1
	MOV DWORD PTR [%ecx+8], %eax
	PUSH %ebx
	CALL L_println_int
	ADD %esp, 4
	LEA %eax, DWORD PTR [%ebx+1]
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp-12]
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-12], %eax
	JMP L$$59
L$$54:
	PUSH -17
	CALL L_raise
	ADD %esp, 4
	JMP L$$54
L$$62:
L$$53:
	MOV %eax, DWORD PTR [%ebp-12]
L$$81:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LPrimes$test_it:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %ebx
L$$84:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%eax*4+4]
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%ecx], %eax
	MOV DWORD PTR [%ebx], %ecx
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%eax+8], 0
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LPrimes$primes
	ADD %esp, 8
	MOV %ebx, %eax
	PUSH 999
	CALL L_println_int
	ADD %esp, 4
L$$63:
	MOV %eax, %ebx
L$$83:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
