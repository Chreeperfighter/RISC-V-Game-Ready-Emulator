cmake_minimum_required(VERSION 3.30)
project(FrambufferTest C ASM)

set(CMAKE_C_STANDARD 11)

add_executable(FrambufferTest
        src/main.c
        ${STARTUP_FILES})

add_custom_command(
        OUTPUT FrambufferTest.dis
        COMMAND ${CMAKE_OBJDUMP} -d $<TARGET_FILE:FrambufferTest> > FrambufferTest.dis
        DEPENDS FrambufferTest
        COMMENT "Disassembling FrambufferTest"
        VERBATIM
)

add_custom_target(disassemble ALL
        DEPENDS FrambufferTest.dis
)
