//
// Created by Mark Verbeek on 28.02.26.
//

#include "DWARFReader.hpp"

#include <libdwarf.h>
#include <dwarf.h>
#include <algorithm>
#include <iostream>

void DWARFReader::parse(const std::string& elf_path) {
    Dwarf_Error err = nullptr;
    Dwarf_Debug dbg = nullptr;
    int res = dwarf_init_path(elf_path.c_str(), nullptr, 0, 0, nullptr, nullptr, &dbg, &err);
    if (res != DW_DLV_OK) {
        std::cerr << "[DWARF] Failed to open: " << elf_path << std::endl;
        return;
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
        walk_dies(cu_die);
        dwarf_dealloc_die(cu_die);
        cu_die = nullptr;
    }

    m_dbg = nullptr;
    dwarf_finish(dbg);

    std::sort(line_entries.begin(), line_entries.end(),
        [](const LineEntry& a, const LineEntry& b) { return a.address < b.address; });
    std::sort(sub_programs.begin(), sub_programs.end(),
        [](const SubProgram& a, const SubProgram& b) { return a.low_pc < b.low_pc; });
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

const SubProgram* DWARFReader::lookup_subprogram(uint32_t pc) const {
    // Find the first subprogram whose low_pc is greater than pc
    auto it = std::upper_bound(sub_programs.begin(), sub_programs.end(), pc,
        [](uint32_t pc, const SubProgram& s) { return pc < s.low_pc; });

    // If the first entry already starts after pc, nothing can contain it
    if (it == sub_programs.begin())
        return nullptr;

    // Step back to the candidate whose low_pc <= pc
    --it;

    // Check that pc also falls before high_pc
    if (pc < it->high_pc)
        return &(*it);

    return nullptr;
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

static int32_t read_sleb128(const uint8_t* data) {
    int32_t result = 0;
    int shift = 0;
    uint8_t byte;
    do {
        byte = *data++;
        result |= (byte & 0x7f) << shift;
        shift += 7;
    } while (byte & 0x80);
    if (shift < 32 && (byte & 0x40))
        result |= -(1 << shift);
    return result;
}

std::vector<Variable> DWARFReader::collect_variables(Dwarf_Die subprogram_die) {
    std::vector<Variable> vars;
    Dwarf_Error err = nullptr;

    // Move into the first child of the subprogram
    Dwarf_Die child = nullptr;
    if (dwarf_child(subprogram_die, &child, &err) != DW_DLV_OK)
        return vars;  // no children → no variables

    // Lambda so we can call the same logic on each sibling without repeating code
    auto try_parse = [&](Dwarf_Die die) {
        Dwarf_Half tag = 0;
        dwarf_tag(die, &tag, &err);

        // Skip anything that isn't a variable or function parameter
        if (tag != DW_TAG_variable && tag != DW_TAG_formal_parameter)
            return;

        Variable var{};

        // --- Name ---
        // dwarf_diename gives us the DW_AT_name string directly
        char* name = nullptr;
        if (dwarf_diename(die, &name, &err) == DW_DLV_OK && name)
            var.name = name;

        // --- Type ---
        // DW_AT_type holds a reference (offset) to another DIE that describes the type.
        // We follow that reference with dwarf_offdie_b to read the type's name and byte size.
        Dwarf_Attribute type_attr = nullptr;
        if (dwarf_attr(die, DW_AT_type, &type_attr, &err) == DW_DLV_OK) {
            Dwarf_Off global_offset = 0;
            // Convert the CU-relative ref to an absolute section offset
            if (dwarf_global_formref(type_attr, &global_offset, &err) == DW_DLV_OK) {
                Dwarf_Die type_die = nullptr;
                // Jump to the type DIE (true = search .debug_info, not .debug_types)
                if (dwarf_offdie_b(m_dbg, global_offset, true, &type_die, &err) == DW_DLV_OK) {
                    char* type_name = nullptr;
                    if (dwarf_diename(type_die, &type_name, &err) == DW_DLV_OK && type_name)
                        var.type = type_name;

                    // DW_AT_byte_size tells us how many bytes the type occupies
                    Dwarf_Unsigned byte_size = 0;
                    if (dwarf_bytesize(type_die, &byte_size, &err) == DW_DLV_OK)
                        var.byte_size = static_cast<uint8_t>(byte_size);

                    dwarf_dealloc_die(type_die);
                }
            }
            dwarf_dealloc_attribute(type_attr);
        }

        // --- Location ---
        // DW_AT_location is a tiny bytecode expression.
        // We read it as a raw block and look at the first opcode byte.
        Dwarf_Attribute loc_attr = nullptr;
        if (dwarf_attr(die, DW_AT_location, &loc_attr, &err) == DW_DLV_OK) {
            Dwarf_Block* block = nullptr;
            if (dwarf_formblock(loc_attr, &block, &err) == DW_DLV_OK) {
                const auto* expr = static_cast<const uint8_t*>(block->bl_data);
                uint8_t op = expr[0];

                if (op >= 0x50 && op <= 0x6f) {
                    // DW_OP_reg0..DW_OP_reg31 — value lives entirely in a register
                    var.in_register = true;
                    var.reg = op - 0x50;
                } else if (op == 0x91 && block->bl_len > 1) {
                    // DW_OP_fbreg — value is in memory at frame_base + signed offset
                    var.in_register = false;
                    var.frame_offset = read_sleb128(expr + 1);
                }

                dwarf_dealloc(m_dbg, block, DW_DLA_BLOCK);
            }
            dwarf_dealloc_attribute(loc_attr);
        }

        if (!var.name.empty())
            vars.push_back(std::move(var));
    };

    // Process first child, then walk all its siblings
    try_parse(child);
    Dwarf_Die sibling = nullptr;
    while (dwarf_siblingof_c(child, &sibling, &err) == DW_DLV_OK) {
        dwarf_dealloc_die(child);
        child = sibling;
        try_parse(child);
    }
    dwarf_dealloc_die(child);

    return vars;
}

void DWARFReader::walk_dies(Dwarf_Die die) {
    Dwarf_Error err = nullptr;
    Dwarf_Half tag = 0;
    dwarf_tag(die, &tag, &err);

    if (tag == DW_TAG_subprogram) {
        char* name = nullptr;
        Dwarf_Addr low_pc = 0, high_pc = 0;
        Dwarf_Half form = 0;
        Dwarf_Form_Class form_class = DW_FORM_CLASS_UNKNOWN;

        dwarf_diename(die, &name, &err);
        dwarf_lowpc(die, &low_pc, &err);
        if (dwarf_highpc_b(die, &high_pc, &form, &form_class, &err) == DW_DLV_OK) {
            if (form_class != DW_FORM_CLASS_ADDRESS)
                high_pc += low_pc;  // high_pc is a length, not an address
        }

        if (name && low_pc != high_pc)
            sub_programs.push_back({std::string(name), static_cast<uint32_t>(low_pc), static_cast<uint32_t>(high_pc), collect_variables(die)});
    }

    // Recurse into children
    Dwarf_Die child = nullptr;
    if (dwarf_child(die, &child, &err) != DW_DLV_OK)
        return;

    walk_dies(child);
    Dwarf_Die sibling = nullptr;
    while (dwarf_siblingof_c(child, &sibling, &err) == DW_DLV_OK) {
        dwarf_dealloc_die(child);
        child = sibling;
        walk_dies(child);
    }
    dwarf_dealloc_die(child);
}