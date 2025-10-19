//
// Created by Mark Verbeek on 18.10.25.
//

#include "RV32.hpp"

#include <fstream>
#include <vector>
#include <cstdint>
#include <iostream>
#include <chrono>
#include <thread>

void load_file_into_cpu(RV32& cpu, const std::string& path, const uint32_t start_address) {
    std::ifstream file(path, std::ios::binary | std::ios::ate);
    if (!file) {
        std::cerr << "Failed to open file: " << path << std::endl;
        return;
    }

    const size_t size = file.tellg();
    file.seekg(0, std::ios::beg);

    std::vector<uint8_t> buffer(size);
    if (!file.read(reinterpret_cast<char*>(buffer.data()), static_cast<long>(size))) {
        std::cerr << "Failed to read file: " << path << std::endl;
        return;
    }

    cpu.load_bin(buffer.data(), size, start_address);
}


int main() {
    RV32 rv32i(true, true);
    load_file_into_cpu(rv32i, "/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test/cmake-build-rv32i-release/test.bin", 0);

    auto start = std::chrono::steady_clock::now();
    long long cycles = 0;

    while (rv32i.running) {
        auto now = std::chrono::steady_clock::now();
        const auto elapsed = std::chrono::duration_cast<std::chrono::seconds>(now - start).count();
        if (elapsed > 1) {
            std::cout << "Cycles/s: " << cycles << std::endl;
            start = now;
            cycles = 0;
        }
        rv32i.step();
        cycles++;
    }
    return 0;
}