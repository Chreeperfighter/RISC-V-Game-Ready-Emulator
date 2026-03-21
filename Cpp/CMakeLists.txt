cmake_minimum_required(VERSION 3.30)
project(Cpp)

set(CMAKE_CXX_STANDARD 20)

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

set(EMULATOR_DEBUG OFF CACHE BOOL "Enable source-level debugger" FORCE)

find_package(SDL2 REQUIRED)

find_library(LIBDWARF_LIB dwarf HINTS /opt/homebrew/lib /usr/local/lib REQUIRED)
find_path(LIBDWARF_INCLUDE libdwarf.h HINTS /opt/homebrew/include/libdwarf-2 /usr/local/include/libdwarf-2 REQUIRED)

add_executable(Cpp
        # Sources
        src/main.cpp
        src/RV32.cpp
        src/Input.cpp
        src/RV32Debugger.cpp
        src/ELFLoader.cpp
        src/DWARFReader.cpp
        src/Display.cpp
        src/FileHandle.cpp
        src/Config.cpp
        src/Audio.cpp
        inc/Audio.hpp
)

target_include_directories(Cpp PRIVATE
        ${CMAKE_SOURCE_DIR}/inc
        ${SDL2_INCLUDE_DIRS}
        ${LIBDWARF_INCLUDE}
        toml11/include
)

if(EMULATOR_DEBUG)
    target_compile_definitions(Cpp PRIVATE EMULATOR_DEBUG)
endif()

target_link_libraries(Cpp
    ${SDL2_LIBRARIES}
    ${LIBDWARF_LIB}
)