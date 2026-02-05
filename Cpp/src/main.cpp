//
// Created by Mark Verbeek on 18.10.25.
//

#include "Display.hpp"
#include "ELFLoader.hpp"
#include "RV32.hpp"
#include "Input.hpp"
#include "RV32Debugger.hpp"

#include <atomic>
#include <thread>
#include <chrono>
#include <iostream>

#define FPS 60
#define FRAME_TIME_US (1000000 / FPS)
#define PERF_MONITOR false  // Toggle performance monitoring here

using namespace std::chrono;

std::atomic<bool> running(true);
std::atomic<uint64_t> instructions_executed(0);

// ==============================
//           CPU Thread
// ==============================
void step_cpu(RV32 &cpu, RV32Debugger &dbg) {
    while (cpu.running && running.load()) {
        cpu.step();
        if (PERF_MONITOR) {
            instructions_executed.fetch_add(1, std::memory_order_relaxed);
        }
        // std::cout << "0x" << std::hex << cpu.get_pc() << std::endl;
        if (cpu.breakpoint_hit) {
            dbg.on_breakpoint();
        }
    }
    running.store(false);
}

int main() {
    RV32 cpu(true, true);
    Display display(cpu);
    display.init_display();

    Input input(cpu, display);

    ELFLoader elf_loader;
    elf_loader.parse("/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/RV32DOOM/cmake-build-release-rv32i/RV32DOOM");
    RV32Debugger debugger(cpu, elf_loader);
    std::vector<ELFSection> sections = elf_loader.get_sections();
    for (const auto& section : sections) {
        std::cout <<
            "Name: " << section.name <<
                ", Adress: " << section.address <<
                    ", Type: " << section.type <<
                        ", Size: " << section.size <<
                            std::endl;
        cpu.load_section(section);
    }
    cpu.set_entry(elf_loader.get_entry());
    std::thread cpu_thread(step_cpu, std::ref(cpu), std::ref(debugger));

    auto last_frame = steady_clock::now();
    auto perf_start = steady_clock::now();
    uint64_t last_inst_count = 0;

    // ==============================
    //          Main Thread
    // ==============================
    while (running.load()) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running.store(false);
                break;
            }
            input.process_event(event);
        }
        auto current_time = steady_clock::now();
        auto next_frame = last_frame + microseconds(FRAME_TIME_US);
        if (current_time >= next_frame) {
            last_frame = next_frame;
            display.update_display();

            // Performance monitoring (once per second)
            if (PERF_MONITOR) {
                auto elapsed = duration_cast<milliseconds>(current_time - perf_start).count();
                if (elapsed >= 1000) {
                    uint64_t current_inst = instructions_executed.load(std::memory_order_relaxed);
                    uint64_t inst_delta = current_inst - last_inst_count;
                    double mips = inst_delta / (elapsed / 1000.0) / 1000000.0;
                    std::cout << "MIPS: " << mips << " (" << inst_delta << " inst in " << elapsed << "ms)" << std::endl;

                    last_inst_count = current_inst;
                    perf_start = current_time;
                }
            }
        } else {
            std::this_thread::sleep_until(next_frame);
        }

    }
    cpu_thread.join();
    display.cleanup_display();
}