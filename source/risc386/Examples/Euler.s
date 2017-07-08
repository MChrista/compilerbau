	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$54:
	PUSH 4
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH %eax
	CALL LEulerClass$test_it
	ADD %esp, 4
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$53:
	MOV %esp, %ebp
	POP %ebp
	RET
LEulerClass$eq:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %ebx
	MOV %ecx, %esi
L$$56:
L$$2:
	XOR %esi, %esi
	XOR %eax, %eax
	MOV %ebx, DWORD PTR [%ebp+12]
	CMP %ebx, DWORD PTR [%ebp+16]
	JL L$$4
L$$5:
	XOR %eax, 1
	TEST %eax, %eax
	JE L$$8
L$$9:
	XOR %ebx, %ebx
	MOV %eax, DWORD PTR [%ebp+16]
	CMP %eax, DWORD PTR [%ebp+12]
	JL L$$6
L$$7:
	MOV %eax, %ebx
	XOR %eax, 1
	MOV %esi, %eax
L$$8:
	MOV %eax, %esi
	JMP L$$55
L$$6:
	MOV %ebx, 1
	JMP L$$7
L$$4:
	MOV %eax, 1
	JMP L$$5
L$$55:
	MOV %ebx, %edx
	MOV %esi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LEulerClass$div:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$58:
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$16
L$$15:
	XOR %eax, %eax
L$$17:
L$$10:
	JMP L$$57
L$$16:
	PUSH 1
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$eq
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$12
L$$13:
	PUSH DWORD PTR [%ebp+16]
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, DWORD PTR [%ebp+16]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$div
	ADD %esp, 12
	LEA %eax, DWORD PTR [%eax+1]
L$$14:
	JMP L$$17
L$$12:
	MOV %eax, DWORD PTR [%ebp+12]
	JMP L$$14
L$$57:
	MOV %esp, %ebp
	POP %ebp
	RET
LEulerClass$rem:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-4], %ebx
L$$60:
L$$18:
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-12], %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$div
	ADD %esp, 12
	MOV %ebx, DWORD PTR [%ebp-12]
	IMUL %ebx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	SUB %eax, %ebx
L$$59:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LEulerClass$divides:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
	MOV DWORD PTR [%ebp-16], %ebx
	MOV DWORD PTR [%ebp-4], %esi
	MOV DWORD PTR [%ebp-12], %edi
L$$62:
L$$20:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ebp+16]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$div
	ADD %esp, 12
	MOV %ecx, DWORD PTR [%ebp-8]
	IMUL %ecx, %eax
	PUSH %ecx
	PUSH %esi
	PUSH %ebx
	CALL LEulerClass$eq
	ADD %esp, 12
L$$61:
	MOV %ebx, DWORD PTR [%ebp-16]
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %edi, DWORD PTR [%ebp-12]
	MOV %esp, %ebp
	POP %ebp
	RET
LEulerClass$hcf:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$64:
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$28
L$$27:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$hcf
	ADD %esp, 12
L$$29:
L$$22:
	JMP L$$63
L$$28:
	CMP DWORD PTR [%ebp+16], 1
	JGE L$$25
L$$24:
	MOV %eax, DWORD PTR [%ebp+12]
L$$26:
	JMP L$$29
L$$25:
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, DWORD PTR [%ebp+16]
	PUSH %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$hcf
	ADD %esp, 12
	JMP L$$26
L$$63:
	MOV %esp, %ebp
	POP %ebp
	RET
LEulerClass$relprime:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
L$$66:
L$$30:
	XOR %ebx, %ebx
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$hcf
	ADD %esp, 12
	CMP %eax, 2
	JL L$$32
L$$33:
	MOV %eax, %ebx
	JMP L$$65
L$$32:
	MOV %ebx, 1
	JMP L$$33
L$$65:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LEulerClass$euler:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %ebx
L$$68:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-8], %eax
	MOV %ebx, 1
L$$39:
	CMP %ebx, DWORD PTR [%ebp+12]
	JGE L$$41
L$$40:
	PUSH %ebx
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$relprime
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$36
L$$37:
L$$38:
	LEA %eax, DWORD PTR [%ebx+1]
	MOV %ebx, %eax
	JMP L$$39
L$$36:
	MOV %eax, DWORD PTR [%ebp-8]
	LEA %eax, DWORD PTR [%eax+1]
	MOV DWORD PTR [%ebp-8], %eax
	JMP L$$38
L$$41:
L$$34:
	MOV %eax, DWORD PTR [%ebp-8]
L$$67:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LEulerClass$test_it:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %esi
L$$70:
	MOV %esi, 1
	PUSH 5
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$euler
	ADD %esp, 8
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	XOR %eax, %eax
	TEST %esi, %esi
	JE L$$44
L$$45:
	PUSH 4
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$eq
	ADD %esp, 12
L$$44:
	MOV %esi, %eax
	PUSH 21
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$euler
	ADD %esp, 8
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	XOR %eax, %eax
	TEST %esi, %esi
	JE L$$46
L$$47:
	PUSH 12
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$eq
	ADD %esp, 12
L$$46:
	MOV %esi, %eax
	PUSH 188
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$euler
	ADD %esp, 8
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	XOR %eax, %eax
	TEST %esi, %esi
	JE L$$48
L$$49:
	PUSH 92
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LEulerClass$eq
	ADD %esp, 12
L$$48:
	MOV %esi, %eax
	CMP %esi, 0
	JNE L$$50
L$$51:
	MOV %eax, 1
L$$52:
L$$42:
	JMP L$$69
L$$50:
	XOR %eax, %eax
	JMP L$$52
L$$69:
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
