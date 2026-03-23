//
// Created by Mark Verbeek on 18.10.25.
//

#include "Display.hpp"
#include "ELFLoader.hpp"
#include "RV32.hpp"
#include "Input.hpp"
#include "RV32Debugger.hpp"
#include "Config.hpp"
#include "Audio.hpp"

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

    RV32 cpu(true, true);
    Display display(cpu);
    display.init_display();
    Audio audio{};
    cpu.set_audio(audio);

    Input input(cpu, display);

    ELFLoader elf_loader;
    elf_loader.parse(g_config.binary_path);
    RV32Debugger debugger(cpu);
    std::vector<ELFSection> sections = elf_loader.get_sections();
    for (const auto &section: sections) {
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

    auto perf_start = steady_clock::now();
    uint64_t last_inst_count = 0;

    // ==============================
    //          Main Thread
    // ==============================
    // Vsync (SDL_RENDERER_PRESENTVSYNC) drives the frame rate — update_display()
    // blocks until the next vertical blank. We drain the SDL event queue both
    // before and after the present so events that arrived during the vsync wait
    // are picked up immediately rather than sitting until the next frame.
    auto poll_events = [&]() {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (input.process_event(event)) {
                running.store(false);
            }
        }
    };

    while (running.load(std::memory_order_relaxed)) {
        poll_events();                // drain before render
        display.update_display();    // blocks on vsync ~16ms
        poll_events();                // drain events that arrived during vsync

        if (g_config.perf_monitor) {
            auto now = steady_clock::now();
            auto elapsed = duration_cast<milliseconds>(now - perf_start).count();
            if (elapsed >= 1000) {
                uint64_t current_inst = cpu.get_cycles();
                uint64_t inst_delta = current_inst - last_inst_count;
                double mips = inst_delta / (elapsed / 1000.0) / 1000000.0;
                std::cout << "MIPS: " << mips << " (" << inst_delta << " inst in " << elapsed << "ms)" << std::endl;
                last_inst_count = current_inst;
                perf_start = now;
            }
        }
    }
    cpu_thread.join();
    display.cleanup_display();
}