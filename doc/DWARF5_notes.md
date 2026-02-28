# DWARF5 Notes

## Overall Structure

A DWARF5 debug build produces several ELF sections that work together:

| Section | Purpose |
|---|---|
| `.debug_info` | Core: all types, functions, variables as DIE trees |
| `.debug_abbrev` | Lookup table defining the structure of `.debug_info` |
| `.debug_line` | PC → file:line mapping |
| `.debug_str` | String pool (names referenced from `.debug_info`) |
| `.debug_line_str` | String pool for `.debug_line` |
| `.debug_frame` | Stack unwinding info |
| `.debug_loclists` | Where variables live at runtime |
| `.debug_rnglists` | Address ranges for non-contiguous functions |
| `.debug_aranges` | Fast lookup: address → compilation unit |

---

## The Core Concept: DIEs

Everything in `.debug_info` is a **DIE** (Debugging Information Entry). They form a tree:

```
DW_TAG_compile_unit  (main.c)
├── DW_TAG_subprogram  (main)
│   ├── DW_TAG_formal_parameter  (argc)
│   └── DW_TAG_variable  (local_var)
└── DW_TAG_base_type  (int)
```

Each DIE has:
- A **tag** — what it describes (function, variable, type, ...)
- **Attributes** — name, address, type, line number, ...

### Compilation Unit Header (`.debug_info`)

```
unit_length         4 bytes     (32-bit DWARF)
version             2 bytes     = 5 for DWARF5
unit_type           1 byte      DW_UT_compile = 0x01
address_size        1 byte      = 4 for RV32
debug_abbrev_offset 4 bytes     offset into .debug_abbrev
--- DIEs follow ---
```

### DIE Encoding

```
abbrev_code         ULEB128     index into abbreviation table (0 = null/terminator)
attribute values    variable    one per attribute, format defined by abbreviation
```

### Abbreviation Table (`.debug_abbrev`)

Defines templates for DIE decoding:

```
abbrev_code         ULEB128
tag                 ULEB128     e.g. DW_TAG_subprogram
has_children        1 byte      DW_CHILDREN_yes (1) or DW_CHILDREN_no (0)
--- attribute specs (pairs) ---
attr_name           ULEB128
attr_form           ULEB128
--- terminated by (0, 0) ---
```

---

## Section Dependencies

```
.debug_info
  ├── .debug_abbrev      (required to decode DIE structure)
  ├── .debug_str         (string attributes: DW_FORM_strp)
  ├── .debug_line        (via DW_AT_stmt_list offset per CU)
  ├── .debug_loclists    (variable locations: DW_AT_location)
  └── .debug_rnglists    (function address ranges: DW_AT_ranges)

.debug_aranges
  └── maps address ranges → CU offsets in .debug_info
```

---

## Binary Encoding

### LEB128

Variable-length integer encoding used everywhere in DWARF. 7 bits per byte, MSB = "more bytes follow":

**Unsigned LEB128 example — value 300:**
```
300 = 0b100101100
split into 7-bit groups (LSB first): 0b0101100  0b0000010
set continuation bits:               10101100   00000010
result: 0xAC 0x02
```

**Signed LEB128** — same but the MSB of the last byte encodes the sign.

### 32-bit vs 64-bit DWARF

Detect by reading the first 4 bytes of any unit header:
- `< 0xFFFFFFF0` → 32-bit format, use as unit length directly
- `= 0xFFFFFFFF` → 64-bit format, read next 8 bytes for actual length

RV32 binaries use **32-bit DWARF**.

### Common Attribute Forms

| Form | Encoding |
|---|---|
| `DW_FORM_addr` | 4 bytes (RV32) |
| `DW_FORM_data1/2/4/8` | 1/2/4/8 bytes |
| `DW_FORM_udata` | Unsigned LEB128 |
| `DW_FORM_sdata` | Signed LEB128 |
| `DW_FORM_strp` | 4-byte offset into `.debug_str` |
| `DW_FORM_line_strp` | 4-byte offset into `.debug_line_str` |
| `DW_FORM_sec_offset` | 4-byte offset into a section |
| `DW_FORM_flag` | 1 byte (0 or 1) |
| `DW_FORM_flag_present` | 0 bytes (implied true) |
| `DW_FORM_ref4` | 4-byte CU-relative DIE reference |
| `DW_FORM_string` | Null-terminated inline string |

---

## Relevant Sections by Debugger Feature

| Goal | Section(s) |
|---|---|
| PC → file:line | `.debug_line` |
| Function name at PC | `.debug_info` + `.debug_aranges` |
| Variable values | `.debug_info` + `.debug_loclists` |
| Stack trace | `.debug_frame` |

---

## Spec References (DWARF5.pdf)

| Topic | Section | Page |
|---|---|---|
| Line number state machine | 6.2 | 148 |
| Call frame information | 6.4 | 171 |
| DWARF expressions | 2.5 | 26 |
| Location descriptions | 2.6 | 38 |
| Code addresses / ranges | 2.17 | 51 |
| Compilation unit entries | 3.1 | 59 |
| Subroutine entries | 3.3 | 75 |
| Data object entries | 4.1 | 97 |
| Binary format / unit headers | 7.5 | 198 |
| LEB128 encoding | 7.6 | 221 |
| Line number binary encoding | 7.22 | 236 |
| Call frame binary encoding | 7.24 | 238 |
