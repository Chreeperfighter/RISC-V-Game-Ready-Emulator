# .debug_info Parsing Notes (DWARF5, RV32)

## Goal
Extract subprograms (functions) and their variables/parameters so the debugger can show variable values at a breakpoint.

---

## CU Header Layout (DW_UT_compile, 32-bit DWARF)

```
[0] uint32_t  unit_length         — total bytes after this field
[4] uint16_t  version             — 5
[6] uint8_t   unit_type           — 0x01 = DW_UT_compile
[7] uint8_t   address_size        — 4 for RV32
[8] uint32_t  debug_abbrev_offset — byte offset into .debug_abbrev
```
Total: 11 bytes. Then the root DIE immediately follows.

Multiple CUs are chained: `next_cu_start = current_start + 4 + unit_length`

---

## DIE Binary Structure

Each DIE:
```
ULEB128   abbrev_code     — 0 = null DIE (end of children), else look up in abbrev table
[attributes...]           — one value per attribute in the abbrev declaration, in order
[children...]             — if has_children=true, child DIEs follow immediately
ULEB128(0)                — null DIE terminates the child list
```

The tree is stored depth-first in the binary. You must read (and skip) ALL attributes of every DIE to keep the offset correct, even ones you don't care about.

---

## Reading Attribute Values by Form

For every attribute in `abbrev_declaration.attributes`, read bytes based on `attr.form`:

```cpp
switch (attr.form) {
    case DW_FORM_addr:         // 4 bytes for RV32
        uint32_t v; memcpy(&v, data+offset, 4); offset += 4;
    case DW_FORM_data1:        offset += 1;
    case DW_FORM_data2:        offset += 2;
    case DW_FORM_data4:        offset += 4;
    case DW_FORM_data8:        offset += 8;
    case DW_FORM_string:       while (data[offset++] != 0); // null-terminated inline
    case DW_FORM_strp:         offset += 4;  // offset into .debug_str
    case DW_FORM_strx1:        offset += 1;  // index into .debug_addr str table
    case DW_FORM_udata:        read_uleb128(data, offset);
    case DW_FORM_sdata:        read_sleb128(data, offset);
    case DW_FORM_ref1:         offset += 1;  // CU-relative DIE offset
    case DW_FORM_ref2:         offset += 2;
    case DW_FORM_ref4:         offset += 4;
    case DW_FORM_ref8:         offset += 8;
    case DW_FORM_ref_udata:    read_uleb128(data, offset);
    case DW_FORM_exprloc:      { uint64_t len = read_uleb128(data, offset); offset += len; }
    case DW_FORM_flag_present: // 0 bytes — implied true, nothing to read
    case DW_FORM_implicit_const: // 0 bytes — value is already in the abbrev table
    case DW_FORM_addrx:        read_uleb128(data, offset);  // index into .debug_addr
    case DW_FORM_loclistx:     read_uleb128(data, offset);  // index into .debug_loclists
    case DW_FORM_rnglistx:     read_uleb128(data, offset);
    case DW_FORM_line_strp:    offset += 4;  // offset into .debug_line_str
    case DW_FORM_sec_offset:   offset += 4;  // offset into another section
}
```

---

## DIE Tags You Care About

### DW_TAG_subprogram (0x2e) — a function
| Attribute      | Code | Form typically used     | Meaning                        |
|----------------|------|-------------------------|--------------------------------|
| DW_AT_name     | 0x03 | strp / string           | Function name                  |
| DW_AT_low_pc   | 0x11 | addr                    | Start address                  |
| DW_AT_high_pc  | 0x12 | data4 / addr            | End address OR length from low_pc |
| DW_AT_frame_base | 0x40 | exprloc                | How to compute frame base (fp) |

**DW_AT_high_pc note:** If the form is `DW_FORM_addr`, it's an absolute address.
If the form is `DW_FORM_data4` (or data1/2/8), it's a **length** — add it to `low_pc` to get the end address.

### DW_TAG_variable (0x34) — a local variable
### DW_TAG_formal_parameter (0x05) — a function argument
| Attribute     | Code | Form typically used    | Meaning                    |
|---------------|------|------------------------|----------------------------|
| DW_AT_name    | 0x03 | strp / string          | Variable name              |
| DW_AT_type    | 0x49 | ref4                   | Offset of type DIE in CU   |
| DW_AT_location | 0x02 | exprloc / loclistx    | Where the value lives      |

### DW_TAG_base_type (0x24) — int, char, etc.
| Attribute       | Code | Meaning         |
|-----------------|------|-----------------|
| DW_AT_name      | 0x03 | "int", "char"   |
| DW_AT_byte_size | 0x0b | bytes to read   |

---

## DW_AT_location — Finding Variable Values

`DW_FORM_exprloc` = ULEB128 length + expression bytes.

The expression is a tiny stack machine. For simple variables GCC emits one of two opcodes:

### DW_OP_fbreg (0x91) — stack variable
```
byte: 0x91
SLEB128: offset from frame base

value is at: memory[frame_base + offset]
frame_base is usually the value of DW_AT_frame_base on the parent DW_TAG_subprogram
```

### DW_OP_reg0..reg31 (0x50–0x6f) — register variable
```
byte: 0x50 + register_number   (no further operands)

value is in: cpu.regs[register_number]
RISC-V: reg0=x0, reg1=ra, reg2=sp, ... reg31=t6
```

### DW_AT_frame_base on DW_TAG_subprogram
Usually `DW_OP_call_frame_cfa` (0x9c) — means "use the CFA from .debug_frame".
For a simple RV32 stack frame, the CFA is typically `sp + frame_size`, which equals `fp`.
Simplest approach: use the value of `sp` register + stack frame size, or just use `fp` (x8/s0).

---

## Parsing Algorithm (Recursive Walk)

```cpp
void walk_dies(data, offset, end, abbrev_table, depth) {
    while (offset < end) {
        uint64_t code = read_uleb128(data, offset);
        if (code == 0) return;  // end of sibling list

        AbbrevDeclaration& decl = abbrev_table[code];
        bool has_children = decl.has_children;

        std::string name;
        uint32_t low_pc = 0, high_pc = 0;
        // ... read all attributes, save what you care about based on decl.tag

        for (auto& attr : decl.attributes) {
            // read attr.form bytes from offset, save if attr.name matches
        }

        if (decl.tag == DW_TAG_subprogram) {
            // save subprogram, recurse into children for variables
        }

        if (has_children)
            walk_dies(data, offset, end, abbrev_table, depth + 1);
    }
}
```

Key rule: **always read and skip every attribute** of every DIE, even ones with tags you don't care about — otherwise offset drifts and everything after is garbage.

---

## String Resolution

- `DW_FORM_strp` → 4-byte offset into `.debug_str`
- `DW_FORM_line_strp` → 4-byte offset into `.debug_line_str`
- `DW_FORM_string` → null-terminated string inline in `.debug_info`

```cpp
// DW_FORM_strp example:
uint32_t str_offset; memcpy(&str_offset, data+offset, 4); offset += 4;
std::string name = reinterpret_cast<const char*>(debug_str_data.data() + str_offset);
```

---

## Type Resolution (DW_AT_type)

`DW_FORM_ref4` = 4-byte offset relative to the start of the current CU.
To resolve: `type_die_offset = cu_start + ref_value`, then walk to that offset to read the type DIE.

For basic display you only need `DW_AT_byte_size` from the type DIE to know how many bytes to read.