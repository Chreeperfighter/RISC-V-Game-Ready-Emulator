//
// Created by Mark Verbeek on 28.02.26.
//

#include "DWARFReader.hpp"

#include <algorithm>
#include <iostream>

void DWARFReader::parse(const std::vector<ELFDebugSection>& sections) {
    for (const auto& section : sections) {
        if (section.name == ".debug_line_str")
            debug_line_str_data = section.data;
    }
    for (const auto& section : sections) {
        if (section.name == ".debug_line")
            parse_debug_line(section);
    }

    // Sort by address for binary search in lookup_line()
    std::sort(line_entries.begin(), line_entries.end(),
        [](const LineEntry& a, const LineEntry& b) {
            return a.address < b.address;
        });
}

std::optional<LineEntry> DWARFReader::lookup_line(uint32_t pc) const {
    if (line_entries.empty())
        return std::nullopt;

    // Find largest address <= pc
    auto it = std::upper_bound(line_entries.begin(), line_entries.end(), pc,
        [](uint32_t pc, const LineEntry& e) { return pc < e.address; });

    if (it == line_entries.begin())
        return std::nullopt;

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



void DWARFReader::parse_debug_line(const ELFDebugSection& section) {
    struct __attribute__((packed)) Header {
        uint32_t unit_length;
        uint16_t version;
        uint8_t address_size;
        uint8_t segment_selector_size;
        uint32_t header_length;
        uint8_t minimum_instruction_length;
        uint8_t maximum_operations_per_instruction;
        uint8_t default_is_stmt;
        int8_t line_base;
        uint8_t line_range;
        uint8_t opcode_base;
    };

    struct EntryFormat {
        uint64_t content_type;
        uint64_t form;
    };

    // State Machine Registers
    struct State {
        uint32_t address = 0;
        uint32_t op_index = 0;
        uint32_t file = 1;
        uint32_t line = 1;
        uint32_t column = 0;
        bool is_stmt = false;
        bool basic_block = false;
        bool end_sequence = false;
        bool prologue_end = false;
        bool epilogue_begin= false;
        uint32_t isa = 0;
        uint32_t discriminator = 0;
    };

    size_t start_offset = 0;
    size_t end_offset;
    Header header{};
    std::vector<std::string> directories;
    std::vector<std::string> file_names;
    int cu_index = 0;
    while (start_offset < section.data.size()) {
        size_t offset = start_offset;
        memcpy(&header, section.data.data() + offset, sizeof(Header));
        end_offset = offset + 4 + header.unit_length;
        offset += sizeof(Header);
        offset += header.opcode_base - 1; // skip standard_opcode_lengths

        // Directories
        uint8_t directory_entry_format_count = section.data[offset++];
        std::vector<EntryFormat> directory_entry_formats;
        for (uint8_t i = 0; i < directory_entry_format_count; ++i) {
            uint64_t content_type_code = read_uleb128(section.data.data(), offset);
            uint64_t form_code = read_uleb128(section.data.data(), offset);
            directory_entry_formats.push_back(EntryFormat{content_type_code, form_code});
        }
        uint64_t directories_count = read_uleb128(section.data.data(), offset);
        for (uint64_t i = 0; i < directories_count; ++i) {
            for (const EntryFormat& format : directory_entry_formats) {
                switch (format.content_type) {
                    case DW_LNCT_path: {
                        std::string path{};
                        if (format.form == DW_FORM_string) {
                            path = reinterpret_cast<const char *>(section.data.data() + offset);
                            offset += path.size() + 1;
                        }
                        else if (format.form == DW_FORM_line_strp) {
                            uint32_t str_offset;
                            memcpy(&str_offset, section.data.data() + offset, sizeof(uint32_t));
                            offset += sizeof(uint32_t);
                            path = reinterpret_cast<const char *>(debug_line_str_data.data() + str_offset);
                        }
                        directories.push_back(path);
                        break;
                    }
                    default: {
                        std::cerr << "[DWARF] Directories: Unknown content type: " << std::hex << std::showbase <<
                            format.content_type << std::dec << std::noshowbase << std::endl;
                        break;
                    }
                }
            }
        }

        // File Names
        uint8_t file_name_entry_format_count = section.data[offset++];
        std::vector<EntryFormat> file_name_entry_formats;
        for (uint8_t i = 0; i < file_name_entry_format_count; ++i) {
            uint64_t content_type_code = read_uleb128(section.data.data(), offset);
            uint64_t form_code = read_uleb128(section.data.data(), offset);
            file_name_entry_formats.push_back(EntryFormat{content_type_code, form_code});
        }

        uint64_t file_names_count = read_uleb128(section.data.data(), offset);
        for (uint64_t i = 0; i < file_names_count; ++i) {
            std::string filename;
            uint64_t dir_index = 0;
            for (const EntryFormat& format : file_name_entry_formats) {
                switch (format.content_type) {
                    case DW_LNCT_path: {
                        if (format.form == DW_FORM_string) {
                            filename = reinterpret_cast<const char *>(section.data.data() + offset);
                            offset += filename.size() + 1;
                        }
                        else if (format.form == DW_FORM_line_strp) {
                            uint32_t str_offset;
                            memcpy(&str_offset, section.data.data() + offset, sizeof(uint32_t));
                            offset += sizeof(uint32_t);
                            filename = reinterpret_cast<const char *>(debug_line_str_data.data() + str_offset);
                        }
                        break;
                    }
                    case DW_LNCT_directory_index: {
                        if (format.form == DW_FORM_udata) {
                            dir_index = read_uleb128(section.data.data(), offset);
                        }
                        else if (format.form == DW_FORM_data1) {
                            dir_index = section.data[offset++];
                        }
                        else {
                            std::cerr << "[DWARF] File Names: DW_LNCT_directory_index: Unknown content form: " << std::hex << std::showbase <<
                                format.form << std::dec << std::noshowbase << std::endl;
                        }
                        break;
                    }
                    default: {
                        std::cerr << "[DWARF] File Names: Unknown content type: " << std::hex << std::showbase <<
                            format.content_type << std::dec << std::noshowbase << std::endl;
                        break;
                    }
                }
            }
            std::string full = (dir_index < directories.size())
                ? directories[dir_index] + "/" + filename
                : filename;
            file_names.push_back(full);
        }
        State state{};
        state.is_stmt = header.default_is_stmt;

        auto emit_row = [&]() {
            if (!state.end_sequence) {
                std::string filename = (state.file < file_names.size())
                    ? file_names[state.file]
                    : "";
                line_entries.push_back(LineEntry{state.address, state.line, state.column, filename});

            }
        };

        uint32_t program_start = start_offset + 4 + 2 + 1 + 1 + 4 + header.header_length;
        offset = program_start;
        while (offset < end_offset) {
            uint8_t opcode = section.data[offset++];
            // Extended
            if (opcode == 0) {
                uint64_t num_bytes = read_uleb128(section.data.data(), offset);
                uint8_t extended_opcode = section.data[offset++];
                switch (extended_opcode) {
                    case DW_LNE_end_sequence: {
                        state.end_sequence = true;
                        emit_row();
                        state = State{};
                        state.is_stmt = header.default_is_stmt;
                        break;
                    }
                    case DW_LNE_set_address: {
                        uint32_t address;
                        memcpy(&address, section.data.data() + offset, sizeof(uint32_t));
                        offset += sizeof(uint32_t);
                        state.address = address;
                        state.op_index = 0;
                        break;
                    }
                    case DW_LNE_set_discriminator: {
                        uint64_t discriminator = read_uleb128(section.data.data(), offset);
                        state.discriminator = discriminator;
                        break;
                    }
                    default:
                        offset += num_bytes - 1;
                        break;
                }
            }
            // Standard
            else if (opcode < header.opcode_base) {
                switch (opcode) {
                    case DW_LNS_copy: {
                        emit_row();
                        state.discriminator = 0;
                        state.basic_block = false;
                        state.prologue_end = false;
                        state.epilogue_begin = false;
                        break;
                    }
                    case DW_LNS_advance_pc: {
                        uint64_t operation_advance = read_uleb128(section.data.data(), offset);
                        state.address += header.minimum_instruction_length * ((state.op_index + operation_advance) / header.maximum_operations_per_instruction);
                        state.op_index = (state.op_index + operation_advance) % header.maximum_operations_per_instruction;
                        break;
                    }
                    case DW_LNS_advance_line: {
                        int64_t operand = read_sleb128(section.data.data(), offset);
                        state.line += operand;
                        break;
                    }
                    case DW_LNS_set_file: {
                        uint64_t operand = read_uleb128(section.data.data(), offset);
                        state.file = operand;
                        break;
                    }
                    case DW_LNS_set_column: {
                        uint64_t operand = read_uleb128(section.data.data(), offset);
                        state.column = operand;
                        break;
                    }
                    case DW_LNS_negate_stmt: {
                        state.is_stmt = !state.is_stmt;
                        break;
                    }
                    case DW_LNS_set_basic_block: {
                        state.basic_block = true;
                        break;
                    }
                    case DW_LNS_const_add_pc: {
                        uint8_t adjusted_opcode = 255 - header.opcode_base;
                        uint32_t operation_advance = adjusted_opcode / header.line_range;
                        state.address += header.minimum_instruction_length * ((state.op_index + operation_advance) / header.maximum_operations_per_instruction);
                        state.op_index = (state.op_index + operation_advance) % header.maximum_operations_per_instruction;
                        break;
                    }
                    case DW_LNS_fixed_advance_pc: {
                        uint16_t operand;
                        memcpy(&operand, section.data.data() + offset, 2);
                        offset += 2;
                        state.address += operand;
                        state.op_index = 0;
                        break;
                    }
                    case DW_LNS_set_prologue_end: {
                        state.prologue_end = true;
                        break;
                    }
                    case DW_LNS_set_epilogue_begin: {
                        state.epilogue_begin = true;
                        break;
                    }
                    case DW_LNS_set_isa: {
                        uint64_t operand = read_uleb128(section.data.data(), offset);
                        state.isa = operand;
                        break;
                    }
                    default:
                        break;
                }
            }
            // Special
            else {
                uint8_t adjusted_opcode = opcode - header.opcode_base;
                uint32_t operation_advance = adjusted_opcode / header.line_range;
                state.address += header.minimum_instruction_length * ((state.op_index + operation_advance) / header.maximum_operations_per_instruction);
                state.op_index = (state.op_index + operation_advance) % header.maximum_operations_per_instruction;
                state.line += header.line_base + (adjusted_opcode % header.line_range);
                emit_row();
                state.basic_block = false;
                state.prologue_end = false;
                state.epilogue_begin = false;
                state.discriminator = 0;
            }
        }
        start_offset = end_offset;
    }
}

uint64_t DWARFReader::read_uleb128(const uint8_t* data, size_t& offset) {
    uint64_t result = 0;
    int shift = 0;
    while (true) {
        const uint8_t byte = data[offset++];
        result |= static_cast<uint64_t>(byte & 0x7F) << shift;
        if ((byte & 0x80) == 0) break;
        shift += 7;
    }
    return result;
}

int64_t DWARFReader::read_sleb128(const uint8_t* data, size_t& offset) {
    int64_t result = 0;
    int shift = 0;
    uint8_t byte;
    while (true) {
        byte = data[offset++];
        result |= static_cast<int64_t>(byte & 0x7F) << shift;
        shift += 7;
        if ((byte & 0x80) == 0) break;
    }
    // Sign extend if the last byte's sign bit is set
    if (shift < 64 && (byte & 0x40))
        result |= -(1LL << shift);
    return result;
}