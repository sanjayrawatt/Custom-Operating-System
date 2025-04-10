# 🖥️ Custom Operating System (OS)

Welcome to **Custom OS**, a minimalist operating system built entirely from scratch as a hands-on learning project. This OS is designed to explore the world of **low-level system programming**, **hardware interaction**, and **core OS concepts** like bootloaders, memory management, and basic kernel development.

---

## ⚙️ Key Features

- 🧹 **Bootloader** – Handles the initial boot process (custom or GRUB-based).  
- 🧠 **Kernel** – A monolithic kernel with basic interrupt handling.  
- 🧮 **Memory Management** – Implements simple paging and memory allocation techniques.  
- 🎹 **Basic Drivers** – Text-based I/O support for keyboard and screen.  
- 💻 **Shell (Optional)** – A minimal CLI interface for command execution.

---

## 🧰 Technologies Used

- **Languages:** C (for kernel logic), Assembly (for boot & low-level operations)  
- **Tools:** GCC, NASM, QEMU (emulator), Make (build automation)  
- **Platform:** x86 (32-bit)

---

## 🛠️ Getting Started

### ✅ Prerequisites

- GCC (cross-compiler recommended)  
- NASM (assembler)  
- QEMU (for virtualization)  
- Make

---

### 📥 Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/custom-os.git
   cd custom-os

2. **Build and run the OS with QEMU:**
   ```bash
   make run
### 🎯 Future Goals

- 🧵 Multitasking – Introduce a basic process scheduler.
- 📁 Filesystem – Develop a simple custom filesystem for file operations.  
- 🖱️ Hardware Support – Add drivers for mouse, disk, and other peripherals.  
- 🧪 Testing Framework – Add basic unit tests for kernel components.

---
