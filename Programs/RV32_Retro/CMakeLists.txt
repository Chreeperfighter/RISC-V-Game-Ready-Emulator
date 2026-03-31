cmake_minimum_required(VERSION 4.1)
project(RV32_Retro C CXX ASM)

set(CMAKE_C_STANDARD 99)

add_subdirectory(../common common)

add_executable(RV32_Retro
        main.c
        ${STARTUP_FILES}
        # snes9x2002 core (non-ARM path, matches Makefile.common)
        snes9x2002/src/apu.c
        snes9x2002/src/apuaux.c
        snes9x2002/src/c4.c
        snes9x2002/src/c4emu.c
        snes9x2002/src/cheats.c
        snes9x2002/src/cheats2.c
        snes9x2002/src/clip.c
        snes9x2002/src/cpu.c
        snes9x2002/src/cpuexec.c
        snes9x2002/src/cpuops.c
        snes9x2002/src/data.c
        snes9x2002/src/dma.c
        snes9x2002/src/dsp1.c
        snes9x2002/src/fxemu.c
        snes9x2002/src/fxinst.c
        snes9x2002/src/globals.c
        snes9x2002/src/memmap.c
        snes9x2002/src/sa1.c
        snes9x2002/src/sa1cpu.c
        snes9x2002/src/sdd1.c
        snes9x2002/src/sdd1emu.c
        snes9x2002/src/snapshot.c
        snes9x2002/src/soundux.c
        snes9x2002/src/spc700.c
        snes9x2002/src/srtc.c
        # non-ARM rendering path
        snes9x2002/src/ppu_.c
        snes9x2002/src/gfx.c
        snes9x2002/src/tile.c
        # libretro glue
        snes9x2002/libretro/libretro.c
        snes9x2002/libretro/libretro-common/streams/memory_stream.c
)

target_include_directories(RV32_Retro PRIVATE
        snes9x2002/src
        snes9x2002/libretro
        snes9x2002/libretro/libretro-common/include
        ../common
)

target_compile_options(RV32_Retro PRIVATE
        $<$<COMPILE_LANGUAGE:C>:-ffast-math -fomit-frame-pointer>
)

target_compile_definitions(RV32_Retro PRIVATE
        HAVE_STRINGS_H
        HAVE_STDINT_H
        HAVE_INTTYPES_H
        __LIBRETRO__
        USE_SA1
        LAGFIX
        __OLD_RASTER_FX__
)

set_source_files_properties(
        snes9x2002/src/gfx.c
        PROPERTIES COMPILE_OPTIONS "-Wno-incompatible-pointer-types"
)

set_source_files_properties(
        snes9x2002/src/ppu_.c
        PROPERTIES COMPILE_OPTIONS "-Wno-implicit-function-declaration"
)

target_compile_options(RV32_Retro PRIVATE -fno-function-sections -fno-data-sections)
target_link_options(RV32_Retro PRIVATE -Wl,--no-gc-sections)
target_link_options(RV32_Retro PRIVATE -Wl,-u,_gettimeofday)
target_link_libraries(RV32_Retro -Wl,--start-group rv32_common m -Wl,--end-group)