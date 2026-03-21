//
// Created by Mark Verbeek on 28.02.26.
//

#ifndef DWARFREADER_HPP
#define DWARFREADER_HPP

#include <libdwarf.h>
#include <vector>
#include <string>
#include <optional>
#include <cstdint>

struct LineEntry {
    uint32_t address;
    uint32_t line;
    uint32_t column;
    std::string file;
};

class DWARFReader {
public:
    void parse(const std::string &elf_path);

    std::optional<LineEntry> lookup_line(uint32_t pc) const;

    std::optional<uint32_t> lookup_address(const std::string &file, uint32_t line) const;

private:
    void parse_lines(Dwarf_Die cu_die);

    Dwarf_Debug m_dbg = nullptr; // valid only during parse()
    std::vector<LineEntry> line_entries; // sorted by address
};

#endif //DWARFREADER_HPP