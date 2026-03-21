//
// Created by Mark Verbeek on 08.11.25.
//

#ifdef EMULATOR_DEBUG
#include "RV32Debugger.hpp"
#include "Config.hpp"

#include <fstream>
#include <iostream>
#include <sstream>
#include <iomanip>

RV32Debugger::RV32Debugger(RV32 &rv32_obj) : rv32(rv32_obj) {
    dwarf.parse(g_config.binary_path);
    for (const auto &bp: g_config.breakpoints) {
        if (bp.address.has_value())
            breakpoint_addresses.insert(*bp.address);
        else if (bp.line.has_value() && bp.file.has_value()) {
            std::optional<uint32_t> address = dwarf.lookup_address(bp.file.value(), bp.line.value());
            if (address.has_value())
                breakpoint_addresses.insert(address.value());
        }
    }
    parse_disassembly();
}

bool RV32Debugger::parse_disassembly() {
    FILE *pipe = popen(("riscv64-unknown-elf-objdump -d " + g_config.binary_path).c_str(), "r");
    if (pipe == nullptr) {
        return false;
    }
    char line[256];
    while (fgets(line, sizeof(line), pipe)) {
        uint32_t pc;
        char rest[256];

        if (sscanf(line, " %x: %*x %[^\n]", &pc, rest) == 2) {
            std::string s = rest;
            for (char &c: s) if (c == '\t') c = ' ';
            assembly[pc] = s;
        }
        char label[256];
        if (sscanf(line, " %x <%255[^>]>:", &pc, label) == 2) {
            assembly_labels[pc] = label;
        }
    }
    pclose(pipe);
    return true;
}

// --- UI helpers ---

static std::string dashes(int n) {
    std::string s;
    for (int i = 0; i < n; i++) s += "─";
    return s;
}

static int display_width(const std::string &s) {
    int w = 0;
    for (unsigned char c: s)
        if ((c & 0xC0) != 0x80) w++;
    return w;
}

static void draw_box(const std::string &title, const std::vector<std::string> &lines, int width) {
    int fill = width - 6 - display_width(title);
    std::cout << "╭── " << title << " " << dashes(fill < 0 ? 0 : fill) << "╮\n";

    int content_w = width - 4;
    for (const auto &line: lines) {
        int dw = display_width(line);
        std::string s = line;
        if (dw < content_w) s += std::string(content_w - dw, ' ');
        std::cout << "│ " << s << " │\n";
    }

    std::cout << "╰" << dashes(width - 2) << "╯\n";
}

static int needed_width(const std::string &title, const std::vector<std::string> &lines) {
    int w = display_width(title) + 6;
    for (const auto &line: lines)
        w = std::max(w, display_width(line) + 4);
    return w;
}

void RV32Debugger::on_trap() {
    uint32_t pc = rv32.get_pc();
    std::optional<LineEntry> entry = dwarf.lookup_line(pc);

    std::string reason;
    switch (rv32.trap) {
        case TrapReason::Breakpoint: reason = "EBREAK";
            break;
        case TrapReason::IllegalInst: reason = "Illegal Instruction";
            rv32.running = false;
            break;
        case TrapReason::MemFault: reason = "Memory Fault";
            rv32.running = false;
            break;
        case TrapReason::None: reason = "Breakpoint";
            break;
    }
    std::cerr << rv32.trap_message << std::endl;

    // Source box
    std::string source_title;
    std::vector<std::string> source_lines;

    if (entry.has_value()) {
        source_title = "Source: " + entry->file;
        std::ifstream src(entry->file);
        if (src) {
            uint32_t target = entry->line;
            uint32_t show_from = target > 2 ? target - 2 : 1;
            uint32_t show_to = target + 2;
            std::string line;
            uint32_t lineno = 1;
            while (lineno < show_from && std::getline(src, line)) lineno++;
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

    // Disassembly box
    std::vector<std::string> asm_lines;
    if (!assembly.empty()) {
        // Find the function containing pc (last label <= pc)
        auto label_it = assembly_labels.upper_bound(pc);
        uint32_t func_start = label_it != assembly_labels.begin()
                                  ? std::prev(label_it)->first
                                  : 0;

        // Find the next function start (first label > pc)
        uint32_t func_end = label_it != assembly_labels.end()
                                ? label_it->first
                                : UINT32_MAX;

        // Clamp to ±4 instructions within the function bounds
        uint32_t show_from = std::max(func_start, pc > 16 ? pc - 16 : 0);
        uint32_t show_to = std::min(func_end, pc + 16);

        asm_lines.push_back("  <" + (std::prev(label_it) != assembly_labels.end()
                                         ? assembly_labels[func_start]
                                         : "?") + ">:");
        if (show_from > func_start) {
            asm_lines.push_back("  ...");
        }

        auto it = assembly.lower_bound(show_from);
        auto end = assembly.upper_bound(show_to);
        for (; it != end; ++it) {
            std::ostringstream ss;
            ss << (it->first == pc ? "→ " : "  ")
                    << "0x" << std::hex << std::setfill('0') << std::setw(8) << it->first
                    << "  " << it->second;
            asm_lines.push_back(ss.str());
        }
        if (show_to < func_end) {
            asm_lines.push_back("  ...");
        }
    }

    // State box
    std::vector<std::string> state_lines; {
        std::ostringstream ss;
        ss << "0x" << std::hex << std::setfill('0') << std::setw(8) << pc;
        std::string loc = entry.has_value() ? entry->file + ":" + std::to_string(entry->line) : "?";
        state_lines.push_back("PC:       " + ss.str());
        state_lines.push_back("Reason:   " + reason);
        state_lines.push_back("Location: " + loc);
    }

    int width = needed_width("State", state_lines);
    if (!source_title.empty())
        width = std::max(width, needed_width(source_title, source_lines));
    if (!asm_lines.empty())
        width = std::max(width, needed_width("Disassembly", asm_lines));

    if (!source_title.empty())
        draw_box(source_title, source_lines, width);
    if (!asm_lines.empty())
        draw_box("Disassembly", asm_lines, width);
    draw_box("State", state_lines, width);

    if (!rv32.running) return;

    std::string cmd;
    std::cout << "(debug) > ";
    while (std::getline(std::cin, cmd)) {
        if (cmd == "c") break;
        if (handle_command(cmd)) break;
        std::cout << "(debug) > ";
    }
}

static std::optional<uint8_t> find_register(const std::string &name) {
    for (int i = 0; i < 32; i++) {
        std::istringstream ss(register_names[i]);
        std::string part;
        while (std::getline(ss, part, '/'))
            if (part == name) return static_cast<uint8_t>(i);
    }
    return std::nullopt;
}

bool RV32Debugger::handle_command(const std::string &cmd) {
    if (cmd == "si") {
        step_mode = StepMode::Into;
        return true;
    }

    if (cmd == "so") {
        step_sp = rv32.read_reg(static_cast<uint8_t>(Register::sp));
        auto entry = dwarf.lookup_line(rv32.get_pc());
        step_line = entry ? entry->line : 0;
        step_mode = StepMode::Over;
        return true;
    }

    if (cmd.rfind("print(", 0) == 0 && cmd.back() == ')') {
        std::string arg = cmd.substr(6, cmd.size() - 7);

        if (arg.rfind("0x", 0) == 0 || arg.rfind("0X", 0) == 0) {
            try {
                uint32_t addr = std::stoul(arg, nullptr, 16);
                auto bytes = rv32.read_bytes(addr, 4);
                uint32_t val = 0;
                memcpy(&val, bytes.data(), 4);
                std::cout << "*(" << arg << ") = 0x" << std::hex << val
                        << " (" << std::dec << val << ")\n";
            } catch (...) {
                std::cout << "Invalid address: " << arg << "\n";
            }
            return false;
        }

        if (auto idx = find_register(arg)) {
            uint32_t val = rv32.read_reg(*idx);
            std::cout << arg << " = 0x" << std::hex << val
                    << " (" << std::dec << val << ")\n";
            return false;
        }

        std::cout << "Unknown: '" << arg << "'\n";
        return false;
    }

    if (!cmd.empty())
        std::cout << "Commands: c  si  so  print(<reg|0xaddr>)\n";
    return false;
}

bool RV32Debugger::should_break() {
    if (breakpoint_addresses.count(rv32.get_pc()) > 0)
        return true;

    if (step_mode == StepMode::Into) {
        step_mode = StepMode::None;
        return true;
    }

    if (step_mode == StepMode::Over) {
        uint32_t sp = rv32.read_reg(static_cast<uint8_t>(Register::sp));
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
#endif