Custom Operating System (OS)
A minimal custom operating system built from scratch as a learning experiment.

Overview
This project is a simple operating system developed to understand low-level system programming, hardware interaction, and core OS concepts like bootloaders, memory management, and basic kernel functionality.

Key Features
Bootloader: Handles the initial boot process (may use GRUB or a custom one).

Kernel: Basic monolithic kernel with interrupt handling.

Memory Management: Simple paging/memory allocation.

Basic Drivers: Keyboard/screen input-output (text-based).

Shell: Minimal command-line interface (if implemented).

Technologies Used
Language: Primarily C (kernel) + Assembly (boot/bare-metal parts).

Tools: GCC, NASM, QEMU (for emulation), Make (build automation).

How to Build/Run
-> Build & run via QEMU: (make run)

Future Goals
Add multitasking (basic scheduler).

Implement a simple filesystem.

Support more hardware (e.g., mouse, disk).
