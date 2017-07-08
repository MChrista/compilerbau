	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$76:
	PUSH 8
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	PUSH 2
	PUSH %eax
	CALL LNewton$test_it
	ADD %esp, 8
	PUSH %eax
	CALL L_println_int
	ADD %esp, 4
L$$0:
	XOR %eax, %eax
L$$75:
	MOV %esp, %ebp
	POP %ebp
	RET
LFrac$init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$78:
	MOV %esi, 1
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%edi+4], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%eax+8], %edi
L$$2:
	MOV %eax, %esi
L$$77:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LFrac$den:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$80:
L$$4:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+8]
L$$79:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LFrac$num:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$82:
L$$6:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
L$$81:
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LFrac$showFrac:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$84:
	XOR %eax, %eax
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	PUSH DWORD PTR [%eax]
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 8
	PUSH DWORD PTR [%eax]
	CALL L_println_int
	ADD %esp, 4
L$$8:
	MOV %eax, DWORD PTR [%ebp-4]
L$$83:
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$eq:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$86:
L$$10:
	XOR %esi, %esi
	XOR %edi, %edi
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JL L$$12
L$$13:
	MOV %eax, %edi
	XOR %eax, 1
	TEST %eax, %eax
	JE L$$16
L$$17:
	XOR %eax, %eax
	MOV %esi, DWORD PTR [%ebp+16]
	CMP %esi, DWORD PTR [%ebp+12]
	JL L$$14
L$$15:
	XOR %eax, 1
	MOV %esi, %eax
L$$16:
	MOV %eax, %esi
	JMP L$$85
L$$14:
	MOV %eax, 1
	JMP L$$15
L$$12:
	MOV %edi, 1
	JMP L$$13
L$$85:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$div:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$88:
	XOR %esi, %esi
L$$20:
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$21
L$$22:
L$$18:
	MOV %eax, %esi
	JMP L$$87
L$$21:
	LEA %eax, DWORD PTR [%esi+1]
	MOV %esi, %eax
	MOV %eax, DWORD PTR [%ebp+12]
	SUB %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp+12], %eax
	JMP L$$20
L$$87:
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$rem:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-8], %ebx
L$$90:
L$$23:
	MOV %ebx, DWORD PTR [%ebp+12]
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ecx, DWORD PTR [%ebp-4]
	IMUL %ecx, %eax
	MOV %eax, %ebx
	SUB %eax, %ecx
L$$89:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$gcd_rec:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %ebx
L$$92:
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$31
L$$30:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$gcd_rec
	ADD %esp, 12
L$$32:
L$$25:
	JMP L$$91
L$$31:
	CMP DWORD PTR [%ebp+16], 1
	JGE L$$28
L$$27:
	MOV %eax, DWORD PTR [%ebp+12]
L$$29:
	JMP L$$32
L$$28:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$rem
	ADD %esp, 12
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	PUSH %ebx
	CALL LIntegral$gcd_rec
	ADD %esp, 12
	JMP L$$29
L$$91:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$gcd_iter:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$94:
	MOV %eax, DWORD PTR [%ebp+12]
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$36
L$$35:
	MOV %ecx, DWORD PTR [%ebp+12]
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp+12], %eax
	MOV DWORD PTR [%ebp+16], %ecx
L$$37:
L$$38:
	MOV %eax, 0
	CMP %eax, DWORD PTR [%ebp+16]
	JGE L$$40
L$$39:
	MOV %ecx, DWORD PTR [%ebp+12]
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp+12], %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$rem
	ADD %esp, 12
	MOV DWORD PTR [%ebp+16], %eax
	JMP L$$38
L$$40:
L$$33:
	MOV %eax, DWORD PTR [%ebp+12]
	JMP L$$93
L$$36:
	JMP L$$37
L$$93:
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$gcd:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$96:
L$$41:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$gcd_rec
	ADD %esp, 12
L$$95:
	MOV %esp, %ebp
	POP %ebp
	RET
LIntegral$lcm:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
L$$98:
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-12], %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LIntegral$gcd
	ADD %esp, 12
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ecx, DWORD PTR [%ebp-8]
	IMUL %ecx, %eax
	MOV %eax, %ecx
L$$43:
L$$97:
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$mkFrac:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %ebx
L$$100:
	PUSH 12
	CALL L_halloc
	ADD %esp, 4
	MOV DWORD PTR [%eax], 0
	MOV %ebx, %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH %ebx
	CALL LFrac$init
	ADD %esp, 12
L$$45:
	MOV %eax, %ebx
L$$99:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$plus:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 20
	MOV DWORD PTR [%ebp-20], %ebx
	MOV DWORD PTR [%ebp-16], %esi
L$$102:
	MOV %ebx, DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	ADD %esp, 4
	MOV %esi, %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %eax
	PUSH %esi
	PUSH %ebx
	CALL LIntegral$lcm
	ADD %esp, 12
	MOV %ebx, %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	ADD %esp, 4
	MOV DWORD PTR [%ebp-12], %eax
	MOV %esi, DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %eax
	PUSH %ebx
	PUSH %esi
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-12]
	IMUL %eax, %ecx
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$num
	ADD %esp, 4
	MOV DWORD PTR [%ebp-4], %eax
	MOV %esi, DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %eax
	PUSH %ebx
	PUSH %esi
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ecx, DWORD PTR [%ebp-4]
	IMUL %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	ADD %eax, %ecx
	MOV %ecx, %eax
	MOV %eax, %ebx
	PUSH %eax
	PUSH %ecx
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$mkFrac
	ADD %esp, 12
L$$47:
L$$101:
	MOV %ebx, DWORD PTR [%ebp-20]
	MOV %esi, DWORD PTR [%ebp-16]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$times:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 24
	MOV DWORD PTR [%ebp-4], %ebx
	MOV DWORD PTR [%ebp-24], %esi
	MOV DWORD PTR [%ebp-20], %edi
L$$104:
	MOV %esi, DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	ADD %esp, 4
	MOV %ebx, %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$num
	ADD %esp, 4
	PUSH %eax
	PUSH %ebx
	PUSH %esi
	CALL LIntegral$gcd
	ADD %esp, 12
	MOV %edi, %eax
	MOV %esi, DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	ADD %esp, 4
	MOV %ebx, %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %eax
	PUSH %ebx
	PUSH %esi
	CALL LIntegral$gcd
	ADD %esp, 12
	MOV %esi, %eax
	MOV %ebx, DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	ADD %esp, 4
	PUSH %esi
	PUSH %eax
	PUSH %ebx
	CALL LIntegral$div
	ADD %esp, 12
	MOV DWORD PTR [%ebp-8], %eax
	MOV %ebx, DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$num
	ADD %esp, 4
	PUSH %edi
	PUSH %eax
	PUSH %ebx
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp-8]
	IMUL %eax, %ebx
	MOV %ebx, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-12], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %edi
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LIntegral$div
	ADD %esp, 12
	MOV %edi, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-16], %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %esi
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-16]
	PUSH %eax
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ecx, %edi
	IMUL %ecx, %eax
	MOV %eax, %ecx
	PUSH %eax
	PUSH %ebx
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$mkFrac
	ADD %esp, 12
L$$49:
L$$103:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esi, DWORD PTR [%ebp-24]
	MOV %edi, DWORD PTR [%ebp-20]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$recip:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %ebx
L$$106:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	ADD %esp, 4
	MOV %ebx, %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	ADD %esp, 4
	PUSH %eax
	PUSH %ebx
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LFracOps$mkFrac
	ADD %esp, 12
L$$51:
L$$105:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$divide:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
L$$108:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$recip
	ADD %esp, 8
	PUSH %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$times
	ADD %esp, 12
L$$53:
L$$107:
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$neg:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-4], %ebx
L$$110:
	MOV %ebx, DWORD PTR [%ebp+8]
	MOV %eax, -1
	MOV DWORD PTR [%ebp-12], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	ADD %esp, 4
	MOV %ecx, DWORD PTR [%ebp-12]
	IMUL %ecx, %eax
	MOV DWORD PTR [%ebp-8], %ecx
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	PUSH %ebx
	CALL LFracOps$mkFrac
	ADD %esp, 12
L$$55:
L$$109:
	MOV %ebx, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$abs_minus:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
L$$112:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$lt
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$59
L$$60:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-12], %eax
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-16], %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$neg
	ADD %esp, 8
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-16]
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	CALL LFracOps$plus
	ADD %esp, 12
L$$61:
L$$57:
	JMP L$$111
L$$59:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp+16]
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$neg
	ADD %esp, 8
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LFracOps$plus
	ADD %esp, 12
	JMP L$$61
L$$111:
	MOV %esp, %ebp
	POP %ebp
	RET
LFracOps$lt:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 20
	MOV DWORD PTR [%ebp-16], %ebx
	MOV DWORD PTR [%ebp-20], %esi
L$$114:
	MOV %esi, DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	ADD %esp, 4
	MOV %ebx, %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %eax
	PUSH %ebx
	PUSH %esi
	CALL LIntegral$lcm
	ADD %esp, 12
	MOV %ebx, %eax
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$num
	ADD %esp, 4
	MOV DWORD PTR [%ebp-12], %eax
	MOV %esi, DWORD PTR [%ebp+8]
	PUSH DWORD PTR [%ebp+12]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %eax
	PUSH %ebx
	PUSH %esi
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ecx, %eax
	MOV %eax, DWORD PTR [%ebp-12]
	IMUL %eax, %ecx
	MOV DWORD PTR [%ebp-8], %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$num
	ADD %esp, 4
	MOV %esi, %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+16]
	CALL LFrac$den
	ADD %esp, 4
	PUSH %eax
	PUSH %ebx
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LIntegral$div
	ADD %esp, 12
	MOV %ebx, %esi
	IMUL %ebx, %eax
	MOV %eax, %ebx
	XOR %ecx, %ecx
	MOV %ebx, DWORD PTR [%ebp-8]
	CMP %ebx, %eax
	JL L$$64
L$$65:
	MOV %eax, %ecx
L$$62:
	JMP L$$113
L$$64:
	MOV %ecx, 1
	JMP L$$65
L$$113:
	MOV %ebx, DWORD PTR [%ebp-16]
	MOV %esi, DWORD PTR [%ebp-20]
	MOV %esp, %ebp
	POP %ebp
	RET
LNewton$newton_step:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 24
	MOV DWORD PTR [%ebp-16], %ebx
	MOV DWORD PTR [%ebp-24], %esi
	MOV DWORD PTR [%ebp-4], %edi
L$$116:
L$$66:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%ebp-8], %eax
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%eax+4]
	MOV DWORD PTR [%ebp-12], %eax
	MOV %esi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-20], %eax
	MOV %ebx, DWORD PTR [%ebp+8]
	PUSH 1
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$mkFrac
	ADD %esp, 12
	PUSH DWORD PTR [%ebp+12]
	PUSH %eax
	PUSH %ebx
	CALL LFracOps$divide
	ADD %esp, 12
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-20]
	PUSH %eax
	PUSH %esi
	CALL LFracOps$plus
	ADD %esp, 12
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-8]
	PUSH %eax
	CALL LFracOps$times
	ADD %esp, 12
L$$115:
	MOV %ebx, DWORD PTR [%ebp-16]
	MOV %esi, DWORD PTR [%ebp-24]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LNewton$newton:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 12
	MOV DWORD PTR [%ebp-8], %ebx
L$$118:
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	MOV %ebx, %eax
	PUSH 2
	PUSH 1
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$mkFrac
	ADD %esp, 12
	MOV DWORD PTR [%ebx], %eax
	PUSH 100
	PUSH 1
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$mkFrac
	ADD %esp, 12
	MOV %ebx, %eax
	PUSH 1
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$mkFrac
	ADD %esp, 12
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-4]
L$$70:
	PUSH %eax
	PUSH %ebx
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$lt
	ADD %esp, 12
	CMP %eax, 0
	JNE L$$71
L$$72:
L$$68:
	MOV %eax, DWORD PTR [%ebp-4]
	JMP L$$117
L$$71:
	MOV %eax, DWORD PTR [%ebp-4]
	MOV DWORD PTR [%ebp-12], %eax
	PUSH DWORD PTR [%ebp+12]
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LNewton$newton_step
	ADD %esp, 12
	MOV DWORD PTR [%ebp-4], %eax
	MOV %eax, DWORD PTR [%ebp-12]
	PUSH %eax
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	PUSH DWORD PTR [%ebp+8]
	CALL LFracOps$abs_minus
	ADD %esp, 12
	JMP L$$70
L$$117:
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LNewton$test_it:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
L$$120:
	PUSH DWORD PTR [%ebp+12]
	PUSH DWORD PTR [%ebp+8]
	CALL LNewton$newton
	ADD %esp, 8
	MOV DWORD PTR [%ebp-4], %eax
	PUSH DWORD PTR [%ebp+12]
	CALL L_println_int
	ADD %esp, 4
	PUSH 999
	CALL L_println_int
	ADD %esp, 4
	MOV %eax, DWORD PTR [%ebp-4]
	PUSH %eax
	CALL LFrac$showFrac
	ADD %esp, 4
L$$73:
L$$119:
	MOV %esp, %ebp
	POP %ebp
	RET
