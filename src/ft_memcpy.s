global _ft_memcpy
SECTION .text

_ft_memcpy:
   push rdi
   mov rcx, rdx     
   cld              ;## clear direction flag so that string pointers auto increment after string operation
   rep movsb        ;##(copy mem to mem)

end:
    pop rax
    ret


