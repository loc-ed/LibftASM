%ifdef OSX
	%define WRITE 0x2000004
	%define READ 0x2000003

%elif LINUX
	%define WRITE 1
	%define READ 0

%endif

SECTION .bss
	buf resb 10
	.size equ $ - buf 

SECTION .text
global _ft_cat:

_ft_cat:
	enter 0, 0
	cmp rdi, 0 
	jl exit

fd_read:
	push rdi
	mov rax, READ
	lea rsi,  [rel buf]
	mov rdx, buf.size
	syscall
	jc error
	cmp rax, 0
	jle error
	jmp _write

_write:
	mov rdx, rax
	mov rax, WRITE
	mov rdi, 1
	lea rsi, [rel buf]
	syscall
	cmp rax, 0
	jl error
	pop rdi
	jmp fd_read

error:
	pop rdi 
	leave
	ret

exit:
	leave
	ret
