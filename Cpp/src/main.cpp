//
// Created by Mark Verbeek on 18.10.25.
//

#include "Display.hpp"
#include "ELFLoader.hpp"
#include "RV32.hpp"
#include "Input.hpp"
#include "RV32Debugger.hpp"
#include "Config.hpp"

#include <atomic>
#include <thread>
#include <chrono>
#include <iostream>

using namespace std::chrono;

std::atomic<bool> running(true);

// ==============================
//           CPU Thread
// ==============================
void step_cpu(RV32 &cpu, RV32Debugger &dbg) {
    while (cpu.running && running.load(std::memory_order_relaxed)) {
        for (int i = 0; i < 1000 && cpu.running; i++) {
            cpu.step();
#ifdef EMULATOR_DEBUG
            if (cpu.trap != TrapReason::None || dbg.should_break()) {
                dbg.on_trap();
                cpu.trap = TrapReason::None;
            }
#endif
        }
    }
    if (cpu.trap != TrapReason::None) {
        std::cerr << cpu.trap_message << "\n";
    }
    running.store(false);
}

int main() {
    g_config = Config::load("/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Cpp/config/config.toml");
    std::string base_dir = g_config.storage_path;
    RV32 cpu(true, true, base_dir);
    Display display(cpu);
    display.init_display();

    Input input(cpu, display);

    ELFLoader elf_loader;
    elf_loader.parse(g_config.binary_path);
    RV32Debugger debugger(cpu);
    std::vector<ELFSection> sections = elf_loader.get_sections();
    for (const auto& section : sections) {
#ifdef EMULATOR_DEBUG
        std::cout <<
           "Name: " << section.name <<
               ", Adress: " << section.address <<
                   ", Type: " << section.type <<
                       ", Size: " << section.size <<
                           std::endl;
#endif
        cpu.load_section(section);
    }
    cpu.set_entry(elf_loader.get_entry());
    std::thread cpu_thread(step_cpu, std::ref(cpu), std::ref(debugger));

    auto last_frame = steady_clock::now();
    auto perf_start = steady_clock::now();
    uint64_t last_inst_count = 0;
    const auto frame_duration = microseconds(1000000 / g_config.fps);

    // ==============================
    //          Main Thread
    // ==============================
    while (running.load(std::memory_order_relaxed)) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running.store(false);
                break;
            }
            input.process_event(event);
        }
        auto current_time = steady_clock::now();
        auto next_frame = last_frame + frame_duration;
        if (current_time >= next_frame) {
            last_frame = next_frame;
            display.update_display();

            // Performance monitoring (once per second)
            if (g_config.perf_monitor) {
                auto elapsed = duration_cast<milliseconds>(current_time - perf_start).count();
                if (elapsed >= 1000) {
                    uint64_t current_inst = cpu.get_cycles();
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