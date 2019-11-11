global _ft_isascii
SECTION .text

_ft_isascii:
    mov rax, 1
    cmp rdi, 0
    js fail
    cmp rdi, 128
    js pass

pass:
    mov rax, 1
    jmp end

fail:
    mov rax, 0
    jmp end

end:
    ret 