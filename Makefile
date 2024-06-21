ASM=nasm

SOURCE_DIRECTORY=source
BUILD_DIRECTORY=build

$(BUILD_DIRECTORY)/main_floppy.img: $(BUILD_DIRECTORY)/main.bin
	cp $(BUILD_DIRECTORY)/main.bin $(BUILD_DIRECTORY)/main_floppy.img
	truncate -s 1440k $(BUILD_DIRECTORY)/main_floppy.img
	
$(BUILD_DIRECTORY)/main.bin: $(SOURCE_DIRECTORY)/main.asm
	mkdir -p $(BUILD_DIRECTORY)
	$(ASM) $(SOURCE_DIRECTORY)/main.asm -f bin -o $(BUILD_DIRECTORY)/main.bin
