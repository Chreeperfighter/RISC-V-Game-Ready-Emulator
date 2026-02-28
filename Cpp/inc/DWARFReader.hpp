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

struct LineEntry {
    uint32_t address;
    uint32_t line;
    uint32_t column;
    std::string file;
};

class DWARFReader {
public:
    void parse(const std::vector<ELFDebugSection>& sections);
    std::optional<LineEntry> lookup_line(uint32_t pc) const;

private:
    void parse_debug_line(const ELFDebugSection& section);

    // LEB128 decoders
    static uint64_t read_uleb128(const uint8_t* data, size_t& offset);
    static int64_t  read_sleb128(const uint8_t* data, size_t& offset);

    std::vector<LineEntry> line_entries;  // sorted by address
};

#endif //DWARFREADER_HPP