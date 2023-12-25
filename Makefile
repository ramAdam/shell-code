# Makefile for compiling and linking assembly code

# Compiler and linker options
AS = nasm
ASFLAGS = -f elf64
LD = ld
LDFLAGS = -m elf_x86_64
OBJCOPY = objcopy
CC = gcc
CFLAGS = -m64 -fno-stack-protector -z execstack

# Source files
ASM_SRC = setreuid.asm
C_SRC = shellcode.c

# Output files
OUT = setreuid
SHELLCODE_OUT = shellcode.bin
C_OUT = shellcode_program

# Default target
all: $(OUT) $(C_OUT)

# Compile and link the assembly file
$(OUT): $(ASM_SRC)
	$(AS) $(ASFLAGS) $(ASM_SRC) -o $(OUT).o
	$(LD) $(LDFLAGS) $(OUT).o -o $(OUT)

# Compile the C file
$(C_OUT): $(C_SRC)
	$(CC) $(CFLAGS) $(C_SRC) -o $(C_OUT)

# Extract shell code
extract_shellcode:
	$(OBJCOPY) -O binary -j .text $(OUT) $(SHELLCODE_OUT)

# Clean the generated files
clean:
	rm -f $(OUT) $(OUT).o $(SHELLCODE_OUT) $(C_OUT)
# Compile a C file
compile_c: $(C_SRC)
	$(CC) $(CFLAGS) $(C_SRC) -o $(C_OUT)
