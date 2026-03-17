//
// Created by Mark Verbeek on 28.02.26.
//

#include "DWARFReader.hpp"
#include "Utils.hpp"

#include <libdwarf.h>
#include <dwarf.h>
#include <algorithm>
#include <iostream>

void DWARFReader::parse(const std::string& elf_path) {
    Dwarf_Error err = nullptr;
    Dwarf_Debug dbg = nullptr;
    int res = dwarf_init_path(elf_path.c_str(), nullptr, 0, 0, nullptr, nullptr, &dbg, &err);
    if (res != DW_DLV_OK) {
        emulator_error("DWARFReader::parse() --> failed to open: " + elf_path);
    }
    m_dbg = dbg;

    Dwarf_Die cu_die = nullptr;
    Dwarf_Unsigned cu_header_length = 0;
    Dwarf_Half version = 0, address_size = 0, length_size = 0, extension_size = 0, header_cu_type = 0;
    Dwarf_Off abbrev_offset = 0;
    Dwarf_Sig8 type_sig{};
    Dwarf_Unsigned typeoffset = 0, next_cu_offset = 0;
    while (dwarf_next_cu_header_e(dbg, true, &cu_die,
            &cu_header_length, &version, &abbrev_offset, &address_size, &length_size,
            &extension_size, &type_sig, &typeoffset, &next_cu_offset, &header_cu_type, &err) == DW_DLV_OK) {
        parse_lines(cu_die);
        dwarf_dealloc_die(cu_die);
        cu_die = nullptr;
    }

    m_dbg = nullptr;
    dwarf_finish(dbg);

    std::sort(line_entries.begin(), line_entries.end(),
        [](const LineEntry& a, const LineEntry& b) { return a.address < b.address; });
}

// --- Lookup ---

std::optional<LineEntry> DWARFReader::lookup_line(uint32_t pc) const {
    if (line_entries.empty()) return std::nullopt;

    auto it = std::upper_bound(line_entries.begin(), line_entries.end(), pc,
        [](uint32_t pc, const LineEntry& e) { return pc < e.address; });

    if (it == line_entries.begin()) return std::nullopt;
    return *std::prev(it);
}

std::optional<uint32_t> DWARFReader::lookup_address(const std::string& file, uint32_t line) const {
    std::optional<uint32_t> best;
    for (const auto& entry : line_entries) {
        if (entry.line == line && entry.file == file) {
            if (!best || entry.address < *best)
                best = entry.address;
        }
    }
    return best;
}

// --- Parsing ---

void DWARFReader::parse_lines(Dwarf_Die cu_die) {
    Dwarf_Error err = nullptr;
    Dwarf_Unsigned version = 0;
    Dwarf_Small table_count = 0;
    Dwarf_Line_Context ctx = nullptr;

    if (dwarf_srclines_b(cu_die, &version, &table_count, &ctx, &err) != DW_DLV_OK)
        return;

    Dwarf_Line* lines = nullptr;
    Dwarf_Signed count = 0;
    if (dwarf_srclines_from_linecontext(ctx, &lines, &count, &err) == DW_DLV_OK) {
        for (Dwarf_Signed i = 0; i < count; i++) {
            Dwarf_Addr addr = 0;
            Dwarf_Unsigned lineno = 0, col = 0;
            char* file = nullptr;

            dwarf_lineaddr(lines[i], &addr, &err);
            dwarf_lineno(lines[i], &lineno, &err);
            dwarf_lineoff_b(lines[i], &col, &err);
            dwarf_linesrc(lines[i], &file, &err);

            line_entries.push_back(LineEntry{
                static_cast<uint32_t>(addr),
                static_cast<uint32_t>(lineno),
                static_cast<uint32_t>(col),
                file ? std::string(file) : ""
            });
        }
    }

    dwarf_srclines_dealloc_b(ctx);
}