from elftools.elf.elffile import ELFFile
from pathlib import Path
from typing import Dict, List, Tuple, Optional


def load_elf(filename: str, cpu: "CPU") -> (Dict, bool):
    """
    Load ELF file into CPU memory and extract debug information.

    Returns debug_info dict with:
        - functions: List of function metadata
        - addr_to_line: Address -> (file, line) mapping
        - line_to_addr: (file, line) -> [addresses] mapping
        - source_cache: Cached source file contents
        - variables: Global and local variable information
    """
    debug_info = {
        "functions": [],
        "addr_to_line": {},  # Address -> (filename, line)
        "line_to_addr": {},  # (filename, line) -> [addresses]
        "source_cache": {},  # filename -> {'path': str, 'lines': List[str]}
        "variables": {  # Variable information
            "global": [],
            "local": {}  # function_name -> [variables]
        }
    }

    with open(filename, "rb") as f:
        elf = ELFFile(f)

        # Load segments into memory
        _load_segments(elf, cpu)

        # Set program counter to entry point
        cpu.pc = elf['e_entry']

        # Extract debug information
        if elf.has_dwarf_info():
            dwarf = elf.get_dwarf_info()
            _extract_debug_info(dwarf, debug_info)
            debug = True
        else:
            print("Warning: No DWARF debug information found. Compile with -g")
            debug = False

    return debug_info, debug


def _load_segments(elf: ELFFile, cpu: "CPU") -> None:
    """Load PT_LOAD segments into CPU memory."""
    for segment in elf.iter_segments():
        if segment['p_type'] != 'PT_LOAD':
            continue

        addr = segment['p_vaddr']
        data = segment.data()
        filesz = segment['p_filesz']

        cpu.mcu.write(addr, data, filesz, write_bytes=True)


def _extract_debug_info(dwarf, debug_info: Dict) -> None:
    """Extract line numbers, functions, variables, and source files from DWARF."""

    for cu in dwarf.iter_CUs():
        # Extract line number information
        _extract_line_info(dwarf, cu, debug_info)

        # Extract function and variable information
        _extract_functions_and_variables(cu, debug_info)


def _extract_line_info(dwarf, cu, debug_info: Dict) -> None:
    """Extract line number program information."""
    lineprog = dwarf.line_program_for_CU(cu)
    if lineprog is None:
        return

    file_entries = lineprog['file_entry']

    for entry in lineprog.get_entries():
        if entry.state is None or entry.state.address == 0:
            continue

        state = entry.state

        # Get filename
        file_index = state.file - 1
        if not (0 <= file_index < len(file_entries)):
            continue

        filename = file_entries[file_index].name.decode('utf-8')
        line = state.line
        address = state.address

        # Address -> (file, line)
        debug_info["addr_to_line"][address] = (filename, line)

        # (file, line) -> [addresses] - reverse lookup
        key = (filename, line)
        if key not in debug_info["line_to_addr"]:
            debug_info["line_to_addr"][key] = []
        debug_info["line_to_addr"][key].append(address)

        # Cache source file if not already cached
        if filename not in debug_info["source_cache"]:
            _cache_source_file(filename, cu, file_entries[file_index], lineprog, debug_info)


def _extract_functions_and_variables(cu, debug_info: Dict) -> None:
    """Extract function metadata and variables from DIEs."""
    lineprog = cu.dwarfinfo.line_program_for_CU(cu)
    if lineprog is None:
        file_entries = []
    else:
        file_entries = lineprog['file_entry']

    for die in cu.iter_DIEs():
        # Extract functions and their local variables
        if die.tag == 'DW_TAG_subprogram':
            _extract_function_info(die, cu, file_entries, lineprog, debug_info)

        # Extract global variables (top-level only)
        elif die.tag == 'DW_TAG_variable':
            parent = die.get_parent()
            if parent and parent.tag == 'DW_TAG_compile_unit':
                var_info = _extract_variable_info(die, cu, is_global=True)
                if var_info:
                    debug_info["variables"]["global"].append(var_info)


def _extract_function_info(die, cu, file_entries, lineprog, debug_info: Dict) -> None:
    """Extract function metadata and its local variables."""
    attrs = die.attributes

    # Skip forward declarations
    if attrs.get("DW_AT_declaration", False):
        return

    # Extract required attributes
    if "DW_AT_name" not in attrs or "DW_AT_low_pc" not in attrs:
        return

    name = attrs["DW_AT_name"].value
    if isinstance(name, bytes):
        name = name.decode('utf-8')

    low_pc = attrs["DW_AT_low_pc"].value

    # Handle high_pc (can be address or offset)
    high_pc_attr = attrs.get("DW_AT_high_pc")
    if high_pc_attr is None:
        return

    if high_pc_attr.form == "DW_FORM_addr":
        high_pc = high_pc_attr.value
    else:
        high_pc = low_pc + high_pc_attr.value

    # Get source file info
    decl_file = attrs.get("DW_AT_decl_file")
    decl_line = attrs.get("DW_AT_decl_line")

    if decl_file and decl_line and file_entries:
        file_index = decl_file.value - 1
        if 0 <= file_index < len(file_entries):
            file_entry = file_entries[file_index]
            filename = file_entry.name.decode('utf-8')

            # Get full path
            dir_index = file_entry.dir_index
            if dir_index == 0:
                comp_dir = cu.get_top_DIE().attributes.get('DW_AT_comp_dir')
                directory = comp_dir.value.decode('utf-8') if comp_dir else '.'
            else:
                directory = lineprog['include_directory'][dir_index - 1].decode('utf-8')

            full_path = f"{directory}/{filename}"
        else:
            filename = "???"
            full_path = "???"
    else:
        filename = "???"
        full_path = "???"

    # Add function info
    debug_info["functions"].append({
        "name": name,
        "start": low_pc,
        "end": high_pc,
        "decl_line": decl_line.value if decl_line else 0,
        "file": filename,
        "path": full_path
    })

    # Extract local variables and parameters for this function
    debug_info["variables"]["local"][name] = []

    for child in die.iter_children():
        # Local variables
        if child.tag == 'DW_TAG_variable':
            var_info = _extract_variable_info(child, cu, is_global=False)
            if var_info:
                debug_info["variables"]["local"][name].append(var_info)

        # Function parameters
        elif child.tag == 'DW_TAG_formal_parameter':
            param_info = _extract_variable_info(child, cu, is_param=True)
            if param_info:
                debug_info["variables"]["local"][name].append(param_info)


def _extract_variable_info(die, cu, is_param=False, is_global=False) -> Optional[Dict]:
    """Extract variable metadata from a DIE."""
    attrs = die.attributes

    if 'DW_AT_name' not in attrs:
        return None

    name = attrs['DW_AT_name'].value
    if isinstance(name, bytes):
        name = name.decode('utf-8')

    var_info = {
        'name': name,
        'is_param': is_param,
        'is_global': is_global,
    }

    # Get type information
    if 'DW_AT_type' in attrs:
        type_offset = attrs['DW_AT_type'].value + cu.cu_offset
        var_info['type'] = _get_type_name(cu, type_offset)
    else:
        var_info['type'] = 'void'

    # Get variable location (register or memory)
    if 'DW_AT_location' in attrs:
        location_attr = attrs['DW_AT_location']
        var_info['location'] = _parse_location(location_attr)
    else:
        var_info['location'] = {'type': 'optimized_out'}

    # Get source location
    if 'DW_AT_decl_line' in attrs:
        var_info['decl_line'] = attrs['DW_AT_decl_line'].value

    # Get address range where variable is valid (for non-globals)
    if not is_global:
        # Try to get from parent function
        parent = die.get_parent()
        if parent and parent.tag == 'DW_TAG_subprogram':
            parent_attrs = parent.attributes
            if 'DW_AT_low_pc' in parent_attrs and 'DW_AT_high_pc' in parent_attrs:
                low_pc = parent_attrs['DW_AT_low_pc'].value
                high_pc_attr = parent_attrs['DW_AT_high_pc']

                if high_pc_attr.form == "DW_FORM_addr":
                    high_pc = high_pc_attr.value
                else:
                    high_pc = low_pc + high_pc_attr.value

                var_info['live_range'] = (low_pc, high_pc)

    return var_info


def _get_type_name(cu, type_offset) -> str:
    """Get the name of a type from its DIE offset."""
    try:
        # Find the type DIE by offset
        for die in cu.iter_DIEs():
            if die.offset == type_offset:
                # Direct name
                if 'DW_AT_name' in die.attributes:
                    name = die.attributes['DW_AT_name'].value
                    return name.decode('utf-8') if isinstance(name, bytes) else name

                # Handle base types
                if die.tag == 'DW_TAG_base_type':
                    encoding = die.attributes.get('DW_AT_encoding')
                    byte_size = die.attributes.get('DW_AT_byte_size')

                    if encoding and byte_size:
                        enc_val = encoding.value
                        size = byte_size.value

                        # Map DWARF encoding to type names
                        type_map = {
                            (5, 1): 'signed char',
                            (5, 2): 'short',
                            (5, 4): 'int',
                            (5, 8): 'long long',
                            (7, 1): 'unsigned char',
                            (7, 2): 'unsigned short',
                            (7, 4): 'unsigned int',
                            (7, 8): 'unsigned long long',
                            (4, 4): 'float',
                            (4, 8): 'double',
                            (2, 1): 'bool',
                        }
                        return type_map.get((enc_val, size), f'unknown_{size}byte')

                # Handle pointer types
                elif die.tag == 'DW_TAG_pointer_type':
                    if 'DW_AT_type' in die.attributes:
                        pointed_offset = die.attributes['DW_AT_type'].value + cu.cu_offset
                        pointed_type = _get_type_name(cu, pointed_offset)
                        return f'{pointed_type}*'
                    return 'void*'

                # Handle const types
                elif die.tag == 'DW_TAG_const_type':
                    if 'DW_AT_type' in die.attributes:
                        base_offset = die.attributes['DW_AT_type'].value + cu.cu_offset
                        base_type = _get_type_name(cu, base_offset)
                        return f'const {base_type}'
                    return 'const'

                # Handle typedef
                elif die.tag == 'DW_TAG_typedef':
                    if 'DW_AT_name' in die.attributes:
                        name = die.attributes['DW_AT_name'].value
                        return name.decode('utf-8') if isinstance(name, bytes) else name

                # Handle arrays
                elif die.tag == 'DW_TAG_array_type':
                    if 'DW_AT_type' in die.attributes:
                        elem_offset = die.attributes['DW_AT_type'].value + cu.cu_offset
                        elem_type = _get_type_name(cu, elem_offset)
                        return f'{elem_type}[]'
                    return 'array'

                return 'unknown'
    except Exception as e:
        pass

    return 'unknown'


def _parse_location(location_attr) -> Dict:
    """Parse DW_AT_location to determine where variable is stored."""
    try:
        if hasattr(location_attr, 'value'):
            expr = location_attr.value

            if isinstance(expr, int):
                # Simple address
                return {
                    'type': 'memory',
                    'address': expr
                }

            if isinstance(expr, (bytes, bytearray)):
                if len(expr) == 0:
                    return {'type': 'optimized_out'}

                op = expr[0]

                # DW_OP_reg0 through DW_OP_reg31 (0x50-0x6f)
                if 0x50 <= op <= 0x6f:
                    reg_num = op - 0x50

                    # Map RISC-V register numbers to names
                    reg_names = [
                        'zero', 'ra', 'sp', 'gp', 'tp', 't0', 't1', 't2',
                        's0', 's1', 'a0', 'a1', 'a2', 'a3', 'a4', 'a5',
                        'a6', 'a7', 's2', 's3', 's4', 's5', 's6', 's7',
                        's8', 's9', 's10', 's11', 't3', 't4', 't5', 't6'
                    ]

                    reg_name = reg_names[reg_num] if reg_num < len(reg_names) else f'x{reg_num}'

                    return {
                        'type': 'register',
                        'register': reg_name,
                        'reg_num': reg_num
                    }

                # DW_OP_fbreg (frame base + offset) - 0x91
                elif op == 0x91:
                    if len(expr) >= 2:
                        # Read signed LEB128 offset
                        offset = _read_leb128_signed(expr[1:])
                        return {
                            'type': 'stack',
                            'offset': offset
                        }

                # DW_OP_addr (absolute address) - 0x03
                elif op == 0x03:
                    if len(expr) >= 5:
                        # Read 4-byte address (little-endian)
                        addr = int.from_bytes(expr[1:5], 'little')
                        return {
                            'type': 'memory',
                            'address': addr
                        }
    except Exception as e:
        pass

    return {'type': 'unknown'}


def _read_leb128_signed(data: bytes) -> int:
    """Read signed LEB128 integer from bytes."""
    result = 0
    shift = 0

    for byte in data:
        result |= (byte & 0x7f) << shift
        shift += 7

        if (byte & 0x80) == 0:
            # Sign extend if negative
            if shift < 32 and (byte & 0x40):
                result |= -(1 << shift)
            break

    return result


def _cache_source_file(filename: str, cu, file_entry, lineprog, debug_info: Dict) -> None:
    """Cache source file contents for quick access."""
    # Get directory
    dir_index = file_entry.dir_index
    if dir_index == 0:
        comp_dir = cu.get_top_DIE().attributes.get('DW_AT_comp_dir')
        directory = comp_dir.value.decode('utf-8') if comp_dir else '.'
    else:
        directory = lineprog['include_directory'][dir_index - 1].decode('utf-8')

    full_path = Path(directory) / filename

    if not full_path.exists():
        # Fallback: try project source folder
        project_src = Path("/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs/test")
        full_path = project_src / filename

    if not full_path.exists():
        # Fallback: try Programs source folder
        project_src = Path("/Users/mark.verbeek/CLionProjects/RISC-V-Game-Ready-Emulator/Programs")
        full_path = project_src / filename

    # Try to read source file
    try:
        with open(full_path, 'r') as f:
            lines = f.readlines()

        debug_info["source_cache"][filename] = {
            "path": str(full_path),
            "lines": lines
        }
    except (FileNotFoundError, IOError):
        # Source file not available, that's okay
        debug_info["source_cache"][filename] = {
            "path": str(full_path),
            "lines": []
        }


# Helper functions for using debug info

def get_location(debug_info: Dict, pc: int) -> Optional[Tuple[str, int]]:
    """Get source location (file, line) for a given PC."""
    return debug_info["addr_to_line"].get(pc)


def get_addresses_for_line(debug_info: Dict, filename: str, line: int) -> List[int]:
    """Get all addresses corresponding to a source line."""
    return debug_info["line_to_addr"].get((filename, line), [])


def get_function_at(debug_info: Dict, pc: int) -> Optional[Dict]:
    """Get function info for a given PC."""
    for func in debug_info["functions"]:
        if func["start"] <= pc < func["end"]:
            return func
    return None


def get_source_lines(debug_info: Dict, filename: str) -> List[str]:
    """Get cached source lines for a file."""
    cache = debug_info["source_cache"].get(filename)
    return cache["lines"] if cache else []


def get_variables_at(debug_info: Dict, pc: int) -> List[Dict]:
    """Get all variables visible at a given PC."""
    func = get_function_at(debug_info, pc)
    if not func:
        return []

    func_name = func['name']
    if func_name not in debug_info["variables"]["local"]:
        return []

    # Return variables whose live_range includes this PC
    visible_vars = []
    for var in debug_info["variables"]["local"][func_name]:
        if 'live_range' not in var:
            # Assume visible throughout function
            visible_vars.append(var)
        else:
            low, high = var['live_range']
            if low <= pc < high:
                visible_vars.append(var)

    return visible_vars


def get_variable_value(cpu: "CPU", var: Dict) -> Optional[any]:
    """Read the value of a variable from CPU state."""
    location = var.get('location', {})
    loc_type = location.get('type')

    if loc_type == 'register':
        reg_num = location.get('reg_num')
        if reg_num is not None:
            return cpu.reg.read(reg_num)

    elif loc_type == 'stack':
        offset = location.get('offset')
        if offset is not None:
            # Use frame pointer (s0/x8) as base
            fp = cpu.reg.read(8)
            addr = fp + offset
            # Read 4 bytes (adjust based on type size if needed)
            return cpu.mcu.read(addr, 1)

    elif loc_type == 'memory':
        addr = location.get('address')
        if addr is not None:
            return cpu.mcu.read(addr, 1)

    return None