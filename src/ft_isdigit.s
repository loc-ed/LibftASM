global _ft_isdigit
SECTION .text

_ft_isdigit:
	cmp rdi, 0x30
	jl not_digit

	cmp rdi, 0x39
	jg not_digit

is_digit:
	mov rax, 1
	jmp return

not_digit:
	mov rax, 0
	jmp return

return:
	ret
