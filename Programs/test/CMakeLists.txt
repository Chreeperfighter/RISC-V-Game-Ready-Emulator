cmake_minimum_required(VERSION 3.20)
project(test C ASM)

set(CMAKE_C_STANDARD 11)

set(SOURCES
        video_test.c
)

add_executable(test ${SOURCES} ${RISCV_STARTUP_FILE})
set_target_properties(test PROPERTIES OUTPUT_NAME "test.elf")

# KISS - Just the basics that actually work
target_link_options(test PRIVATE
        -march=rv32i
        -mabi=ilp32
        -nostartfiles
        -T${CMAKE_CURRENT_SOURCE_DIR}/../linker.ld
)

# Add semihosting library AFTER other flags
target_link_libraries(test PRIVATE
        -Wl,--start-group
        -lc
        -lgloss
        -Wl,--end-group
        -lgcc
)

add_custom_command(TARGET test POST_BUILD
        COMMAND ${CMAKE_OBJDUMP} -d $<TARGET_FILE:test> > ${CMAKE_CURRENT_BINARY_DIR}/test.dis
        COMMENT "Creating disassembly"
        VERBATIM
)