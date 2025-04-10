[bits 16]

lba_to_chs:
    xor dx, dx
    div word [SectorsPerTrack]
    inc dl
    mov cl, dl
    xor dx, dx
    div word [HeadsPerCylinder]
    mov ch, al
    mov dh, dl
    ret

disk_read:
    pusha
    mov di, 3
.retry:
    pusha
    call lba_to_chs
    mov ah, 0x02
    mov al, cl
    mov dl, [DriveNumber]
    int 0x13
    jnc .success
    popa
    call disk_reset
    dec di
    jnz .retry
    jmp disk_error
.success:
    popa
    popa
    ret

disk_reset:
    pusha
    mov ah, 0x00
    mov dl, [DriveNumber]
    int 0x13
    jc disk_error
    popa
    ret

disk_error:
    mov si, error_msg
    call print_string
    cli
    hlt
error_msg db "Disk error!", 0xD, 0xA, 0