SECTION .text
global	_ft_bzero

_ft_bzero:
	
	cmp rdi, 0
	jz exit
	mov rbx, rdi
	mov rax, rsi

while:
	cmp rax, 0
	jle exit
	
	mov byte[rbx], 0
	inc rbx
	dec rax
	jmp	while

exit:
	ret
