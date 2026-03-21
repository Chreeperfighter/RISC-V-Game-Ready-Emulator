cmake_minimum_required(VERSION 4.1)
project(common C)

set(CMAKE_C_STANDARD 11)

add_library(rv32_common STATIC
        rv32_display.c
        rv32_input.c
        rv32_time.c
        rv32_dirent.c
        rv32_file.c
        rv32_file.h
        rv32_audio.c
        rv32_audio.h
)
target_include_directories(rv32_common PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
