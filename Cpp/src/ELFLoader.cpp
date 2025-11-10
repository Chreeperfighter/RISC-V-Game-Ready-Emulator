//
// Created by Mark Verbeek on 09.11.25.
//

#include "ELFLoader.hpp"

#include <fstream>
#include <iostream>

void ELFLoader::parse(const char *path) {
    std::ifstream file(path, std::ios::binary);
    if (!file) {
        std::cerr << "Failed to open file " << path << std::endl;
        return;
    }

    file.seekg(0, std::ios::end);
    const size_t size = file.tellg();
    file.seekg(0, std::ios::beg);

    elf.resize(size);
    file.read(reinterpret_cast<char*>(elf.data()), static_cast<long>(size));

    ehdr = *reinterpret_cast<const Elf32_Ehdr *>(elf.data());

    // Program headers
    phdrs.resize(ehdr.e_phnum);
    for (int i = 0; i < ehdr.e_phnum; ++i) {
        const uint32_t offset = ehdr.e_phoff + i * ehdr.e_phentsize;
        phdrs[i] = *reinterpret_cast<const Elf32_Phdr *>(elf.data() + offset);
    }

    // Section headers
    shdrs.resize(ehdr.e_shnum);
    for (int i = 0; i < ehdr.e_shnum; ++i) {
        const uint32_t offset = ehdr.e_shoff + i * ehdr.e_shentsize;
        shdrs[i] = *reinterpret_cast<const Elf32_Shdr *>(elf.data() + offset);
    }

    // Section Header String Table
    const Elf32_Shdr shstrtab_section = shdrs[ehdr.e_shstrndx];
    shstrtab.resize(shstrtab_section.sh_size);
    std::copy_n(
        elf.data() + shstrtab_section.sh_offset,
        shstrtab_section.sh_size,
        shstrtab.begin()
        );
}

uint32_t ELFLoader::get_entry() const {
    return ehdr.e_entry;
}

std::vector<ELFSection> ELFLoader::get_sections() const {
    std::vector<ELFSection> sections;

    for (int i = 0; i < ehdr.e_shnum; i++) {
        const Elf32_Shdr shdr = shdrs[i];
        if (shdr.sh_type != SHT_PROGBITS && shdr.sh_type != SHT_NOBITS) {
            continue;
        }
        ELFSection section;
        section.name = &shstrtab[shdr.sh_name];
        section.address = shdr.sh_addr;
        section.size = shdr.sh_size;
        section.type = shdr.sh_type;
        if (shdr.sh_type == SHT_PROGBITS) {
            section.data.resize(shdr.sh_size);
            std::copy_n(
                elf.data() + shdr.sh_offset,
                shdr.sh_size,
                section.data.begin()
                );
        }
        else {
            section.data.clear();
        }
        sections.push_back(section);
    }
    return sections;
}

