cmake_minimum_required(VERSION 3.30)
project(Peanut_GB_RV32 C ASM)

set(CMAKE_C_STANDARD 99)

add_subdirectory(../common common)

add_executable(Peanut_GB_RV32
        main.c
        ${STARTUP_FILES}
)

target_link_libraries(Peanut_GB_RV32 rv32_common m)
