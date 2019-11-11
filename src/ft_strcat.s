SECTION .text
global _ft_strcat

_ft_strcat:                             
	push	rbp
	mov	rbp, rsp
	mov	qword [rbp - 8], rdi
	mov	qword [rbp - 16], rsi
	mov	qword [rbp - 24], 0
	mov	qword [rbp - 32], 0
LBB0_1:                                 
	mov	rax, qword [rbp - 8]
	mov	rcx, qword [rbp - 24]
	movsx	edx, byte [rax + rcx]
	cmp	edx, 0
	je	LBB0_3

	mov	rax, qword [rbp - 24]
	add	rax, 1
	mov	qword [rbp - 24], rax
	jmp	LBB0_1
LBB0_3:
	jmp	LBB0_4
LBB0_4:                                 
	mov	rax, qword [rbp - 16]
	mov	rcx, qword [rbp - 32]
	movsx	edx, byte [rax + rcx]
	cmp	edx, 0
	je	LBB0_6

	mov	rax, qword [rbp - 16]
	mov	rcx, qword [rbp - 32]
	mov	dl, byte [rax + rcx]
	mov	rax, qword [rbp - 8]
	mov	rcx, qword [rbp - 24]
	add	rcx, qword [rbp - 32]
	mov	byte [rax + rcx], dl
	mov	rax, qword [rbp - 32]
	add	rax, 1
	mov	qword [rbp - 32], rax
	jmp	LBB0_4
LBB0_6:
	mov	rax, qword [rbp - 8]
	mov	rcx, qword [rbp - 24]
	add	rcx, qword [rbp - 32]
	mov	byte [rax + rcx], 0
	mov	rax, qword [rbp - 8]
	pop	rbp
	ret
