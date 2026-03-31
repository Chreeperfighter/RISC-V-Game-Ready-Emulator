cmake_minimum_required(VERSION 4.1)
project(RV32_C64 C CXX ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 20)

add_subdirectory(../common common)

add_executable(RV32_C64
        ${STARTUP_FILES}
        src/1541d64.cpp
        src/1541fs.cpp
        src/1541gcr.cpp
        src/1541t64.cpp
        src/C64.cpp
        src/Cartridge.cpp
        src/CIA.cpp
        src/CPU1541.cpp
        src/CPU_common.cpp
        src/CPUC64.cpp
        src/Display.cpp
        src/IEC.cpp
        src/main.cpp
        src/Prefs.cpp
        src/REU.cpp
        src/SID.cpp
        src/Tape.cpp
        src/VIA.cpp
        src/VIC.cpp
)

target_include_directories(RV32_C64 PRIVATE src ../common)
target_link_libraries(RV32_C64 rv32_common m)