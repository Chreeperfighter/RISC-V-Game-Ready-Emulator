cmake_minimum_required(VERSION 3.30)
project(WireWorld C ASM)

set(CMAKE_C_STANDARD 11)

# Convert cells_data.bin to cells_data.o
add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/cells_data.o
        COMMAND riscv64-unknown-elf-objcopy -I binary -O elf32-littleriscv
        --rename-section .data=.rodata,alloc,load,readonly,data,contents
        ${CMAKE_CURRENT_SOURCE_DIR}/cells_data.bin
        ${CMAKE_CURRENT_BINARY_DIR}/cells_data.o
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/cells_data.bin
        COMMENT "Converting cells_data.bin to RV32 object file"
        VERBATIM
)

# Create a custom target for the object file
add_custom_target(cells_data_target DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/cells_data.o)

add_executable(WireWorld
        src/main.c
        ${STARTUP_FILES}
        inc/syscalls.h
        inc/graphics.h
)

target_include_directories(WireWorld PRIVATE inc)

# Link the object file properly
add_dependencies(WireWorld cells_data_target)
target_link_options(WireWorld PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/cells_data.o)

# Add a custom command to produce WireWorld.dis
add_custom_command(
        OUTPUT WireWorld.dis
        COMMAND ${CMAKE_OBJDUMP} -d $<TARGET_FILE:WireWorld> > WireWorld.dis
        DEPENDS WireWorld
        COMMENT "Disassembling WireWorld"
        VERBATIM
)

# Attach the custom command to a custom target
add_custom_target(disassemble
        DEPENDS WireWorld.dis
        COMMENT "Generating disassembly for WireWorld"
)
