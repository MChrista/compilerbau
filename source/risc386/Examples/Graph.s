	.intel_syntax
	.global Lmain
Lmain:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %edi
L$$60:
	PUSH 4
	CALL L_halloc
	MOV %edi, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edi], 0
	PUSH %edi
	CALL LTest$test
	MOV %edi, %eax
	ADD %esp, 4
	PUSH %edi
	CALL L_println_int
	MOV %edi, %eax
	ADD %esp, 4
L$$0:
	XOR %edi, %edi
L$$59:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LLabel$init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
L$$62:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %ecx, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+4], %ecx
L$$2:
	XOR %eax, %eax
L$$61:
	MOV %esi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LLabel$label:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$64:
L$$4:
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%edi+4]
L$$63:
	MOV %eax, %edi
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LLabel$eq:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-8], %ebx
	MOV DWORD PTR [%ebp-4], %edi
L$$66:
	PUSH DWORD PTR [%ebp+12]
	CALL LLabel$label
	MOV %edi, %eax
	ADD %esp, 4
L$$6:
	XOR %ecx, %ecx
	XOR %ebx, %ebx
	MOV %eax, DWORD PTR [%ebp+8]
	ADD %eax, 4
	MOV %edx, %eax
	LEA %eax, DWORD PTR [%edi+1]
	CMP DWORD PTR [%edx], %eax
	JL L$$8
L$$9:
	TEST %ebx, %ebx
	JE L$$12
L$$13:
	XOR %eax, %eax
	MOV %ebx, DWORD PTR [%ebp+8]
	ADD %ebx, 4
	MOV %ebx, DWORD PTR [%ebx]
	ADD %ebx, 1
	CMP %edi, %ebx
	JL L$$10
L$$11:
	MOV %ecx, %eax
L$$12:
	MOV %edi, %ecx
	JMP L$$65
L$$10:
	MOV %eax, 1
	JMP L$$11
L$$8:
	MOV %ebx, 1
	JMP L$$9
L$$65:
	MOV %eax, %edi
	MOV %ebx, DWORD PTR [%ebp-8]
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LLabel$print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %edi
L$$68:
	MOV %edi, DWORD PTR [%ebp+8]
	ADD %edi, 4
	PUSH DWORD PTR [%edi]
	CALL L_println_int
	MOV %edi, %eax
	ADD %esp, 4
L$$14:
	XOR %edi, %edi
L$$67:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LNode$init:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$70:
	MOV %edi, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%edi+8], 0
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%edi+4], %eax
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%edi+12], %eax
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+8]
	MOV DWORD PTR [%edi+16], %eax
L$$16:
	XOR %edi, %edi
L$$69:
	MOV %eax, %edi
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LNode$label:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %edx, %esi
	MOV %ecx, %edi
L$$72:
L$$18:
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%edi+4]
L$$71:
	MOV %eax, %edi
	MOV %esi, %edx
	MOV %edi, %ecx
	MOV %esp, %ebp
	POP %ebp
	RET
LNode$setLeft:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$74:
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%edi+12], %eax
L$$20:
	XOR %edi, %edi
L$$73:
	MOV %eax, %edi
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LNode$setRight:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$76:
	MOV %eax, DWORD PTR [%ebp+8]
	MOV %edi, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%eax+16], %edi
L$$22:
	XOR %edi, %edi
L$$75:
	MOV %eax, %edi
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LNode$print:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %edi
L$$78:
	MOV %edi, DWORD PTR [%ebp+8]
	ADD %edi, 4
	PUSH DWORD PTR [%edi]
	CALL LLabel$print
	MOV %edi, %eax
	ADD %esp, 4
L$$24:
	XOR %edi, %edi
L$$77:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LNode$beq:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 0
	MOV %ecx, %esi
	MOV %edx, %edi
L$$80:
L$$26:
	XOR %eax, %eax
	XOR %edi, %edi
	CMP DWORD PTR [%ebp+12], 0
	JE L$$28
L$$29:
	MOV %edi, DWORD PTR [%ebp+16]
L$$28:
	XOR %edi, 1
	TEST %edi, %edi
	JE L$$32
L$$33:
	XOR %edi, %edi
	MOV %eax, DWORD PTR [%ebp+12]
	XOR %eax, 1
	TEST %eax, %eax
	JE L$$30
L$$31:
	MOV %edi, DWORD PTR [%ebp+16]
	XOR %edi, 1
L$$30:
	XOR %edi, 1
	MOV %eax, %edi
L$$32:
	MOV %edi, %eax
	XOR %edi, 1
L$$79:
	MOV %eax, %edi
	MOV %esi, %ecx
	MOV %edi, %edx
	MOV %esp, %ebp
	POP %ebp
	RET
LNode$dfs:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 4
	MOV DWORD PTR [%ebp-4], %edi
L$$82:
	PUSH DWORD PTR [%ebp+12]
	MOV %edi, DWORD PTR [%ebp+8]
	ADD %edi, 8
	PUSH DWORD PTR [%edi]
	PUSH DWORD PTR [%ebp+8]
	CALL LNode$beq
	MOV %edi, %eax
	ADD %esp, 12
	CMP %edi, 0
	JNE L$$45
L$$46:
	PUSH DWORD PTR [%ebp+16]
	MOV %edi, DWORD PTR [%ebp+8]
	ADD %edi, 4
	PUSH DWORD PTR [%edi]
	CALL LLabel$eq
	MOV %edi, %eax
	ADD %esp, 8
	CMP %edi, 0
	JNE L$$42
L$$43:
	MOV %edi, DWORD PTR [%ebp+8]
	MOV %eax, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%edi+8], %eax
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	MOV %edi, DWORD PTR [%ebp+8]
	ADD %edi, 12
	PUSH DWORD PTR [%edi]
	CALL LNode$dfs
	MOV %edi, %eax
	ADD %esp, 12
	CMP %edi, 0
	JNE L$$39
L$$40:
	PUSH DWORD PTR [%ebp+16]
	PUSH DWORD PTR [%ebp+12]
	MOV %edi, DWORD PTR [%ebp+8]
	ADD %edi, 16
	PUSH DWORD PTR [%edi]
	CALL LNode$dfs
	MOV %edi, %eax
	ADD %esp, 12
	CMP %edi, 0
	JNE L$$36
L$$37:
	XOR %edi, %edi
L$$38:
L$$41:
L$$44:
L$$47:
L$$34:
	JMP L$$81
L$$36:
	MOV %edi, 1
	JMP L$$38
L$$39:
	MOV %edi, 1
	JMP L$$41
L$$42:
	MOV %edi, 1
	JMP L$$44
L$$45:
	XOR %edi, %edi
	JMP L$$47
L$$81:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LTest$newLabel:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %edi
L$$84:
	PUSH 8
	CALL L_halloc
	MOV %edi, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edi], 0
	MOV DWORD PTR [%ebp-8], %edi
	PUSH DWORD PTR [%ebp+12]
	MOV %edi, DWORD PTR [%ebp-8]
	PUSH %edi
	CALL LLabel$init
	MOV %edi, %eax
	ADD %esp, 8
L$$48:
	MOV %edi, DWORD PTR [%ebp-8]
L$$83:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LTest$newNode:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 8
	MOV DWORD PTR [%ebp-4], %edi
L$$86:
	PUSH 20
	CALL L_halloc
	MOV %edi, %eax
	ADD %esp, 4
	MOV DWORD PTR [%edi], 0
	MOV DWORD PTR [%ebp-8], %edi
	PUSH DWORD PTR [%ebp+12]
	MOV %edi, DWORD PTR [%ebp-8]
	PUSH %edi
	CALL LNode$init
	MOV %edi, %eax
	ADD %esp, 8
L$$50:
	MOV %edi, DWORD PTR [%ebp-8]
L$$85:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-4]
	MOV %esp, %ebp
	POP %ebp
	RET
LTest$findPath:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 16
	MOV DWORD PTR [%ebp-8], %edi
L$$88:
	PUSH DWORD PTR [%ebp+12]
	CALL LNode$print
	MOV %edi, %eax
	ADD %esp, 4
	PUSH DWORD PTR [%ebp+16]
	CALL LNode$print
	MOV %edi, %eax
	ADD %esp, 4
	MOV %edi, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-16], %edi
	PUSH DWORD PTR [%ebp+16]
	CALL LNode$label
	MOV %edi, %eax
	ADD %esp, 4
	PUSH %edi
	PUSH 1
	MOV %edi, DWORD PTR [%ebp-16]
	PUSH %edi
	CALL LNode$dfs
	MOV %edi, %eax
	ADD %esp, 12
	MOV DWORD PTR [%ebp-4], %edi
	MOV %edi, DWORD PTR [%ebp+12]
	MOV DWORD PTR [%ebp-12], %edi
	PUSH DWORD PTR [%ebp+16]
	CALL LNode$label
	MOV %edi, %eax
	ADD %esp, 4
	PUSH %edi
	PUSH 0
	MOV %edi, DWORD PTR [%ebp-12]
	PUSH %edi
	CALL LNode$dfs
	MOV %edi, %eax
	ADD %esp, 12
	MOV %edi, DWORD PTR [%ebp-4]
	CMP %edi, 0
	JNE L$$54
L$$55:
	PUSH -999
	CALL L_println_int
	MOV %edi, %eax
	ADD %esp, 4
L$$56:
L$$52:
	XOR %edi, %edi
	JMP L$$87
L$$54:
	PUSH 999
	CALL L_println_int
	MOV %edi, %eax
	ADD %esp, 4
	JMP L$$56
L$$87:
	MOV %eax, %edi
	MOV %edi, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
LTest$test:
	PUSH %ebp
	MOV %ebp, %esp
	SUB %esp, 24
	MOV DWORD PTR [%ebp-20], %ebx
	MOV DWORD PTR [%ebp-16], %esi
	MOV DWORD PTR [%ebp-8], %edi
L$$90:
	PUSH 1
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newLabel
	MOV %edi, %eax
	ADD %esp, 8
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newNode
	MOV %edi, %eax
	ADD %esp, 8
	MOV DWORD PTR [%ebp-12], %edi
	PUSH 2
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newLabel
	MOV %edi, %eax
	ADD %esp, 8
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newNode
	MOV %edi, %eax
	ADD %esp, 8
	MOV %ebx, %edi
	PUSH 3
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newLabel
	MOV %edi, %eax
	ADD %esp, 8
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newNode
	MOV %edi, %eax
	ADD %esp, 8
	MOV %esi, %edi
	PUSH 4
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newLabel
	MOV %edi, %eax
	ADD %esp, 8
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newNode
	MOV %edi, %eax
	ADD %esp, 8
	MOV DWORD PTR [%ebp-24], %edi
	PUSH 5
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newLabel
	MOV %edi, %eax
	ADD %esp, 8
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$newNode
	MOV %edi, %eax
	ADD %esp, 8
	MOV DWORD PTR [%ebp-4], %edi
	PUSH %ebx
	MOV %edi, DWORD PTR [%ebp-12]
	PUSH %edi
	CALL LNode$setLeft
	MOV %edi, %eax
	ADD %esp, 8
	MOV %edi, DWORD PTR [%ebp-24]
	PUSH %edi
	MOV %edi, DWORD PTR [%ebp-12]
	PUSH %edi
	CALL LNode$setRight
	MOV %edi, %eax
	ADD %esp, 8
	PUSH %esi
	PUSH %ebx
	CALL LNode$setLeft
	MOV %edi, %eax
	ADD %esp, 8
	MOV %edi, DWORD PTR [%ebp-12]
	PUSH %edi
	PUSH %esi
	CALL LNode$setLeft
	MOV %edi, %eax
	ADD %esp, 8
	MOV %edi, DWORD PTR [%ebp-24]
	PUSH %edi
	PUSH %esi
	CALL LNode$setRight
	MOV %edi, %eax
	ADD %esp, 8
	MOV %edi, DWORD PTR [%ebp-24]
	PUSH %edi
	MOV %edi, DWORD PTR [%ebp-12]
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$findPath
	MOV %edi, %eax
	ADD %esp, 12
	MOV %edi, DWORD PTR [%ebp-12]
	PUSH %edi
	MOV %edi, DWORD PTR [%ebp-24]
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$findPath
	MOV %edi, %eax
	ADD %esp, 12
	PUSH %ebx
	PUSH %esi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$findPath
	MOV %edi, %eax
	ADD %esp, 12
	MOV %edi, DWORD PTR [%ebp-12]
	PUSH %edi
	MOV %edi, DWORD PTR [%ebp-24]
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$findPath
	MOV %edi, %eax
	ADD %esp, 12
	PUSH %ebx
	PUSH %esi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$findPath
	MOV %edi, %eax
	ADD %esp, 12
	PUSH %esi
	MOV %edi, DWORD PTR [%ebp-24]
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$findPath
	MOV %edi, %eax
	ADD %esp, 12
	MOV %edi, DWORD PTR [%ebp-4]
	PUSH %edi
	MOV %edi, DWORD PTR [%ebp-4]
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$findPath
	MOV %edi, %eax
	ADD %esp, 12
	MOV %edi, DWORD PTR [%ebp-24]
	PUSH %edi
	MOV %edi, DWORD PTR [%ebp-4]
	PUSH %edi
	PUSH DWORD PTR [%ebp+8]
	CALL LTest$findPath
	MOV %edi, %eax
	ADD %esp, 12
L$$57:
	XOR %edi, %edi
L$$89:
	MOV %eax, %edi
	MOV %ebx, DWORD PTR [%ebp-20]
	MOV %esi, DWORD PTR [%ebp-16]
	MOV %edi, DWORD PTR [%ebp-8]
	MOV %esp, %ebp
	POP %ebp
	RET
