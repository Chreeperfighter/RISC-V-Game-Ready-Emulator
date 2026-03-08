//
// Created by Mark Verbeek on 28.02.26.
//

#ifndef DWARFREADER_HPP
#define DWARFREADER_HPP

#include "ELFLoader.hpp"
#include "dwarf2.h"

#include <vector>
#include <string>
#include <optional>
#include <cstdint>
#include <map>

struct LineEntry {
    uint32_t address;
    uint32_t line;
    uint32_t column;
    std::string file;
};

struct AbbrevAttribute {
    uint64_t name;
    uint64_t form;
    int64_t value;
};

struct AbbrevDeclaration {
    uint64_t tag;
    bool has_children;
    std::vector<AbbrevAttribute> attributes;
};

struct FormValue {
    uint64_t             u = 0;
    std::string          str;
    std::vector<uint8_t> block;
};

struct Variable {
    std::string name;
    std::string type;
    uint8_t byte_size;
    bool in_register;
    uint32_t reg;
    int32_t frame_offset;
};

struct SubProgram {
    std::string name;
    uint32_t low_pc;
    uint32_t high_pc;
    std::vector<Variable> variables;
};

class DWARFReader {
public:
    void parse(const std::vector<ELFDebugSection>& sections);
    std::optional<LineEntry> lookup_line(uint32_t pc) const;
    std::optional<uint32_t> lookup_address(const std::string& file, uint32_t line) const;

private:
    void parse_debug_line(const ELFDebugSection& section);
    void parse_debug_info(const ELFDebugSection& section);
    void walk_dies(const std::vector<uint8_t>& data, size_t offset, size_t end, const std::map<uint64_t, AbbrevDeclaration>& abbrev_table, int depth);
    std::map<uint64_t, AbbrevDeclaration> get_abbrev_table(size_t offset) const;

    FormValue read_form_value(const std::vector<uint8_t>& data, size_t& offset, uint64_t form);

    // LEB128 decoders
    static uint64_t read_uleb128(const uint8_t* data, size_t& offset);
    static int64_t  read_sleb128(const uint8_t* data, size_t& offset);

    std::vector<LineEntry> line_entries;  // sorted by address
    std::vector<uint8_t> debug_line_str_data;
    std::vector<uint8_t> debug_abbrev_data;
};

#endif //DWARFREADER_HPP