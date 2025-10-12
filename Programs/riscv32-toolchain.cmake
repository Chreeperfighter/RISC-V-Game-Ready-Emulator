# =============================
#  RISC-V RV32I Toolchain file
# =============================

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv)

set(CMAKE_C_COMPILER riscv64-unknown-elf-gcc)
set(CMAKE_ASM_COMPILER riscv64-unknown-elf-gcc)

# === Flags identical to your manual command ===
set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/../linker.ld")

set(RV32_FLAGS "-march=rv32i -mabi=ilp32 -nostdlib -O2 -T${LINKER_SCRIPT}")

set(CMAKE_C_FLAGS "${RV32_FLAGS}")
set(CMAKE_ASM_FLAGS "${RV32_FLAGS}")
