cmake_minimum_required(VERSION 3.30)
project(Cpp)

set(CMAKE_CXX_STANDARD 14)

# Use ARM Homebrew on Apple Silicon
if(APPLE)
    # Check if we're on Apple Silicon
    if(CMAKE_SYSTEM_PROCESSOR MATCHES "arm64")
        set(CMAKE_PREFIX_PATH "/opt/homebrew" ${CMAKE_PREFIX_PATH})
        include_directories(/opt/homebrew/include)
        link_directories(/opt/homebrew/lib)
    else()
        # Intel Mac (x86)
        set(CMAKE_PREFIX_PATH "/usr/local" ${CMAKE_PREFIX_PATH})
        include_directories(/usr/local/include)
        link_directories(/usr/local/lib)
    endif()
endif()

find_package(SDL2 REQUIRED)

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

target_include_directories(Cpp PRIVATE
        ${CMAKE_SOURCE_DIR}/inc
        ${SDL2_INCLUDE_DIRS}
)

target_link_libraries(Cpp
    ${SDL2_LIBRARIES}
)