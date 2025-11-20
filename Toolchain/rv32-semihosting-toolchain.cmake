# RV32 Semihosting Toolchain for CMake
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv32)

# Compiler settings
set(CMAKE_C_COMPILER riscv64-unknown-elf-gcc)
set(CMAKE_CXX_COMPILER riscv64-unknown-elf-g++)
set(CMAKE_ASM_COMPILER riscv64-unknown-elf-gcc)

# Get the directory where this toolchain file is located
set(TOOLCHAIN_DIR "${CMAKE_CURRENT_LIST_DIR}")

# Common flags for RV32I with semihosting
set(ARCH_FLAGS "-march=rv32i -misa-spec=2.2 -mno-fence-tso -mabi=ilp32 -mno-csr-check")
set(COMMON_FLAGS "${ARCH_FLAGS} -Wall -g")

# Set flags
set(CMAKE_C_FLAGS_INIT "${COMMON_FLAGS}")
set(CMAKE_CXX_FLAGS_INIT "${COMMON_FLAGS}")
set(CMAKE_ASM_FLAGS_INIT "${ARCH_FLAGS}")

# Linker flags
set(CMAKE_EXE_LINKER_FLAGS_INIT "-nostartfiles -specs=semihost.specs -T${TOOLCHAIN_DIR}/linker.ld")

# Don't search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Startup files
set(STARTUP_FILES
    ${TOOLCHAIN_DIR}/_exit.S
    ${TOOLCHAIN_DIR}/start.S
)
