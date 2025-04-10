; src/kernel/kernel.asm
[bits 16]
[org 0x7E00]

main:
    ; Set video mode to 80x25 text (BIOS function 0x00, AH=0x00, AL=0x03)
    mov ax, 0x0003
    int 0x10

    ; Reset segment registers to match [org 0x7E00]
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; Print message
    mov si, msg_kernel
    call print_string

    ; Halt
    cli
    hlt

%include "../bootloader/print.asm"

msg_kernel db "Kernel loaded!", 0xD, 0xA, 0