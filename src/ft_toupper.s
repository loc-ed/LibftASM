SECTION .text
global _ft_toupper

_ft_toupper:
	push	rbp
	mov	rbp, rsp
	mov	dword [rbp - 4], edi
	cmp	dword [rbp - 4], 97
	jl	LBB0_3

	cmp	dword [rbp - 4], 122
	jg	LBB0_3

	mov	eax, dword [rbp - 4]
	sub	eax, 32
	mov	dword [rbp - 4], eax
LBB0_3:
	mov	eax, dword [rbp - 4]
	pop	rbp
	ret

