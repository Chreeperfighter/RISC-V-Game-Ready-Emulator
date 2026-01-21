cmake_minimum_required(VERSION 3.30)
project(WireWorld C ASM)

set(CMAKE_C_STANDARD 11)

add_executable(WireWorld
        src/main.c
        ${STARTUP_FILES}
        inc/syscalls.h
        inc/graphics.h
)

target_include_directories(WireWorld PRIVATE inc)

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
