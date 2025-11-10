# =============================
# RISC-V RV32I Toolchain
# =============================

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv)

# RISC-V toolchain binaries
set(CMAKE_C_COMPILER /opt/homebrew/bin/riscv64-unknown-elf-gcc)
set(CMAKE_CXX_COMPILER /opt/homebrew/bin/riscv64-unknown-elf-g++)
set(CMAKE_ASM_COMPILER /opt/homebrew/bin/riscv64-unknown-elf-gcc)
set(CMAKE_OBJDUMP /opt/homebrew/bin/riscv64-unknown-elf-objdump)

# Toolchain lib path
set(RISCV_LIB /opt/homebrew/Cellar/riscv-gnu-toolchain/main/riscv64-unknown-elf/lib/rv32i/ilp32)

# Global architecture flags (as separate list items)
set(RISCV_ARCH_FLAGS -march=rv32i -mabi=ilp32)

# Base compiler/assembler flags
set(CMAKE_C_FLAGS_INIT "-march=rv32i -mabi=ilp32 -std=gnu11")
set(CMAKE_ASM_FLAGS_INIT "-march=rv32i -mabi=ilp32")

# Startup file
set(RISCV_STARTUP_FILE "${CMAKE_CURRENT_LIST_DIR}/start.S")

# Debug flags
set(CMAKE_C_FLAGS_DEBUG "-O0 -g3 -ggdb -fno-omit-frame-pointer -Wall -Wextra" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_DEBUG "-O0 -g3 -ggdb" CACHE STRING "" FORCE)

# Release flags
set(CMAKE_C_FLAGS_RELEASE "-O2 -DNDEBUG" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_RELEASE "-O2" CACHE STRING "" FORCE)

# Check that startup file exists
if(NOT EXISTS "${RISCV_STARTUP_FILE}")
    message(WARNING "Startup file not found at ${RISCV_STARTUP_FILE}. Make sure start.S exists.")
endif()

# Check that libgloss exists
find_library(LIBGLOSS NAMES gloss PATHS "${RISCV_LIB}" NO_DEFAULT_PATH)
if(NOT LIBGLOSS)
    message(WARNING "libgloss not found in ${RISCV_LIB}. Semihosting may not work.")
endif()

# Root paths
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Prevent CMake test compile from failing
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
