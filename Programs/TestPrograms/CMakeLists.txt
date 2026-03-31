cmake_minimum_required(VERSION 3.30)
project(TestPrograms C CXX ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

add_subdirectory(../common common)

# Only compile your main.c - PureDOOM.h is header-only
add_executable(TestPrograms
        main.c
        ${STARTUP_FILES}
        # main.cpp
)
target_link_libraries(TestPrograms rv32_common m)

add_executable(TimingTest
        ${STARTUP_FILES}
        timing_test.c
)
target_link_libraries(TimingTest rv32_common m)