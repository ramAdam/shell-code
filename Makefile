# Makefile for compiling and linking assembly code

# Compiler and linker options
AS = nasm
ASFLAGS = -f elf64
LD = ld
LDFLAGS = -m elf_x86_64

# Source file
SRC = setreuid.asm

# Output file
OUT = setreuid

# Default target
all: $(OUT)

# Compile and link the assembly file
$(OUT): $(SRC)
	$(AS) $(ASFLAGS) $(SRC) -o $(OUT).o
	$(LD) $(LDFLAGS) $(OUT).o -o $(OUT)

# Clean the generated files
clean:
	rm -f $(OUT) $(OUT).o
