
	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$55:
	MOV %eax, 12
	PUSH %eax
	CALL L_halloc
	ADD %esp, 4
	MOV %ecx, 10
	PUSH %ecx
	PUSH %eax
	CALL LBBS$Start
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, 0
	JMP L$$54
L$$54:
	MOV %esp, %ebp
	POP %ebp
	RET
LBBS$Start:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$57:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LBBS$Init
	ADD %esp, 8
	PUSH DWORD PTR [%ebp+8]
	CALL LBBS$Print
	ADD %esp, 4
	MOV %eax, 99999
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+8]
	CALL LBBS$Sort
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+8]
	CALL LBBS$Print
	ADD %esp, 4
	MOV %eax, 0
	JMP L$$56
L$$56:
	MOV %esp, %ebp
	POP %ebp
	RET
LBBS$Sort:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 20
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-20], %eax
	MOV %eax, %esi
	MOV DWORD PTR [%ebp-16], %eax
	MOV %eax, %edi
	MOV DWORD PTR [%ebp-12], %eax
L$$59:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
	SUB %eax, 1
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, 0
	SUB %eax, 1
	MOV DWORD PTR [%ebp-4], %eax
L$$0:
	MOV %ebx, 0
	MOV %ecx, DWORD PTR [%ebp-4]
	MOV %eax, DWORD PTR [%ebp-8]
	CMP %ecx, %eax
	MOV DWORD PTR [%ebp-4], %ecx
	JL L$$3
L$$4:
	MOV %eax, 1
	CMP %ebx, %eax
	JE L$$1
L$$2:
	MOV %eax, 0
	JMP L$$58
L$$3:
	MOV %ebx, 1
	JMP L$$4
L$$1:
	MOV %ebx, 1
L$$5:
	MOV %eax, 0
	MOV %ecx, DWORD PTR [%ebp-8]
	ADD %ecx, 1
	CMP %ebx, %ecx
	JL L$$8
L$$9:
	MOV %ecx, 1
	CMP %eax, %ecx
	JE L$$6
L$$7:
	MOV %eax, DWORD PTR [%ebp-8]
	SUB %eax, 1
	MOV DWORD PTR [%ebp-8], %eax
	JMP L$$0
L$$8:
	MOV %eax, 1
	JMP L$$9
L$$6:
	MOV %eax, %ebx
	SUB %eax, 1
	MOV %edi, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %edi, %eax
	JL L$$10
L$$11:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$10:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, %edi
	IMUL %ecx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %edi, DWORD PTR [%ecx+%eax]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$12
L$$13:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$12:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, %ebx
	IMUL %ecx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ecx, DWORD PTR [%ecx+%eax]
	MOV %eax, 0
	CMP %ecx, %edi
	JL L$$17
L$$18:
	MOV %ecx, 1
	CMP %eax, %ecx
	JE L$$14
L$$15:
	MOV %eax, 0
L$$16:
	MOV %eax, %ebx
	ADD %eax, 1
	MOV %ebx, %eax
	JMP L$$5
L$$17:
	MOV %eax, 1
	JMP L$$18
L$$14:
	MOV %eax, %ebx
	SUB %eax, 1
	MOV %esi, %eax
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %eax, -4
	MOV %ecx, DWORD PTR [%ecx+4]
	MOV %eax, DWORD PTR [%ecx+%eax]
	CMP %esi, %eax
	JL L$$19
L$$20:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$19:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, %esi
	IMUL %ecx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %edi, DWORD PTR [%ecx+%eax]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %esi, %eax
	JL L$$21
L$$22:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$21:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, %esi
	IMUL %ecx, 4
	MOV %eax, DWORD PTR [%eax+4]
	ADD %eax, %ecx
	MOV %esi, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$23
L$$24:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$23:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, %ebx
	IMUL %ecx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%ecx+%eax]
	MOV DWORD PTR [%esi], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$25
L$$26:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$25:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, %ebx
	IMUL %ecx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ecx+%eax], %edi
	JMP L$$16
L$$58:
	MOV %ebx, DWORD PTR [%ebp-20]
	MOV %ecx, DWORD PTR [%ebp-16]
	MOV %esi, %ecx
	MOV %ecx, DWORD PTR [%ebp-12]
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LBBS$Print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-4], %eax
L$$61:
	MOV %ebx, 0
L$$27:
	MOV %eax, 0
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+8]
	CMP %ebx, %ecx
	JL L$$30
L$$31:
	MOV %ecx, 1
	CMP %eax, %ecx
	JE L$$28
L$$29:
	MOV %eax, 0
	JMP L$$60
L$$30:
	MOV %eax, 1
	JMP L$$31
L$$28:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$32
L$$33:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$32:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, %ebx
	IMUL %ecx, 4
	MOV %eax, DWORD PTR [%eax+4]
	PUSH DWORD PTR [%ecx+%eax]
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, %ebx
	ADD %eax, 1
	MOV %ebx, %eax
	JMP L$$27
L$$60:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LBBS$Init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV %eax, %ebx
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, %esi
	MOV DWORD PTR [%ebp-4], %eax
L$$63:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebx+8], %eax
	MOV %eax, 4
	ADD %eax, DWORD PTR [%ebp+8]
	MOV %ebx, %eax
	MOV %esi, DWORD PTR [%ebp+12]
	MOV %eax, %esi
	ADD %eax, 1
	IMUL %eax, 4
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
	JL L$$34
L$$35:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$34:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%eax], 20
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 1
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$36
L$$37:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$36:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%eax+4], 7
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 2
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$38
L$$39:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$38:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 2
	IMUL %ebx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 12
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 3
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$40
L$$41:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$40:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 3
	IMUL %ebx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 18
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 4
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$42
L$$43:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$42:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 4
	IMUL %ebx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 2
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 5
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$44
L$$45:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$44:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 5
	IMUL %ebx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 11
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 6
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$46
L$$47:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$46:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 6
	IMUL %ebx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 6
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 7
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$48
L$$49:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$48:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 7
	IMUL %ebx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 9
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 8
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$50
L$$51:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$50:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 8
	IMUL %ebx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 19
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, -4
	MOV %eax, DWORD PTR [%eax+4]
	MOV %ebx, 9
	MOV %eax, DWORD PTR [%eax+%ecx]
	CMP %ebx, %eax
	JL L$$52
L$$53:
	MOV %eax, 0
	PUSH %eax
	CALL L_raise
	ADD %esp, 4
L$$52:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ebx, 9
	IMUL %ebx, 4
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebx+%eax], 5
	MOV %eax, 0
	JMP L$$62
L$$62:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %ecx, DWORD PTR [%ebp-4]
	MOV %esi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET

