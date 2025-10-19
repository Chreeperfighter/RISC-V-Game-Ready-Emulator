cmake_minimum_required(VERSION 3.30)
project(Cpp)

set(CMAKE_CXX_STANDARD 14)

add_executable(Cpp
        # Sources
        src/main.cpp
        src/RV32.cpp

        # Headers (optional)
        inc/RV32.hpp
        inc/config.hpp
        inc/ISA.hpp
        inc/Syscall.hpp
        inc/Registers.hpp
)

target_include_directories(Cpp PRIVATE ${CMAKE_SOURCE_DIR}/inc)