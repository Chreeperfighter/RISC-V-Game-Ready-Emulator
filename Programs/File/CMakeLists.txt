cmake_minimum_required(VERSION 3.30)
project(File C ASM)

set(CMAKE_C_STANDARD 11)

add_executable(File
        src/main.c
        ${STARTUP_FILES}
        inc/syscalls.h
)

target_include_directories(File PRIVATE inc)

# Add a custom command to produce File.dis
add_custom_command(
        OUTPUT File.dis
        COMMAND ${CMAKE_OBJDUMP} -d $<TARGET_FILE:File> > File.dis
        DEPENDS File
        COMMENT "Disassembling File"
        VERBATIM
)

# Attach the custom command to a custom target
add_custom_target(disassemble
        DEPENDS File.dis
        COMMENT "Generating disassembly for File"
)
