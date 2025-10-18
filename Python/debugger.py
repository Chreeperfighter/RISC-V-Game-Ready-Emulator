from typing import Optional
from cpu import CPU
from elf_loader import (
    get_location,
    get_addresses_for_line,
    get_function_at,
    get_source_lines,
    get_variables_at,
    get_variable_value
)


class Debugger:
    def __init__(self, debug_info: dict):
        self.debug_info = debug_info
        self.breakpoint_hits = 0
        self.last_source_file = None
        self.last_source_line = None

    def on_breakpoint(self, cpu: CPU):
        self.breakpoint_hits += 1

        # Get current location
        location = get_location(self.debug_info, cpu.pc)
        func = get_function_at(self.debug_info, cpu.pc)

        print(f"\n{'=' * 60}")
        print(f"BREAKPOINT HIT (#{self.breakpoint_hits})")
        print(f"{'=' * 60}")

        if location:
            filename, line = location
            func_name = func['name'] if func else "???"
            print(f"Location: {filename}:{line} in {func_name}()")
            print(f"Address:  0x{cpu.pc:08x}")

            # Show source context
            self.show_source_context(filename, line)
        else:
            print(f"Address: 0x{cpu.pc:08x} (no debug info)")

        print(f"{'=' * 60}")

        self.interactive(cpu)

    def show_source_context(self, filename: str, current_line: int, context: int = 3):
        """Show source code around the current line."""
        lines = get_source_lines(self.debug_info, filename)

        if not lines:
            print(f"Source file '{filename}' not available")
            return

        start = max(0, current_line - context - 1)
        end = min(len(lines), current_line + context)

        print()
        for i in range(start, end):
            line_num = i + 1
            marker = ">>>" if line_num == current_line else "   "
            print(f"{marker} {line_num:4d} | {lines[i]}", end='')
        print()

    def list_source(self, filename: Optional[str] = None, line: Optional[int] = None, context: int = 10):
        """List source code. If no args, continue from last position."""
        if filename is None:
            # Use last viewed file/line
            filename = self.last_source_file
            line = self.last_source_line

            if filename is None:
                print("No source file context. Specify file:line")
                return

            # Continue from last line
            line = (line or 0) + context

        lines = get_source_lines(self.debug_info, filename)
        if not lines:
            print(f"Source file '{filename}' not available")
            return

        start = max(0, (line or 1) - 1)
        end = min(len(lines), start + context)

        print(f"\n{filename}:")
        for i in range(start, end):
            print(f"    {i + 1:4d} | {lines[i]}", end='')
        print("")

        self.last_source_file = filename
        self.last_source_line = end

    def set_breakpoint_at_line(self, cpu: CPU, filename: str, line: int) -> bool:
        """Set breakpoint at a source line."""
        addresses = get_addresses_for_line(self.debug_info, filename, line)

        if not addresses:
            print(f"No code found for {filename}:{line}")
            return False

        # Set breakpoint at first address (or all addresses if you prefer)
        addr = addresses[0]
        cpu.add_breakpoint(addr)

        print(f"Breakpoint set at {filename}:{line} (0x{addr:08x})")
        if len(addresses) > 1:
            print(f"  Note: Line maps to {len(addresses)} addresses")

        return True

    def step_line(self, cpu: CPU):
        """Step to next source line (not instruction)."""
        current_location = get_location(self.debug_info, cpu.pc)

        if not current_location:
            # No debug info, just step one instruction
            print("No debug info - stepping one instruction")
            cpu.step_once = True
            return

        filename, cur_line = current_location

        max_steps = 1000
        steps = 0
        next_address = None

        while steps < max_steps:
            cur_line += 1
            steps += 1
            if (filename, cur_line) in self.debug_info["line_to_addr"].keys():
                next_address = self.debug_info["line_to_addr"][(filename, cur_line)][0]
                break
        if next_address is None:
            print("No debug info - stepping one instruction")
            cpu.step_once = True
            return
        cpu.add_breakpoint(next_address)

    def print_backtrace(self, cpu: CPU):
        """Print call stack."""
        print("\nBacktrace:")

        # Current frame
        func = get_function_at(self.debug_info, cpu.pc)
        location = get_location(self.debug_info, cpu.pc)

        if func and location:
            filename, line = location
            print(f"  #0  0x{cpu.pc:08x} in {func['name']}() at {filename}:{line}")
        else:
            print(f"  #0  0x{cpu.pc:08x}")

        # TODO: Walk stack frames using fp/sp to show full backtrace
        print("  (Full backtrace not yet implemented)")

    def list_breakpoints(self, cpu: CPU):
        """List all breakpoints."""
        if not hasattr(cpu, 'breakpoints') or not cpu.breakpoints:
            print("No breakpoints set")
            return

        print("\nBreakpoints:")
        for i, addr in enumerate(cpu.breakpoints, 1):
            location = get_location(self.debug_info, addr)
            func = get_function_at(self.debug_info, addr)

            if location:
                filename, line = location
                func_name = func['name'] if func else "???"
                print(f"  {i}: 0x{addr:08x} at {filename}:{line} in {func_name}()")
            else:
                print(f"  {i}: 0x{addr:08x}")

    def print_variable(self, cpu: CPU, var_name: str):
        """Print the value of a specific variable."""
        # Get variables visible at current PC
        variables = get_variables_at(self.debug_info, cpu.pc)

        # Find the requested variable
        var = None
        for v in variables:
            if v['name'] == var_name:
                var = v
                break

        # Also check global variables
        if var is None:
            for v in self.debug_info['variables']['global']:
                if v['name'] == var_name:
                    var = v
                    break

        if var is None:
            print(f"Variable '{var_name}' not found in current scope")
            return

        # Get variable info
        var_type = var.get('type', 'unknown')
        location = var.get('location', {})
        loc_type = location.get('type', 'unknown')

        # Try to read value
        value = get_variable_value(cpu, var)

        # Format output
        if value is not None:
            # Format based on type
            if 'float' in var_type.lower():
                # Try to interpret as float (requires proper float decoding)
                print(f"{var_name} ({var_type}) = 0x{value:08x} ({value})")
            elif 'char' in var_type.lower() and '*' not in var_type:
                # Single character
                if 0 <= value <= 127:
                    print(f"{var_name} ({var_type}) = {value} '{chr(value)}'")
                else:
                    print(f"{var_name} ({var_type}) = {value}")
            else:
                # Integer
                print(f"{var_name} ({var_type}) = {value} (0x{value:08x})")
        else:
            # Can't read value
            if loc_type == 'optimized_out':
                print(f"{var_name} ({var_type}) = <optimized out>")
            elif loc_type == 'unknown':
                print(f"{var_name} ({var_type}) = <unknown location>")
            else:
                print(f"{var_name} ({var_type}) = <unavailable>")

        # Show location info for debugging
        if loc_type == 'register':
            reg = location.get('register', '?')
            print(f"  Location: register {reg}")
        elif loc_type == 'stack':
            offset = location.get('offset', 0)
            print(f"  Location: stack at fp{offset:+d}")
        elif loc_type == 'memory':
            addr = location.get('address', 0)
            print(f"  Location: memory at 0x{addr:08x}")

    def list_locals(self, cpu: CPU):
        """List all local variables in current scope."""
        func = get_function_at(self.debug_info, cpu.pc)

        if not func:
            print("Not in a function")
            return

        func_name = func['name']
        variables = get_variables_at(self.debug_info, cpu.pc)

        if not variables:
            print(f"No local variables found in {func_name}()")
            return

        print(f"\nLocal variables in {func_name}():")

        for var in variables:
            var_name = var['name']
            var_type = var.get('type', 'unknown')
            is_param = var.get('is_param', False)

            # Try to read value
            value = get_variable_value(cpu, var)

            # Format type indicator
            type_str = "(param)" if is_param else "(local)"

            if value is not None:
                print(f"  {var_name:<15} {type_str:<8} {var_type:<15} = {value} (0x{value:08x})")
            else:
                location = var.get('location', {})
                loc_type = location.get('type', 'unknown')

                if loc_type == 'optimized_out':
                    print(f"  {var_name:<15} {type_str:<8} {var_type:<15} = <optimized out>")
                else:
                    print(f"  {var_name:<15} {type_str:<8} {var_type:<15} = <unavailable>")

    def list_globals(self, cpu: CPU):
        """List all global variables."""
        globals_vars = self.debug_info['variables']['global']

        if not globals_vars:
            print("No global variables found")
            return

        print("\nGlobal variables:")

        for var in globals_vars:
            var_name = var['name']
            var_type = var.get('type', 'unknown')

            # Try to read value
            value = get_variable_value(cpu, var)

            if value is not None:
                print(f"  {var_name:<20} {var_type:<15} = {value} (0x{value:08x})")
            else:
                location = var.get('location', {})
                loc_type = location.get('type', 'unknown')

                if loc_type == 'optimized_out':
                    print(f"  {var_name:<20} {var_type:<15} = <optimized out>")
                else:
                    print(f"  {var_name:<20} {var_type:<15} = <unavailable>")

    def info_variables(self, cpu: CPU):
        """Show summary of available variables."""
        func = get_function_at(self.debug_info, cpu.pc)

        print("\nVariable Information:")
        print("-" * 60)

        # Global variables
        num_globals = len(self.debug_info['variables']['global'])
        print(f"Global variables: {num_globals}")

        # Local variables
        if func:
            func_name = func['name']
            if func_name in self.debug_info['variables']['local']:
                num_locals = len(self.debug_info['variables']['local'][func_name])
                print(f"Local variables in {func_name}(): {num_locals}")
            else:
                print(f"No local variables in {func_name}()")
        else:
            print("Not currently in a function")

        print("\nUse 'info locals' to see local variables")
        print("Use 'info globals' to see global variables")
        print("Use 'print <varname>' to inspect a specific variable")

    def parse(self, cmd: str, cpu: CPU) -> bool:
        do_return = False

        # Step to next source line
        if cmd in ["s", "step"]:
            self.step_line(cpu)
            return True

        # Step one instruction
        elif cmd in ["si", "stepi"]:
            cpu.step_once = True
            return True

        # Continue execution
        elif cmd in ["c", "continue"]:
            return True

        # Show registers
        elif cmd in ["reg", "registers", "info reg"]:
            print(cpu.reg.dump())

        # Read memory
        elif cmd.startswith("mem "):
            parts = cmd.split()
            if len(parts) >= 2:
                addr = int(parts[1], 16)
                count = int(parts[2]) if len(parts) > 2 else 1

                for i in range(count):
                    value = cpu.mcu.read(addr + i * 4, 1)
                    print(f"0x{addr + i * 4:08x}: 0x{value:08x}  {value:11d}")
            else:
                print("Usage: mem <address> [count]")

        # Set breakpoint by address
        elif cmd.startswith("break 0x"):
            addr = int(cmd.split()[1], 16)
            cpu.add_breakpoint(addr)
            print(f"Breakpoint set at 0x{addr:08x}")

        # Set breakpoint by line: break main.c:15
        elif cmd.startswith("break ") and ":" in cmd:
            _, location = cmd.split(maxsplit=1)

            if ":" in location:
                file, line = location.rsplit(":", 1)
                self.set_breakpoint_at_line(cpu, file, int(line))
            else:
                print("Usage: break <file>:<line> or break 0x<address>")

        # List source code
        elif cmd in ["l", "list"]:
            location = get_location(self.debug_info, cpu.pc)
            if location:
                self.list_source(location[0], location[1])
            else:
                print("No source location available")

        # List with specific file:line
        elif cmd.startswith("list "):
            _, location = cmd.split(maxsplit=1)
            if ":" in location:
                file, line = location.rsplit(":", 1)
                self.list_source(file, int(line))
            else:
                print("Usage: list <file>:<line>")

        # Show where we are
        elif cmd in ["where", "bt", "backtrace"]:
            self.print_backtrace(cpu)

        # List breakpoints
        elif cmd in ["info break", "info breakpoints"]:
            self.list_breakpoints(cpu)

        # Print variable
        elif cmd.startswith("print ") or cmd.startswith("p "):
            parts = cmd.split(maxsplit=1)
            if len(parts) >= 2:
                var_name = parts[1]
                self.print_variable(cpu, var_name)
            else:
                print("Usage: print <variable>")

        # Info commands
        elif cmd in ["info locals"]:
            self.list_locals(cpu)

        elif cmd in ["info globals"]:
            self.list_globals(cpu)

        elif cmd in ["info variables", "info vars"]:
            self.info_variables(cpu)

        # Show current location
        elif cmd in ["frame", "info frame"]:
            location = get_location(self.debug_info, cpu.pc)
            func = get_function_at(self.debug_info, cpu.pc)

            if location:
                filename, line = location
                func_name = func['name'] if func else "???"
                print(f"At {filename}:{line} in {func_name}()")
                print(f"PC: 0x{cpu.pc:08x}")
            else:
                print(f"PC: 0x{cpu.pc:08x} (no debug info)")

        # Help
        elif cmd in ["help", "h", "?"]:
            self.print_help()

        # Quit
        elif cmd in ["quit", "q", "exit"]:
            print("Exiting debugger")
            exit(0)

        else:
            print(f"Unknown command: {cmd}")
            print("Type 'help' for available commands")
        return False

    def interactive(self, cpu: CPU):
        """Interactive debugger prompt."""
        while True:
            try:
                cmd = input("debug> ").strip()

                if not cmd:
                    continue

                do_return = self.parse(cmd, cpu)
                if do_return:
                    return
            except KeyboardInterrupt:
                print("\nInterrupted")
                continue
            except Exception as e:
                print(f"Error: {e}")
                import traceback
                traceback.print_exc()

    def print_help(self):
        """Print debugger help."""
        print("""
Debugger Commands:
  Execution:
    s, step              - Step to next source line
    si, stepi            - Step one instruction
    c, continue          - Continue execution

  Breakpoints:
    break <file>:<line>  - Set breakpoint at source line
    break 0x<addr>       - Set breakpoint at address
    info break           - List all breakpoints

  Inspection:
    reg, registers       - Show all registers
    mem <addr> [count]   - Read memory
    print <var>, p <var> - Print variable value
    info locals          - List all local variables
    info globals         - List all global variables
    info variables       - Show variable summary

  Source Code:
    l, list              - List source code at current location
    list <file>:<line>   - List source at specific location
    where, bt            - Show backtrace
    frame                - Show current frame info

  Other:
    help, h, ?           - Show this help
    quit, q              - Exit debugger
""")