global _ft_isalpha
SECTION .text

_ft_isalpha:
	cmp rdi, 0x41
	jl fail	

	cmp rdi, 0x7a
	jg fail

	cmp rdi, 0x5a
	jle pass

	cmp rdi, 0x61
	jge pass

	jmp fail

pass:
	mov rax, 1
	jmp return

fail:
	mov rax, 0
	jmp return

return:
	ret

