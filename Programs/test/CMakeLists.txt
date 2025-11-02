cmake_minimum_required(VERSION 3.30)
project(test C ASM)

set(CMAKE_C_STANDARD 11)

# Sources
set(SOURCES
        ../start.S
        main.c
        display.h
        timer.h
        keyboard.h
        MinecraftRegular_Bmg3.h
        SDL_scancode.h
        mouse.h
        mouse_test.c
)

# Build executable
add_executable(test ${SOURCES})
set_target_properties(test PROPERTIES OUTPUT_NAME "test.elf")

# -----------------------------
# Generate assembly for each .c file
# -----------------------------
set(ASM_TARGETS "")
foreach(src ${SOURCES})
    if(${src} MATCHES ".c$")
        get_filename_component(base ${src} NAME_WE)
        set(asm_file ${CMAKE_BINARY_DIR}/${base}.s)

        add_custom_command(
                OUTPUT ${asm_file}
                COMMAND ${CMAKE_C_COMPILER} -O2 -g -fverbose-asm -S ${CMAKE_SOURCE_DIR}/${src} -o ${asm_file}
                DEPENDS ${CMAKE_SOURCE_DIR}/${src}
                COMMENT "Generating assembly for ${src}"
        )

        add_custom_target(asm_${base} DEPENDS ${asm_file})
        list(APPEND ASM_TARGETS asm_${base})
    endif()
endforeach()

# Make the ELF build depend on all asm targets
add_dependencies(test ${ASM_TARGETS})


# -----------------------------
# Post-build: binary + disassembly
# -----------------------------
add_custom_command(TARGET test POST_BUILD
        COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:test> test.bin
        COMMAND riscv64-unknown-elf-objdump -d $<TARGET_FILE:test> > test.dis
        COMMENT "Converting ELF to raw binary and creating disassembly"
)
