# =============================
#  RISC-V RV32I Toolchain file
# =============================

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv)

set(CMAKE_C_COMPILER riscv64-unknown-elf-gcc)
set(CMAKE_ASM_COMPILER riscv64-unknown-elf-gcc)

# === Flags identical to your manual command ===
set(RV32_COMMON_FLAGS "-march=rv32i -mabi=ilp32 -O3 -g")

# C and ASM compile flags
set(CMAKE_C_FLAGS "${RV32_COMMON_FLAGS}")
set(CMAKE_ASM_FLAGS "${RV32_COMMON_FLAGS}")

# Linker flags
set(CMAKE_EXE_LINKER_FLAGS "-T${CMAKE_SOURCE_DIR}/../linker.ld -nostartfiles -W ${RV32_COMMON_FLAGS}")
