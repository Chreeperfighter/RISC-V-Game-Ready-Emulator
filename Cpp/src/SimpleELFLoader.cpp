//
// Created by Mark Verbeek on 23.10.25.
//

#include "SimpleELFLoader.hpp"

#include <fstream>
#include <iostream>

#include "elf.h"

std::vector<uint8_t> read_file(const char* path) {
    std::ifstream file(path, std::ios::binary);
    if (!file) {
        std::cerr << "Failed to open file " << path << std::endl;
        return {};
    }

    file.seekg(0, std::ios::end);
    size_t size = file.tellg();
    file.seekg(0, std::ios::beg);

    std::vector<uint8_t> buffer(size);
    file.read(reinterpret_cast<char*>(buffer.data()), static_cast<long>(size));

    return buffer;
}

std::vector<uint8_t> get_binary(const std::vector<uint8_t>& elf, uint32_t& load_address) {
    auto* ehdr = (Elf32_Ehdr*)elf.data();
    Elf32_Phdr* phdrs = (Elf32_Phdr*)(elf.data() + ehdr->e_phoff);

    // Find memory range needed
    uint32_t min_addr = UINT32_MAX;
    uint32_t max_addr = 0;

    for (int i = 0; i < ehdr->e_phnum; i++) {
        if (phdrs[i].p_type == PT_LOAD) {
            min_addr = std::min(min_addr, phdrs[i].p_vaddr);
            max_addr = std::max(max_addr, phdrs[i].p_vaddr + phdrs[i].p_memsz);
        }
    }

    load_address = min_addr;
    std::vector<uint8_t> memory(max_addr - min_addr, 0);

    // Load each segment at correct offset
    for (int i = 0; i < ehdr->e_phnum; i++) {
        if (phdrs[i].p_type == PT_LOAD) {
            const uint8_t* segment_data = elf.data() + phdrs[i].p_offset;
            uint32_t offset = phdrs[i].p_vaddr - min_addr;
            std::copy(segment_data, segment_data + phdrs[i].p_filesz,
                     memory.begin() + offset);
        }
    }

    return memory;
}

uint32_t get_entry_point(const std::vector<uint8_t>& elf) {
    auto* ehdr = (Elf32_Ehdr*)elf.data();
    return ehdr->e_entry;
}

uint32_t get_bss_end(const std::vector<uint8_t>& elf) {
    auto* ehdr = (Elf32_Ehdr*)elf.data();

    if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG) != 0) {
        std::cerr << "Not valid ELF\n";
        return 0;
    }

    Elf32_Shdr* sections = (Elf32_Shdr*)(elf.data() + ehdr->e_shoff);
    Elf32_Shdr* shstrtab = &sections[ehdr->e_shstrndx];
    const char* section_names = (const char*)(elf.data() + shstrtab->sh_offset);

    for (int i = 0; i < ehdr->e_shnum; i++) {
        const char* name = section_names + sections[i].sh_name;

        if (strcmp(name, ".bss") == 0) {
            return sections[i].sh_addr + sections[i].sh_size;
        }
    }

    std::cerr << "No .bss section found\n";
    return 0;
}

uint32_t get_text_start(const std::vector<uint8_t>& elf) {
    auto* ehdr = (Elf32_Ehdr*)elf.data();

    if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG) != 0) {
        std::cerr << "Not valid ELF\n";
        return 0;
    }

    Elf32_Shdr* sections = (Elf32_Shdr*)(elf.data() + ehdr->e_shoff);
    Elf32_Shdr* shstrtab = &sections[ehdr->e_shstrndx];
    const char* section_names = (const char*)(elf.data() + shstrtab->sh_offset);

    for (int i = 0; i < ehdr->e_shnum; i++) {
        const char* name = section_names + sections[i].sh_name;

        if (strcmp(name, ".text") == 0) {
            return sections[i].sh_addr;
        }
    }

    std::cerr << "No .bss section found\n";
    return 0;
}

uint32_t get_text_end(const std::vector<uint8_t>& elf) {
    auto* ehdr = (Elf32_Ehdr*)elf.data();

    if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG) != 0) {
        std::cerr << "Not valid ELF\n";
        return 0;
    }

    Elf32_Shdr* sections = (Elf32_Shdr*)(elf.data() + ehdr->e_shoff);
    Elf32_Shdr* shstrtab = &sections[ehdr->e_shstrndx];
    const char* section_names = (const char*)(elf.data() + shstrtab->sh_offset);

    for (int i = 0; i < ehdr->e_shnum; i++) {
        const char* name = section_names + sections[i].sh_name;

        if (strcmp(name, ".text") == 0) {
            return sections[i].sh_addr + sections[i].sh_size;
        }
    }

    std::cerr << "No .bss section found\n";
    return 0;
}