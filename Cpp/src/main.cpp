//
// Created by Mark Verbeek on 18.10.25.
//

#include "Display.hpp"
#include "ELFLoader.hpp"
#include "RV32.hpp"
#include "Input.hpp"

#include <atomic>
#include <thread>
#include <chrono>

#define FPS 60
#define FRAME_TIME_US (1000000 / FPS)

using namespace std::chrono;

std::atomic<bool> running(true);

// ==============================
//           CPU Thread
// ==============================
void step_cpu(RV32 &cpu) {
    while (cpu.running && running.load()) {
        cpu.step();
    }
    running.store(false);
}

int main() {
    RV32 cpu(true, true);
    Display display(cpu);
    display.init_display();

    Input input(cpu, display);

    ELFLoader elf;
    elf.parse("/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/FrambufferTest/cmake-build-rv32i-release/FrambufferTest");
    std::vector<ELFSection> sections = elf.get_sections();
    for (const auto& section : sections) {
        cpu.load_section(section);
    }
    cpu.set_entry(elf.get_entry());
    std::thread cpu_thread(step_cpu, std::ref(cpu));

    auto last_frame = steady_clock::now();

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
        } else {
            std::this_thread::sleep_until(next_frame);
        }

    }
    cpu_thread.join();
    display.cleanup_display();
}