global _ft_memset
SECTION .text

_ft_memset:
    push rdi
    mov rcx, rdx
    mov rax, rsi
    cld
    rep stosb

end:
    pop rax
    ret