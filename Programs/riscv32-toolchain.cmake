# =============================
#  RISC-V RV32I Toolchain file
# =============================

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv)

set(CMAKE_C_COMPILER riscv64-unknown-elf-gcc)
set(CMAKE_ASM_COMPILER riscv64-unknown-elf-gcc)

# Common flags for both
set(RV32_COMMON_FLAGS "-march=rv32i -mabi=ilp32")

# Base flags
set(CMAKE_C_FLAGS "${RV32_COMMON_FLAGS}")
set(CMAKE_ASM_FLAGS "${RV32_COMMON_FLAGS}")

# Build-type-specific flags (OVERRIDE CMake defaults)
# ---------------------------------------------------
# Debug: full symbols, absolutely no optimization
set(RV32_DEBUG_FLAGS "-O0 -g3 -ggdb -fno-omit-frame-pointer -Wall -Wextra")

# Release: maximum performance, safe optimizations for RV32I
# -O3: aggressive optimization
# -funroll-loops: unrolls where beneficial
# -fno-tree-vectorize: disable pointless vectorization (RV32I has no SIMD)
# -fdata-sections / -ffunction-sections + --gc-sections: remove unused code
# -DNDEBUG: disable assert() and similar
# -fno-builtin: prevent compiler from replacing code with builtin functions
# -ffreestanding: this is bare-metal, no hosted environment
set(RV32_RELEASE_FLAGS "-O3")

# Apply flags
set(CMAKE_C_FLAGS_DEBUG "${RV32_DEBUG_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELEASE "${RV32_RELEASE_FLAGS}" CACHE STRING "" FORCE)

set(CMAKE_ASM_FLAGS_DEBUG "${RV32_DEBUG_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS_RELEASE "${RV32_RELEASE_FLAGS}" CACHE STRING "" FORCE)

# Linker flags
set(CMAKE_EXE_LINKER_FLAGS "-T${CMAKE_SOURCE_DIR}/../linker.ld -nostartfiles ${RV32_COMMON_FLAGS}")
