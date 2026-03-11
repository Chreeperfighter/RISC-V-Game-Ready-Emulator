cmake_minimum_required(VERSION 3.30)
project(TestPrograms C ASM)

set(CMAKE_C_STANDARD 11)

# Only compile your main.c - PureDOOM.h is header-only
add_executable(TestPrograms
        main.c
        ${STARTUP_FILES}
)
target_link_libraries(TestPrograms m)