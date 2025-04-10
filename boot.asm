[org 0x7C00]
[bits 16]

jmp short start
nop

; FAT12 Headers
OEMIdentifier      db "MYOS    "
BytesPerSector     dw 512
SectorsPerCluster  db 1
ReservedSectors    dw 1
FATCount           db 2
RootDirEntries     dw 224
TotalSectors       dw 2880
MediaDescriptor    db 0xF0
SectorsPerFAT      dw 9
SectorsPerTrack    dw 18
HeadsPerCylinder   dw 2
HiddenSectors      dd 0
LargeSectorCount   dd 0

DriveNumber        db 0
Reserved           db 0
BootSignature      db 0x29
VolumeID           dd 0x12345678
VolumeLabel        db "MYOS FLOPPY"
FileSystemType     db "FAT12   "

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    mov [DriveNumber], dl  ; Save boot drive

    ; Print loading message
    mov si, msg_loading
    call print_string

    ; Load kernel from sector 33 (LBA 33)
    mov ax, 33             ; LBA = 33 (data region start)
    mov cl, 1              ; Read 1 sector
    mov bx, 0x7E00         ; Load kernel here
    call disk_read

    jmp 0x0000:0x7E00      ; Jump to kernel

%include "disk.asm"
%include "print.asm"

msg_loading db "Loading kernel...", 0xD, 0xA, 0

times 510 - ($ - $$) db 0
dw 0xAA55