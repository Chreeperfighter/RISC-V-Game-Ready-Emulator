//
// Created by Mark Verbeek on 23.10.25.
//

#ifndef SIMPLEELFLOADER_HPP
#define SIMPLEELFLOADER_HPP

#include <vector>

std::vector<uint8_t> read_file(const char* path);
std::vector<uint8_t> get_binary(const std::vector<uint8_t>& elf, uint32_t& load_address);
uint32_t get_entry_point(const std::vector<uint8_t>& elf);
uint32_t get_bss_end(const std::vector<uint8_t>& elf);
uint32_t get_text_start(const std::vector<uint8_t>& elf);
uint32_t get_text_end(const std::vector<uint8_t>& elf);

#endif //SIMPLEELFLOADER_HPP
