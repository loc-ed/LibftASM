SECTION .text
global _ft_tolower

_ft_tolower:
	push	rbp
	mov	rbp, rsp
	mov	dword [rbp - 4], edi
	cmp	dword [rbp - 4], 65
	jl	LBB0_3

	cmp	dword [rbp - 4], 90
	jg	LBB0_3

	mov	eax, dword [rbp - 4]
	add	eax, 32
	mov	dword [rbp - 4], eax
LBB0_3:
	mov	eax, dword [rbp - 4]
	pop	rbp
	ret

