//
// Created by Mark Verbeek on 09.11.25.
//

#ifndef ELFLOADER_HPP
#define ELFLOADER_HPP

#include "elf.h"

#include <vector>

typedef struct {
    std::vector<uint8_t> data;
    Elf32_Addr address;
    Elf32_Word size;
    Elf32_Word type;
    Elf32_Word flags;
    std::string name;
} ELFSection;

class ELFLoader {
public:
    void parse(const char *path);
    uint32_t get_entry() const;
    std::vector<ELFSection> get_sections() const;
private:
    std::vector<uint8_t> elf{};
    Elf32_Ehdr ehdr{};
    std::vector<Elf32_Phdr> phdrs{};
    std::vector<Elf32_Shdr> shdrs{};
    std::vector<char> shstrtab{};
};



#endif //ELFLOADER_HPP
