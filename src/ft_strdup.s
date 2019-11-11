SECTION .text
global _ft_strdup
extern _malloc

_ft_strdup: 
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	qword [rbp - 16], rdi
	mov	dword [rbp - 28], 0
	mov	dword [rbp - 32], 0
LBB0_1:                               
	mov	rax, qword [rbp - 16]
	movsxd	rcx, dword [rbp - 32]
	movsx	edx, byte [rax + rcx]
	cmp	edx, 0
	je	LBB0_3

	mov	eax, dword [rbp - 32]
	add	eax, 1
	mov	dword [rbp - 32], eax
	jmp	LBB0_1
LBB0_3:
	mov	eax, dword [rbp - 32]
	add	eax, 1
	movsxd	rcx, eax
	shl	rcx, 0
	mov	rdi, rcx
	call	_malloc
	mov	qword [rbp - 24], rax
	cmp	qword [rbp - 24], 0
	jne	LBB0_5

	mov	qword [rbp - 8], 0
	jmp	LBB0_9
LBB0_5:
	jmp	LBB0_6
LBB0_6:                              
	mov	rax, qword [rbp - 16]
	movsxd	rcx, dword [rbp - 28]
	movsx	edx, byte [rax + rcx]
	cmp	edx, 0
	je	LBB0_8

	mov	rax, qword [rbp - 16]
	movsxd	rcx, dword [rbp - 28]
	mov	dl, byte [rax + rcx]
	mov	rax, qword [rbp - 24]
	movsxd	rcx, dword [rbp - 28]
	mov	byte [rax + rcx], dl
	mov	esi, dword [rbp - 28]
	add	esi, 1
	mov	dword [rbp - 28], esi
	jmp	LBB0_6
LBB0_8:
	mov	rax, qword [rbp - 24]
	movsxd	rcx, dword [rbp - 28]
	mov	byte [rax + rcx], 0
	mov	rax, qword [rbp - 24]
	mov	qword [rbp - 8], rax
LBB0_9:
	mov	rax, qword [rbp - 8]
	add	rsp, 32
	pop	rbp
	ret
