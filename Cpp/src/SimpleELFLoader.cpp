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

std::vector<uint8_t> get_binary(const std::vector<uint8_t>& elf) {
    auto* ehdr = (Elf32_Ehdr*)elf.data();
    Elf32_Phdr* phdrs = (Elf32_Phdr*)(elf.data() + ehdr->e_phoff);

    std::vector<uint8_t> code;

    for (int i = 0; i < ehdr->e_phnum; i++) {
        if (phdrs[i].p_type == PT_LOAD) {
            const uint8_t* segment_data = elf.data() + phdrs[i].p_offset;
            size_t size = phdrs[i].p_filesz;
            code.insert(code.end(), segment_data, segment_data + size);
        }
    }
    return code;
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