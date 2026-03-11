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
    uint32_t    address;
    uint32_t    line;
    uint32_t    column;
    std::string file;
};

struct Variable {
    std::string name;
    std::string type;
    uint8_t     byte_size;
    bool        in_register;
    uint32_t    reg;
    int32_t     frame_offset;
};

struct SubProgram {
    std::string          name;
    uint32_t             low_pc;
    uint32_t             high_pc;
    std::vector<Variable> variables;
};

class DWARFReader {
public:
    void parse(const std::string& elf_path);

    std::optional<LineEntry>   lookup_line(uint32_t pc) const;
    std::optional<uint32_t>   lookup_address(const std::string& file, uint32_t line) const;
    const SubProgram* lookup_subprogram(uint32_t pc) const;

private:
    void                 parse_lines(Dwarf_Die cu_die);
    void                 walk_dies(Dwarf_Die die);
    std::vector<Variable> collect_variables(Dwarf_Die subprogram_die);

    Dwarf_Debug             m_dbg = nullptr;  // valid only during parse()
    std::vector<LineEntry>  line_entries;     // sorted by address
    std::vector<SubProgram> sub_programs;     // sorted by low_pc
};

#endif //DWARFREADER_HPP