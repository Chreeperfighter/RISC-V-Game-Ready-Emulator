cmake_minimum_required(VERSION 3.30)
project(test C ASM)

set(CMAKE_C_STANDARD 11)

# Add executable
add_executable(test
        ../start.S
        main.c
)

set_target_properties(test PROPERTIES OUTPUT_NAME "test.elf")

add_custom_command(TARGET test POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O binary test.elf test.bin
        COMMENT "Converting ELF to raw binary (test.bin)"
)

add_custom_command(TARGET test POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O binary test.elf test.bin
        COMMAND riscv64-unknown-elf-objdump -d test.elf > test.dis
        COMMENT "Creating raw binary and disassembly"
)
