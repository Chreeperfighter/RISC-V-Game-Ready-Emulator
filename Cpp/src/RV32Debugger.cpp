//
// Created by Mark Verbeek on 08.11.25.
//

#include "RV32Debugger.hpp"
#include "Config.hpp"

#include <fstream>
#include <iostream>
#include <sstream>
#include <iomanip>
#include <unordered_map>

RV32Debugger::RV32Debugger(RV32 &rv32_obj) : rv32(rv32_obj) {
    dwarf.parse(g_config.binary_path);
    for (const auto& bp : g_config.breakpoints) {
        if (bp.address.has_value())
            breakpoint_addresses.insert(*bp.address);
        else if (bp.line.has_value() && bp.file.has_value()) {
            std::optional<uint32_t> address = dwarf.lookup_address(bp.file.value(), bp.line.value());
            if (address.has_value()) {
                breakpoint_addresses.insert(address.value());
            }
        }
    }
}

// --- UI helpers ---

// Returns n repetitions of the box-drawing dash (─ is 3 bytes in UTF-8 but 1 display column)
static std::string dashes(int n) {
    std::string s;
    for (int i = 0; i < n; i++) s += "─";
    return s;
}

// Pad a string to a fixed column width with spaces (used for two-column rows)
static std::string pad_col(std::string s, int width) {
    if (static_cast<int>(s.size()) < width)
        s += std::string(width - s.size(), ' ');
    return s;
}

// Draw a full box given a pre-computed total display width.
// UTF-8 display width: counts codepoints (non-continuation bytes), not raw bytes.
// This ensures multibyte characters like → (3 bytes, 1 column) are counted correctly.
static int display_width(const std::string& s) {
    int w = 0;
    for (unsigned char c : s)
        if ((c & 0xC0) != 0x80) w++;  // skip UTF-8 continuation bytes (10xxxxxx)
    return w;
}

// Width is the minimum returned by needed_width() across all boxes.
static void draw_box(const std::string& title, const std::vector<std::string>& lines, int width) {
    // Top border: ╭── title ───...───╮
    int fill = width - 6 - display_width(title);
    std::cout << "╭── " << title << " " << dashes(fill < 0 ? 0 : fill) << "╮\n";

    // Content lines: │ line (padded) │
    int content_w = width - 4;
    for (const auto& line : lines) {
        int dw = display_width(line);
        std::string s = line;
        if (dw < content_w) s += std::string(content_w - dw, ' ');
        std::cout << "│ " << s << " │\n";
    }

    // Bottom border: ╰──────────────╯
    std::cout << "╰" << dashes(width - 2) << "╯\n";
}

// Returns the minimum box width needed to fit the title and all content lines
static int needed_width(const std::string& title, const std::vector<std::string>& lines) {
    int w = display_width(title) + 6;  // ╭── title ╮ minimum
    for (const auto& line : lines)
        w = std::max(w, display_width(line) + 4);  // │ line │
    return w;
}

// Convert a variable's raw bytes to a display string based on its type
static std::string format_value(const Variable& var, const std::vector<uint8_t>& raw) {
    if (raw.size() < var.byte_size)
        return "<read error>";

    std::ostringstream ss;
    if (var.type == "float") {
        float val = 0;
        memcpy(&val, raw.data(), 4);
        ss << val;
    } else if (var.type == "double") {
        double val = 0;
        memcpy(&val, raw.data(), 8);
        ss << val;
    } else if (var.type == "_Bool") {
        ss << (raw[0] ? "true" : "false");
    } else if (var.type == "char") {
        char val = static_cast<char>(raw[0]);
        ss << "'" << val << "' (" << static_cast<int>(val) << ")";
    } else if (var.type.find("unsigned") != std::string::npos) {
        uint64_t val = 0;
        memcpy(&val, raw.data(), var.byte_size);
        ss << val;
    } else {
        // Signed integers — sign-extend from byte_size to 64-bit
        int64_t val = 0;
        memcpy(&val, raw.data(), var.byte_size);
        int shift = (8 - var.byte_size) * 8;
        val = (val << shift) >> shift;
        ss << val;
    }
    return ss.str();
}

void RV32Debugger::on_breakpoint() {
    uint32_t pc = rv32.get_pc();
    std::optional<LineEntry> entry = dwarf.lookup_line(pc);
    const SubProgram*        sub   = dwarf.lookup_subprogram(pc);

    // Determine the stop reason; mark fatal traps so the emulator stops after this
    std::string reason;
    switch (rv32.trap) {
        case TrapReason::Breakpoint:  reason = "EBREAK";               break;
        case TrapReason::IllegalInst: reason = "Illegal Instruction";  rv32.running = false; break;
        case TrapReason::MemFault:    reason = "Memory Fault";         rv32.running = false; break;
        case TrapReason::None:        reason = "Breakpoint";           break;
    }

    // ── Collect content for all boxes first, then compute a shared width ──

    // Source box
    std::string              source_title;
    std::vector<std::string> source_lines;

    if (entry.has_value()) {
        source_title = "Source: " + entry->file;

        std::ifstream src(entry->file);
        if (src) {
            uint32_t target    = entry->line;
            uint32_t show_from = target > 2 ? target - 2 : 1;
            uint32_t show_to   = target + 2;

            std::string line;
            uint32_t lineno = 1;

            while (lineno < show_from && std::getline(src, line))
                lineno++;

            while (lineno <= show_to && std::getline(src, line)) {
                std::ostringstream ss;
                ss << (lineno == target ? "→ " : "  ")
                   << std::setw(3) << lineno << " │ " << line;
                source_lines.push_back(ss.str());
                lineno++;
            }
        } else {
            source_lines.push_back("<source not available>");
        }
    }

    // State box
    std::vector<std::string> state_lines;
    {
        std::ostringstream hex_ss;
        hex_ss << "0x" << std::hex << std::setfill('0') << std::setw(8) << pc;

        std::string func_str = sub ? sub->name + "()" : "<unknown>";
        std::string line_str = entry.has_value() ? std::to_string(entry->line) : "?";

        // Left column is fixed at 28 chars; right side is appended after it
        state_lines.push_back(pad_col("PC:       " + hex_ss.str(), 28) + "Function: " + func_str);
        state_lines.push_back(pad_col("Reason:   " + reason,       28) + "Line:     " + line_str);
    }

    // Variables box
    std::vector<std::string> var_lines;
    if (sub) {
        for (const auto& var : sub->variables) {
            std::vector<uint8_t> raw(var.byte_size);
            if (var.in_register) {
                uint32_t v = rv32.read_reg(var.reg);
                memcpy(raw.data(), &v, var.byte_size);
            } else {
                uint32_t fp = rv32.read_reg(static_cast<uint8_t>(Register::fp));
                raw = rv32.read_bytes(fp + var.frame_offset, var.byte_size);
            }
            var_lines.push_back(var.name + " (" + var.type + ") = " + format_value(var, raw));
        }
    }

    // ── Compute shared width from the widest content across all boxes ──
    int width = needed_width("State", state_lines);
    if (!source_title.empty())
        width = std::max(width, needed_width(source_title, source_lines));
    if (!var_lines.empty())
        width = std::max(width, needed_width("Variables", var_lines));

    // ── Draw ──────────────────────────────────────────────────────────
    if (!source_title.empty())
        draw_box(source_title, source_lines, width);

    draw_box("State", state_lines, width);

    if (!var_lines.empty())
        draw_box("Variables", var_lines, width);

    // ── Command prompt ────────────────────────────────────────────────
    if (!rv32.running) return;

    std::string cmd;
    std::cout << "(debug) > ";
    while (std::getline(std::cin, cmd)) {
        if (cmd == "c") break;
        if (handle_command(cmd, sub)) break;  // si/so — resume CPU
        std::cout << "(debug) > ";
    }
}

// Look up a register index by ABI or xN name using the existing register_names table.
// register_names entries look like "x0/zero", "x8/s0/fp" — split on '/' and match.
static std::optional<uint8_t> find_register(const std::string& name) {
    for (int i = 0; i < 32; i++) {
        std::istringstream ss(register_names[i]);
        std::string part;
        while (std::getline(ss, part, '/'))
            if (part == name) return static_cast<uint8_t>(i);
    }
    return std::nullopt;
}

bool RV32Debugger::handle_command(const std::string& cmd, const SubProgram* sub) {
    // si — step into: execute one instruction then break again
    if (cmd == "si") {
        step_mode = StepMode::Into;
        return true;  // exit command loop → CPU resumes
    }

    // so — step over: run until next source line at the same stack depth
    if (cmd == "so") {
        step_sp   = rv32.read_reg(static_cast<uint8_t>(Register::sp));
        auto entry = dwarf.lookup_line(rv32.get_pc());
        step_line = entry ? entry->line : 0;
        step_mode = StepMode::Over;
        return true;
    }

    // print(arg) — arg is a register name, variable name, or 0x memory address
    if (cmd.rfind("print(", 0) == 0 && cmd.back() == ')') {
        std::string arg = cmd.substr(6, cmd.size() - 7);

        // 1. Memory address — starts with 0x
        if (arg.rfind("0x", 0) == 0 || arg.rfind("0X", 0) == 0) {
            try {
                uint32_t addr = std::stoul(arg, nullptr, 16);
                auto     bytes = rv32.read_bytes(addr, 4);
                uint32_t val  = 0;
                memcpy(&val, bytes.data(), 4);
                std::cout << "*(" << arg << ") = 0x" << std::hex << val
                          << " (" << std::dec << val << ")\n";
            } catch (...) {
                std::cout << "Invalid address: " << arg << "\n";
            }
            return false;
        }

        // 2. Register name — look up via register_names table
        if (auto idx = find_register(arg)) {
            uint32_t val = rv32.read_reg(*idx);
            std::cout << arg << " = 0x" << std::hex << val
                      << " (" << std::dec << val << ")\n";
            return false;
        }

        // 3. Variable name — search current subprogram's variable list
        if (sub) {
            for (const auto& var : sub->variables) {
                if (var.name != arg) continue;
                std::vector<uint8_t> raw(var.byte_size);
                if (var.in_register) {
                    uint32_t v = rv32.read_reg(var.reg);
                    memcpy(raw.data(), &v, var.byte_size);
                } else {
                    uint32_t fp = rv32.read_reg(static_cast<uint8_t>(Register::fp));
                    raw = rv32.read_bytes(fp + var.frame_offset, var.byte_size);
                }
                std::cout << var.name << " (" << var.type << ") = "
                          << format_value(var, raw) << "\n";
                return false;
            }
        }

        std::cout << "Unknown: '" << arg << "'\n";
        return false;
    }

    if (!cmd.empty())
        std::cout << "Commands: c  si  so  print(<reg|var|0xaddr>)\n";
    return false;
}

bool RV32Debugger::should_break() {
    if (breakpoint_addresses.count(rv32.get_pc()) > 0)
        return true;

    if (step_mode == StepMode::Into) {
        // One instruction has already been executed — stop now
        step_mode = StepMode::None;
        return true;
    }

    if (step_mode == StepMode::Over) {
        uint32_t sp = rv32.read_reg(static_cast<uint8_t>(Register::sp));
        // Only consider stopping if SP is at or above the frame we stepped from.
        // While sp < step_sp the CPU is inside a called function — keep running.
        if (sp >= step_sp) {
            auto entry = dwarf.lookup_line(rv32.get_pc());
            if (!entry || entry->line != step_line) {
                step_mode = StepMode::None;
                return true;
            }
        }
    }

    return false;
}