BUILD_DIR = build
BOOTLOADER = $(BUILD_DIR)/bootloader.bin
KERNEL = $(BUILD_DIR)/kernel.bin
DISK_IMG = $(BUILD_DIR)/disk.img

.PHONY: all clean run

all: $(DISK_IMG)

$(DISK_IMG): $(BOOTLOADER) $(KERNEL)
	@echo "Creating disk image..."
	mkdir -p $(BUILD_DIR)
	dd if=/dev/zero of=$@ bs=512 count=2880 2>/dev/null
	mkfs.fat -F 12 -n "MYOS" $@ >/dev/null
	dd if=$(BOOTLOADER) of=$@ conv=notrunc 2>/dev/null
	dd if=$(KERNEL) of=$@ bs=512 seek=33 conv=notrunc 2>/dev/null

$(BOOTLOADER): src/bootloader/boot.asm src/bootloader/disk.asm src/bootloader/print.asm
	@echo "Building bootloader..."
	mkdir -p $(BUILD_DIR)
	nasm -f bin -Isrc/bootloader/ $< -o $@

$(KERNEL): src/kernel/kernel.asm
	@echo "Building kernel..."
	mkdir -p $(BUILD_DIR)
	nasm -f bin -Isrc/bootloader/ $< -o $@  # Critical fix here

run: $(DISK_IMG)
	qemu-system-x86_64 -drive file=$(DISK_IMG),format=raw

clean:
	rm -rf $(BUILD_DIR)/*