cmake_minimum_required(VERSION 3.30)
project(RV32DOOM C ASM)

set(CMAKE_C_STANDARD 11)

add_compile_definitions(
        DOOM_IMPLEMENT_PRINT
        DOOM_IMPLEMENT_MALLOC
        DOOM_IMPLEMENT_EXIT
        DOOM_WIN32
)

# Only compile your main.c - PureDOOM.h is header-only
set(SRC_DOOM
        main.c
        ${STARTUP_FILES}
)

add_executable(RV32DOOM ${SRC_DOOM})
target_link_libraries(RV32DOOM m)

# Add a custom command to produce RV32DOOM.dis
add_custom_command(
        OUTPUT RV32DOOM.dis
        COMMAND ${CMAKE_OBJDUMP} -d $<TARGET_FILE:RV32DOOM> > RV32DOOM.dis
        DEPENDS RV32DOOM
        COMMENT "Disassembling RV32DOOM"
        VERBATIM
)

# Attach the custom command to a custom target
add_custom_target(disassemble
        DEPENDS RV32DOOM.dis
        COMMENT "Generating disassembly for RV32DOOM"
)
