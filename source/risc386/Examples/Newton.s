	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$78:
	PUSH 12
	CALL L_halloc
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ecx], 0
	PUSH 2
	PUSH %ecx
	CALL LNewtonMain$test_it
	MOV %ecx, %eax
	ADD %esp, 8
	PUSH %ecx
	CALL L_println_int
	MOV %ecx, %eax
	ADD %esp, 4
L$$0:
	XOR %ecx, %ecx
L$$77:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LFrac$init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %ebx
L$$80:
	MOV %eax, 1
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebx+4], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ecx+8], %ebx
L$$2:
	MOV %ecx, %eax
L$$79:
	MOV %eax, %ecx
	MOV %ebx, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LFrac$den:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %edi
L$$82:
L$$4:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+8]
L$$81:
	MOV %eax, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LFrac$num:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %ebx
L$$84:
L$$6:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+4]
L$$83:
	MOV %eax, %ecx
	MOV %ebx, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LFrac$showFrac:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$86:
	XOR %ecx, %ecx
	MOV DWORD PTR [%ebp-4], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 4
	PUSH DWORD PTR [%ecx]
	CALL L_println_int
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	PUSH DWORD PTR [%ecx]
	CALL L_println_int
	MOV %ecx, %eax
	ADD %esp, 4
L$$8:
	MOV %ecx, DWORD PTR [%ebp-4]
L$$85:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$eq:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %esi
L$$88:
L$$10:
	XOR %ecx, %ecx
	XOR %esi, %esi
	MOV %edx, DWORD PTR [%ebp+12]
	CMP %edx, DWORD PTR [%ebp+16]
	JL L$$12
L$$13:
	MOV %edx, %esi
	XOR %edx, 1
	TEST %edx, %edx
	JE L$$16
L$$17:
	XOR %ecx, %ecx
	MOV %edx, DWORD PTR [%ebp+16]
	CMP %edx, DWORD PTR [%ebp+12]
	JL L$$14
L$$15:
	XOR %ecx, 1
L$$16:
	JMP L$$87
L$$14:
	MOV %ecx, 1
	JMP L$$15
L$$12:
	MOV %esi, 1
	JMP L$$13
L$$87:
	MOV %eax, %ecx
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$div:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV %edx, %ebx
	MOV DWORD PTR [%ebp-4], %esi
L$$90:
	XOR %esi, %esi
L$$20:
	MOV %ecx, DWORD PTR [%ebp+12]
	CMP %ecx, DWORD PTR [%ebp+16]
	JGE L$$21
L$$22:
L$$18:
	MOV %ecx, %esi
	JMP L$$89
L$$21:
	LEA %ecx, DWORD PTR [%esi+1]
	MOV %esi, %ecx
	MOV %ecx, DWORD PTR [%ebp+12]
	SUB %ecx, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp+12], %ecx
	JMP L$$20
L$$89:
	MOV %eax, %ecx
	MOV %ebx, %edx
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$rem:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %esi
L$$92:
L$$23:
	MOV %esi, DWORD PTR [%ebp+12]
	MOV %ecx, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-8], %ecx
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edx, DWORD PTR [%ebp-8]
	IMUL %edx, %ecx
	MOV %ecx, %esi
	SUB %ecx, %edx
L$$91:
	MOV %eax, %ecx
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$gcd_rec:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %esi
L$$94:
	MOV %ecx, DWORD PTR [%ebp+12]
	CMP %ecx, DWORD PTR [%ebp+16]
	JGE L$$31
L$$30:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$gcd_rec
	MOV %ecx, %eax
	ADD %esp, 12
L$$32:
L$$25:
	JMP L$$93
L$$31:
	CMP DWORD PTR [%ebp+16], 1
	JGE L$$28
L$$27:
	MOV %ecx, DWORD PTR [%ebp+12]
L$$29:
	JMP L$$32
L$$28:
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-8], %ecx
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$rem
	MOV %ecx, %eax
	ADD %esp, 12
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	PUSH %ecx
	PUSH %esi
	CALL LIntegral$gcd_rec
	MOV %ecx, %eax
	ADD %esp, 12
	JMP L$$29
L$$93:
	MOV %eax, %ecx
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$gcd_iter:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$96:
	MOV %ecx, DWORD PTR [%ebp+12]
	CMP %ecx, DWORD PTR [%ebp+16]
	JGE L$$36
L$$35:
	MOV %edx, DWORD PTR [%ebp+12]
	MOV %ecx, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp+12], %ecx
	MOV DWORD PTR [%ebp+16], %edx
L$$37:
L$$38:
	MOV %ecx, 0
	CMP %ecx, DWORD PTR [%ebp+16]
	JGE L$$40
L$$39:
	MOV %edx, DWORD PTR [%ebp+12]
	MOV %ecx, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp+12], %ecx
	PUSH DWORD PTR [%ebp+16]
	PUSH %edx
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$rem
	MOV %ecx, %eax
	ADD %esp, 12
	MOV DWORD PTR [%ebp+16], %ecx
	JMP L$$38
L$$40:
L$$33:
	MOV %ecx, DWORD PTR [%ebp+12]
	JMP L$$95
L$$36:
	JMP L$$37
L$$95:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$gcd:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$98:
L$$41:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$gcd_rec
	MOV %ecx, %eax
	ADD %esp, 12
L$$97:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$lcm:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-4], %ebx
	MOV DWORD PTR [%ebp-8], %edi
L$$100:
	MOV %edi, DWORD PTR [%ebp+16]
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-12], %ecx
	MOV %ebx, DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$gcd
	MOV %ecx, %eax
	ADD %esp, 12
	PUSH %ecx
	PUSH %ebx
	MOV %ecx, DWORD PTR [%ebp-12]
	PUSH %ecx
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edx, %edi
	IMUL %edx, %ecx
	MOV %ecx, %edx
L$$43:
L$$99:
	MOV %eax, %ecx
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %edi, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$102:
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 4
	MOV DWORD PTR [%ebp-4], %ecx
	PUSH 4
	CALL L_halloc
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %edx, %ecx
	MOV DWORD PTR [%edx], 0
	MOV %ecx, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%ecx], %edx
	XOR %ecx, %ecx
L$$45:
L$$101:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$mkFrac:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %esi
L$$104:
	PUSH 12
	CALL L_halloc
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ecx], 0
	MOV %esi, %ecx
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH %esi
	CALL LFrac$init
	MOV %ecx, %eax
	ADD %esp, 12
L$$47:
	MOV %ecx, %esi
L$$103:
	MOV %eax, %ecx
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$plus:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 20
	MOV DWORD PTR [%ebp-20], %ebx
	MOV DWORD PTR [%ebp-4], %esi
	MOV DWORD PTR [%ebp-16], %edi
L$$106:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ecx+4]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %edi, %ecx
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	PUSH %edi
	PUSH %esi
	CALL LIntegral$lcm
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edi, %ecx
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ebp-12], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ecx+4]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	PUSH %edi
	PUSH %esi
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edx, %ecx
	MOV %ecx, DWORD PTR [%ebp-12]
	IMUL %ecx, %edx
	MOV %ebx, %ecx
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ebp-8], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ecx+4]
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	PUSH %edi
	PUSH %esi
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edx, DWORD PTR [%ebp-8]
	IMUL %edx, %ecx
	MOV %ecx, %ebx
	ADD %ecx, %edx
	MOV %edx, %edi
	PUSH %edx
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$mkFrac
	MOV %ecx, %eax
	ADD %esp, 12
L$$49:
L$$105:
	MOV %eax, %ecx
	MOV %ebx, DWORD PTR [%ebp-20]
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %edi, DWORD PTR [%ebp-16]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$times:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 28
	MOV DWORD PTR [%ebp-24], %esi
	MOV DWORD PTR [%ebp-28], %edi
L$$108:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%ecx+4]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %esi, %ecx
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	PUSH %esi
	PUSH %edi
	CALL LIntegral$gcd
	MOV %ecx, %eax
	ADD %esp, 12
	MOV DWORD PTR [%ebp-8], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ecx+4]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %edi, %ecx
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	PUSH %edi
	PUSH %esi
	CALL LIntegral$gcd
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edi, %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ecx+4]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %edi
	PUSH %ecx
	PUSH %esi
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %esi, %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+4]
	MOV DWORD PTR [%ebp-20], %ecx
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %edx, DWORD PTR [%ebp-8]
	PUSH %edx
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-20]
	PUSH %ecx
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edx, %ecx
	MOV %ecx, %esi
	IMUL %ecx, %edx
	MOV %esi, %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+4]
	MOV DWORD PTR [%ebp-4], %ecx
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %edx, %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	PUSH %ecx
	PUSH %edx
	MOV %ecx, DWORD PTR [%ebp-4]
	PUSH %ecx
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV DWORD PTR [%ebp-16], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+4]
	MOV DWORD PTR [%ebp-12], %ecx
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %edi
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-12]
	PUSH %ecx
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edx, %ecx
	MOV %ecx, DWORD PTR [%ebp-16]
	IMUL %ecx, %edx
	PUSH %ecx
	PUSH %esi
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$mkFrac
	MOV %ecx, %eax
	ADD %esp, 12
L$$51:
L$$107:
	MOV %eax, %ecx
	MOV %esi, DWORD PTR [%ebp-24]
	MOV %edi, DWORD PTR [%ebp-28]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$recip:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
L$$110:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-4], %ecx
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ebp-8], %ecx
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-4]
	PUSH %ecx
	CALL LFracOps$mkFrac
	MOV %ecx, %eax
	ADD %esp, 12
L$$53:
L$$109:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$divide:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$112:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$recip
	MOV %ecx, %eax
	ADD %esp, 8
	PUSH %ecx
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$times
	MOV %ecx, %eax
	ADD %esp, 12
L$$55:
L$$111:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$neg:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
L$$114:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-4], %ecx
	MOV %ecx, -1
	MOV DWORD PTR [%ebp-12], %ecx
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %edx, DWORD PTR [%ebp-12]
	IMUL %edx, %ecx
	MOV DWORD PTR [%ebp-8], %edx
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-4]
	PUSH %ecx
	CALL LFracOps$mkFrac
	MOV %ecx, %eax
	ADD %esp, 12
L$$57:
L$$113:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$abs_minus:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-4], %esi
L$$116:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$lt
	MOV %ecx, %eax
	ADD %esp, 12
	CMP %ecx, 0
	JNE L$$61
L$$62:
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-12], %ecx
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$neg
	MOV %ecx, %eax
	ADD %esp, 8
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-12]
	PUSH %ecx
	PUSH %esi
	CALL LFracOps$plus
	MOV %ecx, %eax
	ADD %esp, 12
L$$63:
L$$59:
	JMP L$$115
L$$61:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-8], %ecx
	MOV %esi, DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$neg
	MOV %ecx, %eax
	ADD %esp, 8
	PUSH %ecx
	PUSH %esi
	MOV %ecx, DWORD PTR [%ebp-8]
	PUSH %ecx
	CALL LFracOps$plus
	MOV %ecx, %eax
	ADD %esp, 12
	JMP L$$63
L$$115:
	MOV %eax, %ecx
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$lt:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 20
	MOV DWORD PTR [%ebp-16], %ebx
	MOV DWORD PTR [%ebp-20], %esi
L$$118:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ecx+4]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %ebx, %ecx
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	PUSH %ebx
	PUSH %esi
	CALL LIntegral$lcm
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %ebx, %ecx
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ebp-12], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ecx+4]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	PUSH %ebx
	PUSH %esi
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edx, DWORD PTR [%ebp-12]
	IMUL %edx, %ecx
	MOV %esi, %edx
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$num
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ebp-8], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+4]
	MOV DWORD PTR [%ebp-4], %ecx
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH %ecx
	PUSH %ebx
	MOV %ecx, DWORD PTR [%ebp-4]
	PUSH %ecx
	CALL LIntegral$div
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %edx, %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	IMUL %ecx, %edx
	XOR %edx, %edx
	CMP %esi, %ecx
	JL L$$66
L$$67:
	MOV %ecx, %edx
L$$64:
	JMP L$$117
L$$66:
	MOV %edx, 1
	JMP L$$67
L$$117:
	MOV %eax, %ecx
	MOV %ebx, DWORD PTR [%ebp-16]
	MOV %esi, DWORD PTR [%ebp-20]
	MOV %esp, %ebp
	POP %ebp
	RET
LNewtonMain$newton_step:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 20
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-4], %esi
	MOV DWORD PTR [%ebp-20], %edi
L$$120:
L$$68:
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%ecx+8]
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %esi, DWORD PTR [%ecx+4]
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ecx+8]
	MOV DWORD PTR [%ebp-16], %ecx
	MOV %ecx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-12], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	MOV %ebx, DWORD PTR [%ecx+8]
	PUSH 1
	PUSH DWORD PTR [%ebp+16]
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	PUSH DWORD PTR [%ecx]
	CALL LFracOps$mkFrac
	MOV %ecx, %eax
	ADD %esp, 12
	PUSH DWORD PTR [%ebp+12]
	PUSH %ecx
	PUSH %ebx
	CALL LFracOps$divide
	MOV %ecx, %eax
	ADD %esp, 12
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-12]
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-16]
	PUSH %ecx
	CALL LFracOps$plus
	MOV %ecx, %eax
	ADD %esp, 12
	PUSH %ecx
	PUSH %esi
	PUSH %edi
	CALL LFracOps$times
	MOV %ecx, %eax
	ADD %esp, 12
L$$119:
	MOV %eax, %ecx
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %edi, DWORD PTR [%ebp-20]
	MOV %esp, %ebp
	POP %ebp
	RET
LNewtonMain$newton:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-4], %esi
L$$122:
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 4
	MOV %esi, %ecx
	PUSH 2
	PUSH 1
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	PUSH DWORD PTR [%ecx]
	CALL LFracOps$mkFrac
	MOV %ecx, %eax
	ADD %esp, 12
	MOV DWORD PTR [%esi], %ecx
	PUSH 100
	PUSH 1
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	PUSH DWORD PTR [%ecx]
	CALL LFracOps$mkFrac
	MOV %ecx, %eax
	ADD %esp, 12
	MOV %esi, %ecx
	PUSH 1
	PUSH DWORD PTR [%ebp+12]
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	PUSH DWORD PTR [%ecx]
	CALL LFracOps$mkFrac
	MOV %ecx, %eax
	ADD %esp, 12
	MOV DWORD PTR [%ebp-12], %ecx
	MOV %ecx, DWORD PTR [%ebp-12]
L$$72:
	PUSH %ecx
	PUSH %esi
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	PUSH DWORD PTR [%ecx]
	CALL LFracOps$lt
	MOV %ecx, %eax
	ADD %esp, 12
	CMP %ecx, 0
	JNE L$$73
L$$74:
L$$70:
	MOV %ecx, DWORD PTR [%ebp-12]
	JMP L$$121
L$$73:
	MOV %ecx, DWORD PTR [%ebp-12]
	MOV DWORD PTR [%ebp-8], %ecx
	PUSH DWORD PTR [%ebp+12]
	MOV %ecx, DWORD PTR [%ebp-12]
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LNewtonMain$newton_step
	MOV %ecx, %eax
	ADD %esp, 12
	MOV DWORD PTR [%ebp-12], %ecx
	MOV %ecx, DWORD PTR [%ebp-8]
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp-12]
	PUSH %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	PUSH DWORD PTR [%ecx]
	CALL LFracOps$abs_minus
	MOV %ecx, %eax
	ADD %esp, 12
	JMP L$$72
L$$121:
	MOV %eax, %ecx
	MOV %esi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LNewtonMain$test_it:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
L$$124:
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	MOV DWORD PTR [%ebp-8], %ecx
	PUSH 8
	CALL L_halloc
	MOV %ecx, %eax
	ADD %esp, 4
	MOV DWORD PTR [%ecx], 0
	MOV %edx, DWORD PTR [%ebp-8]
	MOV DWORD PTR [%edx], %ecx
	MOV %ecx, DWORD PTR [%ebp+8]
	ADD %ecx, 8
	PUSH DWORD PTR [%ecx]
	CALL LFracOps$init
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LNewtonMain$newton
	MOV %ecx, %eax
	ADD %esp, 8
	MOV DWORD PTR [%ebp-4], %ecx
	PUSH DWORD PTR [%ebp+12]
	CALL L_println_int
	MOV %ecx, %eax
	ADD %esp, 4
	PUSH 999
	CALL L_println_int
	MOV %ecx, %eax
	ADD %esp, 4
	MOV %ecx, DWORD PTR [%ebp-4]
	PUSH %ecx
	CALL LFrac$showFrac
	MOV %ecx, %eax
	ADD %esp, 4
L$$75:
L$$123:
	MOV %eax, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
