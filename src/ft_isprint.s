global _ft_isprint
SECTION .text

_ft_isprint:
    mov rax, 1
    cmp rdi, 32
    js fail
    cmp rdi, 127
    js pass

pass:
    mov rax, 1
    jmp end

fail:
    mov rax, 0
    jmp end

end:
    ret