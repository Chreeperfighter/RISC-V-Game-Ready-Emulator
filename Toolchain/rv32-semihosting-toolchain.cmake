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
set(ARCH_FLAGS "-march=rv32im -misa-spec=2.2 -mno-fence-tso -mabi=ilp32 -mno-csr-check")
set(COMMON_FLAGS "${ARCH_FLAGS} -Wall -ffunction-sections -fdata-sections")

# Debug flags
set(CMAKE_C_FLAGS_DEBUG_INIT "${COMMON_FLAGS} -gdwarf-5 -g -O0")
set(CMAKE_CXX_FLAGS_DEBUG_INIT "${COMMON_FLAGS} -gdwarf-5 -g -O0")

# Release flags
set(CMAKE_C_FLAGS_RELEASE_INIT "${COMMON_FLAGS} -O2 -DNDEBUG -flto=auto")
set(CMAKE_CXX_FLAGS_RELEASE_INIT "${COMMON_FLAGS} -O2 -DNDEBUG -flto=auto")

# RelWithDebInfo flags (optimized with debug symbols)
set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "${COMMON_FLAGS} -gdwarf-5 -g -O2 -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "${COMMON_FLAGS} -gdwarf-5 -g -O2 -DNDEBUG")

# MinSizeRel flags
set(CMAKE_C_FLAGS_MINSIZEREL_INIT "${COMMON_FLAGS} -Os -DNDEBUG -flto=auto")
set(CMAKE_CXX_FLAGS_MINSIZEREL_INIT "${COMMON_FLAGS} -Os -DNDEBUG -flto=auto")

# Assembly flags (same for all builds)
set(CMAKE_ASM_FLAGS_INIT "${ARCH_FLAGS}")

# Linker flags (base)
set(CMAKE_EXE_LINKER_FLAGS_INIT "-nostartfiles -specs=semihost.specs -T${TOOLCHAIN_DIR}/linker.ld -Wl,--gc-sections")
# LTO linker flags — appended on top of base flags by CMake, so only add -flto here
set(CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT "-flto=auto")
set(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL_INIT "-flto=auto")
# LTO-aware archiver/ranlib — required for -flto to work across static libraries
set(CMAKE_AR riscv64-unknown-elf-gcc-ar)
set(CMAKE_RANLIB riscv64-unknown-elf-gcc-ranlib)
set(CMAKE_NM riscv64-unknown-elf-gcc-nm)

# Don't search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Startup files
set(STARTUP_FILES
    ${TOOLCHAIN_DIR}/_exit.S
    ${TOOLCHAIN_DIR}/start.S
    ${TOOLCHAIN_DIR}/cxx_support.c
)