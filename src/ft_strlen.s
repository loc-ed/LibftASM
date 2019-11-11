SECTION .text
global _ft_strlen

_ft_strlen: 
	push	rbp
	mov	rbp, rsp
	mov	qword [rbp - 8], rdi
	mov	qword [rbp - 16], 0
LBB0_1:                                 
	mov	rax, qword [rbp - 8]
	mov	rcx, qword [rbp - 16]
	movsx	edx, byte [rax + rcx]
	cmp	edx, 0
	je	LBB0_3

	mov	rax, qword [rbp - 16]
	add	rax, 1
	mov	qword [rbp - 16], rax
	jmp	LBB0_1
LBB0_3:
	mov	rax, qword[rbp - 16]
	pop	rbp
	ret
