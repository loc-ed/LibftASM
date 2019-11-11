SECTION .text
global _ft_puts
extern _ft_strlen

_ft_puts:
	mov rcx, rdi
	call _ft_strlen
	mov rdi, 1
	mov rdx, rax
	mov rax, 0x2000004
	mov rsi, rcx
	syscall

	mov rdx, 1
	mov rax, 0x2000004
	lea rsi, [rel endline]
	syscall

end:
	ret

SECTION .data
endline db 0x0a



