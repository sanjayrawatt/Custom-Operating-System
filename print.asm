; src/bootloader/print.asm
[bits 16]

; Print a null-terminated string
; Input: SI = string address
print_string:
    pusha
    mov ah, 0x0E        ; BIOS teletype function
.loop:
    lodsb               ; Load byte from SI into AL, increment SI
    test al, al         ; Check for null terminator
    jz .done
    int 0x10            ; Print character
    jmp .loop
.done:
    popa
    ret