//
// Created by Mark Verbeek on 18.10.25.
//

#include <iostream>

#include "ELFLoader.hpp"
#include "RV32.hpp"

int main() {
    RV32 cpu(true, true);
    ELFLoader elf;
    elf.parse("/Users/mark.verbeek/Data/Projects/RISC-V-Game-Ready-Emulator/Programs/test/video_test.elf");
    std::vector<ELFSection> sections = elf.get_sections();
    for (const auto& section : sections) {
        std::cout <<
            "Name: " << section.name <<
                ", Address: " << section.address <<
                    ", Size: " << section.size <<
                        std::endl;
        cpu.load_section(section);
    }
    cpu.set_entry(elf.get_entry());
    cpu.step();
}