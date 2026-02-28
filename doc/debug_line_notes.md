# .debug_line Parser Guide
> Based on DWARF5 spec section 6.2 (pages 148–165)

---

## What is "the matrix"?

The spec talks about a conceptual **matrix** — one row per machine instruction, with columns for:
- address, file, line, column, is_stmt, etc.

This matrix is never stored directly — it would be huge. Instead, the `.debug_line` section stores a **compressed bytecode program** for a state machine. You run the state machine and it **produces** the matrix row by row.

In your code: the matrix = your `line_entries` vector. Every time the state machine says "emit row", you call `line_entries.push_back(...)`.

---

## Binary Layout of .debug_line

The section can contain **multiple compilation units** chained back to back (one per .cpp file). Each one has the same structure:

```
[ Header ]
[ Line Number Program ]   ← the bytecode you run
```

---

## The Header

**IMPORTANT**: The layout differs between DWARF4 and DWARF5. Check your ELF version:
```bash
readelf -wi your_binary | grep "DWARF Version"
```

### DWARF5 Header (version = 5)
Your current struct is correct for this:
```
uint32  unit_length              total bytes after this field
uint16  version                  = 5
uint8   address_size             = 4 for RV32
uint8   segment_selector_size    = 0 (flat address space)
uint32  header_length            bytes from after this field to start of program
uint8   minimum_instruction_length
uint8   maximum_operations_per_instruction  = 1 for RV32 (not VLIW)
uint8   default_is_stmt
int8    line_base
uint8   line_range
uint8   opcode_base              first special opcode (typically 13)
uint8   standard_opcode_lengths[opcode_base - 1]   one byte per standard opcode
--- then file/directory tables (see below) ---
```

### DWARF4 Header (version = 4)
Same but **missing** `address_size` and `segment_selector_size`:
```
uint32  unit_length
uint16  version                  = 4
uint32  header_length
uint8   minimum_instruction_length
uint8   maximum_operations_per_instruction
uint8   default_is_stmt
int8    line_base
uint8   line_range
uint8   opcode_base
uint8   standard_opcode_lengths[opcode_base - 1]
--- then file/directory tables (see below) ---
```

### program_start
`header_length` tells you how many bytes come after itself before the program starts.

```cpp
// DWARF5:
uint32_t program_start = 4 + 2 + 1 + 1 + 4 + header.header_length;
// DWARF4:
uint32_t program_start = 4 + 2 + 4 + header.header_length;
```

You can skip parsing the file/directory tables entirely by using `program_start` as the loop start offset. BUT you lose filenames — they'll show as empty strings.

---

## File/Directory Tables (needed for filenames)

These live between `standard_opcode_lengths` and the program. Your `header_length` covers them.

### DWARF4 File/Directory Tables

**Directory table** — comes first. Sequence of null-terminated strings. Ends with a single `\0`.
```
"path/to/dir1\0"
"path/to/dir2\0"
"\0"              ← end marker
```
Directories are indexed starting at **1**. Index 0 = compilation directory (not stored here).

**File name table** — comes next. Sequence of entries. Each entry:
```
"filename.c\0"    null-terminated filename
ULEB128           directory index (0 = use comp dir, 1+ = index into dir table above)
ULEB128           last modified time (ignore it)
ULEB128           file size in bytes  (ignore it)
```
Terminated by a single `\0` byte. Files are indexed starting at **1**.

```cpp
// Parse DWARF4 directory table
std::vector<std::string> dirs;
dirs.push_back("");  // index 0 = comp dir (placeholder)
while (data[offset] != 0) {
    dirs.push_back(reinterpret_cast<const char*>(data + offset));
    offset += dirs.back().size() + 1;
}
offset++;  // skip end marker

// Parse DWARF4 file name table
std::vector<std::string> files;
files.push_back("");  // index 0 unused, files start at 1
while (data[offset] != 0) {
    std::string name = reinterpret_cast<const char*>(data + offset);
    offset += name.size() + 1;
    uint64_t dir_idx = read_uleb128(data, offset);
    read_uleb128(data, offset);  // mtime, ignore
    read_uleb128(data, offset);  // size, ignore
    std::string full = (dir_idx > 0 && dir_idx < dirs.size())
                       ? dirs[dir_idx] + "/" + name : name;
    files.push_back(full);
}
offset++;  // skip end marker
```

### DWARF5 File/Directory Tables
More complex — uses a format-descriptor approach. Directories:
```
uint8   directory_entry_format_count      how many (type,form) pairs follow
for each: ULEB128 type, ULEB128 form      e.g. DW_LNCT_path + DW_FORM_string
ULEB128 directories_count
for each directory: values matching the format above
```
Same structure for files (`file_name_entry_format_count`, `file_names_count`, etc.).
Files are indexed starting at **0** in DWARF5 (index 0 = primary source file).

For simplicity, just handle `DW_LNCT_path` with `DW_FORM_string` (inline null-terminated string) — that's what GCC emits most of the time.

---

## State Machine Registers (initial values)

```cpp
uint32_t address     = 0;
uint32_t op_index    = 0;
uint32_t file        = 1;      // 1-indexed in DWARF4, 0-indexed in DWARF5
uint32_t line        = 1;
uint32_t column      = 0;
bool     is_stmt     = header.default_is_stmt;
bool     basic_block = false;
bool     end_sequence= false;
bool     prologue_end= false;
bool     epilogue_begin = false;
uint32_t isa         = 0;
uint32_t discriminator = 0;
```

---

## The State Machine Loop

```
while offset < end of compilation unit:
    read one byte → opcode

    if opcode == 0:        → extended opcode
    elif opcode < opcode_base: → standard opcode
    else:                  → special opcode
```

---

## Case 1: Extended Opcodes (opcode == 0)

```cpp
if (opcode == 0) {
    size_t ext_len = read_uleb128(data, offset);  // length of what follows
    uint8_t ext_op = data[offset++];

    if (ext_op == DW_LNE_set_address) {           // = 2
        // Read address_size bytes (4 for RV32)
        memcpy(&address, data + offset, 4);
        offset += 4;
        op_index = 0;

    } else if (ext_op == DW_LNE_end_sequence) {   // = 1
        end_sequence = true;
        // emit row (but don't store it — it marks end, not real code)
        // reset all registers to initial state
        address = 0; op_index = 0; file = 1; line = 1; column = 0;
        is_stmt = header.default_is_stmt;
        basic_block = false; end_sequence = false;
        prologue_end = false; epilogue_begin = false;
        isa = 0; discriminator = 0;

    } else if (ext_op == DW_LNE_set_discriminator) { // = 4
        discriminator = read_uleb128(data, offset);

    } else {
        // unknown extended opcode — skip it using ext_len
        offset += ext_len - 1;  // -1 because we already read ext_op
    }
}
```

---

## Case 2: Standard Opcodes (1 <= opcode < opcode_base)

```cpp
auto emit_row = [&]() {
    if (!end_sequence && line > 0) {
        std::string fname = (file > 0 && file <= files.size()) ? files[file - 1] : "";
        line_entries.push_back({address, line, column, fname});
    }
};

switch (opcode) {
    case DW_LNS_copy:             // 1 — emit row
        emit_row();
        discriminator = 0;
        basic_block = false;
        prologue_end = false;
        epilogue_begin = false;
        break;

    case DW_LNS_advance_pc: {     // 2 — advance address
        uint64_t op_adv = read_uleb128(data, offset);
        address += op_adv * header.minimum_instruction_length;
        break;
    }

    case DW_LNS_advance_line:     // 3 — advance line (signed!)
        line += read_sleb128(data, offset);
        break;

    case DW_LNS_set_file:         // 4
        file = read_uleb128(data, offset);
        break;

    case DW_LNS_set_column:       // 5
        column = read_uleb128(data, offset);
        break;

    case DW_LNS_negate_stmt:      // 6
        is_stmt = !is_stmt;
        break;

    case DW_LNS_set_basic_block:  // 7
        basic_block = true;
        break;

    case DW_LNS_const_add_pc: {   // 8 — same advance as special opcode 255, no operand
        uint8_t adjusted = 255 - header.opcode_base;
        address += (adjusted / header.line_range) * header.minimum_instruction_length;
        break;
    }

    case DW_LNS_fixed_advance_pc: { // 9 — uint16, NOT LEB128, NOT multiplied by min_inst_len
        uint16_t delta;
        memcpy(&delta, data + offset, 2);
        offset += 2;
        address += delta;
        op_index = 0;
        break;
    }

    case DW_LNS_set_prologue_end:  // 10
        prologue_end = true;
        break;

    case DW_LNS_set_epilogue_begin: // 11
        epilogue_begin = true;
        break;

    case DW_LNS_set_isa:           // 12
        isa = read_uleb128(data, offset);
        break;

    default:
        // Unknown standard opcode — skip its operands using standard_opcode_lengths
        for (int i = 0; i < standard_opcode_lengths[opcode - 1]; i++)
            read_uleb128(data, offset);
        break;
}
```

---

## Case 3: Special Opcodes (opcode >= opcode_base)

These are the most common. One byte, no operands. They advance both address and line, then emit a row.

```cpp
else {
    uint8_t adjusted = opcode - header.opcode_base;

    // Advance line
    line += header.line_base + (adjusted % header.line_range);

    // Advance address (for RV32, max_ops_per_instruction = 1, so simplified)
    uint32_t op_adv = adjusted / header.line_range;
    address += op_adv * header.minimum_instruction_length;
    // (Full formula if max_ops > 1: address += min_inst_len * ((op_index + op_adv) / max_ops))
    // (op_index = (op_index + op_adv) % max_ops — always 0 for RV32)

    // Emit row
    emit_row();

    // Reset per-row flags
    basic_block  = false;
    prologue_end = false;
    epilogue_begin = false;
    discriminator = 0;
}
```

---

## Loop termination

Each compilation unit ends with `DW_LNE_end_sequence`. If your `.debug_line` section has multiple CUs, after `end_sequence` the next byte starts a new header.

The simplest approach: run the loop until `offset >= section.data.size()`. Each `end_sequence` resets state so the next CU starts clean.

---

## What "emit row" means in your code

```cpp
auto emit_row = [&]() {
    if (end_sequence) return;  // end_sequence row marks past-end address, not real code
    std::string fname = "";
    if (file >= 1 && file - 1 < files.size())
        fname = files[file - 1];   // DWARF4: 1-indexed; DWARF5: 0-indexed
    line_entries.push_back({address, line, column, fname});
};
```

---

## Summary: what to implement first

1. Check `header.version` (4 or 5) and parse accordingly
2. Parse `standard_opcode_lengths` (opcode_base-1 bytes after fixed header fields)
3. Parse the file/directory table to fill `std::vector<std::string> files`
4. Run the while loop with the three cases above
5. After the loop, the `line_entries` vector has all the data, sorted by `parse()`