%ifdef OSX
	%define WRITE 0x2000004

%elif LINUX 
	%define WRITE 1

%endif

SECTION .text
global _ft_putchar
extern _write

_ft_putchar:                            
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	al, dil
	mov	byte [rbp - 1], al
	mov	edi, 1
	lea	rsi, [rbp - 1]
	mov	edx, 1
	call _write
	mov	qword [rbp - 16], rax 
	add	rsp, 16
	pop	rbp
	ret

