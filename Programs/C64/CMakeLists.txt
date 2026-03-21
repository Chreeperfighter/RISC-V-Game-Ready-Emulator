cmake_minimum_required(VERSION 4.1)
project(C64 C ASM)

set(CMAKE_C_STANDARD 11)

add_subdirectory(../common common)

add_executable(C64
        main.c
        ${STARTUP_FILES}
)

target_link_libraries(C64 rv32_common m)