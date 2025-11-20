cmake_minimum_required(VERSION 3.20)

project(Test C ASM)

# Add your executable
add_executable(test
        video_test.c
        ${STARTUP_FILES}
)

# Optional: add more flags per target
target_compile_options(test PRIVATE -O2)

# Generate disassembly file after build
add_custom_command(TARGET test POST_BUILD
        COMMAND ${CMAKE_OBJDUMP} -d -S "$<TARGET_FILE:test>" > "$<TARGET_FILE:test>.dis"
        COMMENT "Generating disassembly: test.dis"
        VERBATIM
)
