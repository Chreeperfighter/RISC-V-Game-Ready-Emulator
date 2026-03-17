# RISC-V Game-Ready Emulator — Technische Gesamtdokumentation

> Erstellt: 2026-03-18
> Autor: Claude Code (automatisch generiert aus Quellcode-Analyse)

---

## Inhaltsverzeichnis

1. [Projektziel & Überblick](#1-projektziel--überblick)
2. [Architektur auf höchster Ebene](#2-architektur-auf-höchster-ebene)
3. [CPU-Emulation (RV32)](#3-cpu-emulation-rv32)
4. [Instruktions-Pipeline](#4-instruktions-pipeline)
5. [Semihosting-Interface](#5-semihosting-interface)
6. [Speicher & Adressraum](#6-speicher--adressraum)
7. [ELF-Loader](#7-elf-loader)
8. [Datei-I/O (FileHandleTable)](#8-datei-io-filehandletable)
9. [Display-System (SDL2)](#9-display-system-sdl2)
10. [Input-System (SDL2)](#10-input-system-sdl2)
11. [Konfiguration (Config + TOML)](#11-konfiguration-config--toml)
12. [DWARF-Debugger](#12-dwarf-debugger)
13. [Threading & Synchronisation](#13-threading--synchronisation)
14. [Toolchain & Startup-Sequenz](#14-toolchain--startup-sequenz)
15. [Guest-Bibliothek (Programs/common)](#15-guest-bibliothek-programscommon)
16. [Guest-Programme](#16-guest-programme)
17. [Build-System](#17-build-system)
18. [Datenfluss End-to-End](#18-datenfluss-end-to-end)
19. [Sicherheitskonzepte](#19-sicherheitskonzepte)
20. [Leistungscharakteristik](#20-leistungscharakteristik)

---

## 1. Projektziel & Überblick

Der Emulator hat ein klares Ziel: **komplette Spiele auf einer RV32I-CPU emulieren** — von DOOM über SNES-ROMs bis hin zu anderen Anwendungen. Er ist kein Lehrlehr-Toy, sondern ein voll funktionsfähiges System mit Display, Tastatur/Maus, Datei-I/O, Echtzeit-Debugging und einer eigenen Toolchain zum Cross-Compilieren von Guest-Programmen.

Das Projekt besteht aus zwei Schichten:

| Schicht | Beschreibung |
|---------|-------------|
| **Host** (C++, macOS/Linux) | Emuliert die RV32I-CPU, stellt SDL2-Fenster, Dateisystem und Syscalls bereit |
| **Guest** (C, RV32I-Assembler) | Programme, die auf der emulierten CPU laufen — DOOM, SNES-Emulator, Testprogramme |

Es gibt außerdem eine ältere **Python-Referenzimplementierung** (`Python/`) für Debugging einzelner Instruktionen, die aber kein SDL hat.

---

## 2. Architektur auf höchster Ebene

```
┌──────────────────────────────────────────────────────────────────┐
│  Host-Prozess (macOS/Linux)                                      │
│                                                                  │
│  ┌──────────────────────┐     ┌────────────────────────────────┐ │
│  │    CPU-Thread        │     │     Main-Thread (SDL)          │ │
│  │                      │     │                                │ │
│  │  RV32::step() loop   │◄───►│  SDL_PollEvent()               │ │
│  │  1000 Steps/iter     │     │  Display::update_display()     │ │
│  │  Trap-Handling       │     │  60 FPS cap                    │ │
│  │  Breakpoint-Check    │     │  Perf-Monitor Ausgabe          │ │
│  └──────────┬───────────┘     └────────────────────────────────┘ │
│             │                                                    │
│             │ nutzt                                              │
│  ┌──────────▼──────────────────────────────────────────────┐    │
│  │  RV32 (CPU-Kern)                                        │    │
│  │  ├── 32 Register (x0–x31)                               │    │
│  │  ├── Flaches RAM (std::vector<uint8_t>, 32 MB)          │    │
│  │  ├── PC (Program Counter)                               │    │
│  │  ├── Semihosting-Handler                                │    │
│  │  ├── transfer_buffer (Framebuffer für Display)          │    │
│  │  └── key_queue (Tastatur-Events)                        │    │
│  └────┬────────────────┬────────────────┬──────────────────┘    │
│       │                │                │                        │
│  ┌────▼────┐  ┌────────▼──────┐  ┌─────▼─────────────┐         │
│  │ELFLoader│  │FileHandleTable│  │  RV32Debugger      │         │
│  │ELF32    │  │Sandboxed I/O  │  │  DWARFReader       │         │
│  │parsing  │  │FD-Tabelle     │  │  Breakpoints       │         │
│  └─────────┘  └───────────────┘  └────────────────────┘         │
└──────────────────────────────────────────────────────────────────┘

                    ▲
                    │ lädt als ELF
                    │
┌───────────────────┴──────────────────────────────────────────────┐
│  Guest-Programm (RV32I-Binary)                                   │
│  ├── DOOM (PureDOOM, 320×200)                                    │
│  ├── LakeSnes (SNES-Emulator)                                    │
│  └── TestPrograms                                                │
└──────────────────────────────────────────────────────────────────┘
```

### Hauptdateien im Überblick

| Datei | Rolle |
|-------|-------|
| `src/main.cpp` | Entry Point, Thread-Setup, SDL-Event-Loop |
| `src/RV32.cpp` / `inc/RV32.hpp` | CPU-Kern, Decoder, Executor, Syscall-Handler |
| `src/ELFLoader.cpp` | ELF32-Parser, lädt Sektionen in RAM |
| `src/FileHandle.cpp` | Sandboxed Datei-I/O, FD-Tabelle |
| `src/Config.cpp` | TOML-Config laden, Config-Struct befüllen |
| `src/DWARFReader.cpp` | DWARF5-Parsing via libdwarf |
| `src/RV32Debugger.cpp` | Interaktiver Source-Level-Debugger |
| `inc/Syscall.hpp` | Alle Syscall-Codes mit Dokumentation |
| `inc/ISA.hpp` | Opcode/Funct3/Funct7-Enums |
| `inc/Registers.hpp` | Registerdatei + ABI-Namen |

---

## 3. CPU-Emulation (RV32)

### Befehlssatz

Der Emulator implementiert **RV32IM** — das ist die 32-Bit RISC-V Base Integer ISA (I) plus die Multiply/Divide-Erweiterung (M).

**RV32I Basisinstruktionen:**

| Kategorie | Instruktionen |
|-----------|--------------|
| Arithmetik (Reg) | ADD, SUB, SLT, SLTU, AND, OR, XOR, SLL, SRL, SRA |
| Arithmetik (Imm) | ADDI, SLTI, SLTIU, ANDI, ORI, XORI, SLLI, SRLI, SRAI |
| Laden | LW, LH, LB, LHU, LBU |
| Speichern | SW, SH, SB |
| Branches | BEQ, BNE, BLT, BGE, BLTU, BGEU |
| Sprünge | JAL, JALR |
| Upper Immediate | LUI, AUIPC |
| System | EBREAK, ECALL (als Semihosting) |

**RV32M Erweiterung:**

| Instruktion | Beschreibung | Edge Cases |
|-------------|-------------|-----------|
| MUL | Untere 32 Bit des Produkts | — |
| MULH | Obere 32 Bit (signed×signed) | — |
| MULHSU | Obere 32 Bit (signed×unsigned) | — |
| MULHU | Obere 32 Bit (unsigned×unsigned) | — |
| DIV | Signierte Division | Div-by-zero → -1; INT_MIN÷(-1) → INT_MIN |
| DIVU | Unsigned Division | Div-by-zero → 0xFFFFFFFF |
| REM | Signierter Rest | Div-by-zero → Dividend; INT_MIN÷(-1) → 0 |
| REMU | Unsigned Rest | Div-by-zero → Dividend |

Die Edge Cases sind laut RISC-V-Spec implementiert und verhindern insbesondere, dass der Host-Prozess ein SIGFPE erhält.

### Registerdatei

```
x0  / zero  — hardwired 0, Schreibversuche werden ignoriert
x1  / ra    — Return Address
x2  / sp    — Stack Pointer
x3  / gp    — Global Pointer
x4  / tp    — Thread Pointer
x5  / t0    — Temporär
...
x10 / a0    — Argument 0 / Return Value / Syscall-Nummer
x11 / a1    — Argument 1 / Syscall-Parameter-Pointer
...
x31 / t6    — Temporär
```

Schreibzugriffe auf x0 werden von `Registers::write()` still ignoriert. Alle 32 Register sind als `uint32_t`-Array gespeichert.

### Interne CPU-Felder (Auswahl)

```cpp
std::vector<uint8_t> ram;         // Flacher Adressraum
uint32_t pc;                      // Program Counter
Registers regs;                   // Registerdatei
uint64_t cycles;                  // Instruktionszähler

uint32_t ram_origin;              // RAM-Startadresse (aus Config)
uint32_t ram_end;                 // RAM-Endadresse
uint32_t ro_end;                  // Ende des Read-Only-Bereichs
uint32_t heap_start;              // Heap beginnt nach .bss

// Framebuffer (doppelt gepuffert)
std::vector<uint8_t> transfer_buffer;
std::mutex transfer_buffer_mtx;

// Tastatur-Queue
std::queue<uint32_t> key_queue;
std::mutex queue_mtx;

// Semihosting-State-Machine
int semihosting_step;             // 0, 1 oder 2

// Trap
TrapReason trap_reason;           // None / Breakpoint / IllegalInst / MemFault
```

---

## 4. Instruktions-Pipeline

Jeder Aufruf von `RV32::step()` durchläuft exakt drei Phasen:

### Phase 1: Fetch

```
pc → RAM[pc..pc+3] → uint32_t raw_instr
```

- Bounds-Check: `is_in_ram(pc, 4)` — wirft `MemFault` wenn außerhalb
- Liest 4 Bytes little-endian
- PC wird danach um 4 inkrementiert (außer bei Branches/Jumps)

### Phase 2: Decode

Das Opcode-Feld (Bits 0–6) bestimmt den Instruktionstyp. Danach werden je nach Typ verschiedene Felder extrahiert:

```
Bits  6..0  = opcode  (7 Bit)
Bits 11..7  = rd      (Zielregister)
Bits 14..12 = funct3  (Subopcode)
Bits 19..15 = rs1     (Quellregister 1)
Bits 24..20 = rs2     (Quellregister 2 / Imm-Teil)
Bits 31..25 = funct7  (Erweiterter Subopcode)
```

Immediates werden typspezifisch zusammengesetzt und vorzeichenerweitert:

| Typ | Verwendung | Immediate-Zusammensetzung |
|-----|-----------|--------------------------|
| R | Reg-Reg-Operationen | kein Immediate |
| I | Laden, ADDI, JALR | bits[31..20], vorzeichenerweitert auf 32 Bit |
| S | Speichern | bits[31..25] + bits[11..7] |
| B | Branches | bits[31,7,30..25,11..8], ×2 (Byte-Adresse) |
| U | LUI, AUIPC | bits[31..12], in obere 20 Bits |
| J | JAL | bits[31,19..12,20,30..21], ×2 |

### Phase 3: Execute

Switch auf `opcode` → verschachtelte Switches auf `funct3`/`funct7`:

```
LOAD  → LW / LH / LB / LHU / LBU  (liest aus RAM, sign-extends)
STORE → SW / SH / SB               (schreibt in RAM, prüft ro_end)
OP    → ADD/SUB/SLT/AND/OR/XOR/SLL/SRL/SRA + M-Extension
OP_IMM→ ADDI/SLTI/ANDI/ORI/XORI/SLLI/SRLI/SRAI
BRANCH→ BEQ/BNE/BLT/BGE/BLTU/BGEU (PC-relativ)
JAL   → pc += J-imm, rd = pc+4 (return addr)
JALR  → pc = (rs1 + I-imm) & ~1, rd = pc+4
LUI   → rd = U-imm
AUIPC → rd = pc + U-imm
SYSTEM→ EBREAK → Semihosting oder Breakpoint-Trap
```

Alle Decoder-Hilfsfunktionen sind mit `[[gnu::always_inline]]` annotiert — sowohl in Header als auch in der .cpp — um maximale Performance ohne Header-Pollution zu erzielen.

---

## 5. Semihosting-Interface

### Was ist Semihosting?

Semihosting ist eine standardisierte Methode, mit der ein Embedded-Programm auf Host-Dienste zugreift (Datei-I/O, Konsole, Zeit, etc.) — ohne echte Hardware-Peripherie. Das Guest-Programm führt eine magische Instruktionssequenz aus; der Emulator erkennt sie und führt die Aktion auf dem Host aus.

### Trigger-Sequenz

Die drei Instruktionen müssen **exakt in dieser Reihenfolge** auftreten:

```asm
slli zero, zero, 0x1f   ; Erkennung via: opcode=OP_IMM, funct3=SLL, rd=0, rs1=0, shamt=31
ebreak                   ; → semihosting_step = 1 → 2
srai zero, zero, 0x7    ; → semihosting_step = 2 → Trigger Handler
```

Zustand: `semihosting_step` geht 0 → 1 (SLLI) → 2 (EBREAK) → 0+Handler (SRAI).

Ein einfaches `ebreak` ohne die umgebenden Instruktionen löst stattdessen einen Debugger-Trap aus.

### Syscall-Konvention

| Register | Bedeutung |
|----------|-----------|
| `a0` (x10) | Syscall-Nummer (beim Call) / Rückgabewert (nach Call) |
| `a1` (x11) | Pointer auf Parameterblock im RAM des Guests |

Der Parameterblock ist eine Struktur im Guest-RAM — der Emulator liest ihn über `read_value<T>()` aus dem flachen RAM-Array.

### Syscall-Tabelle

**ARM Semihosting (0x01–0x20) — Datei-I/O:**

| Code | Name | Beschreibung |
|------|------|-------------|
| `0x01` | SYS_OPEN | Datei öffnen, Rückgabe: FD |
| `0x02` | SYS_CLOSE | FD schließen |
| `0x05` | SYS_WRITE | In FD schreiben |
| `0x06` | SYS_READ | Aus FD lesen |
| `0x09` | SYS_ISTTY | Ist FD ein Terminal? |
| `0x0A` | SYS_SEEK | Seek in FD |
| `0x0C` | SYS_FLEN | Dateilänge abfragen |
| `0x0E` | SYS_REMOVE | Datei löschen |
| `0x0F` | SYS_RENAME | Datei umbenennen |
| `0x13` | SYS_ERRNO | Letzten errno lesen |
| `0x18` | SYS_EXIT | Prozess beenden |
| `0x20` | SYS_EXIT_EXTENDED | Prozess mit Code beenden |

**Custom Extensions (0x100–0x10D) — Display, Input, Zeit, Verzeichnisse:**

| Code | Name | Parameter | Rückgabe |
|------|------|-----------|---------|
| `0x100` | SYS_GET_FRAMEBUFFER_INFO | — | Schreibt width/height/format/bpp in Puffer |
| `0x101` | SYS_SHOW_FRAMEBUFFER | Zeiger auf Guest-Framebuffer | 0 |
| `0x102` | SYS_GET_US | — | Host-Zeit in Mikrosekunden (64 Bit) |
| `0x103` | SYS_SLEEP_US | Dauer in µs | 0 |
| `0x104` | SYS_KEY_AVAILABLE | — | 1 wenn Taste in Queue |
| `0x105` | SYS_GET_KEY | — | SDL_Scancode aus Queue |
| `0x106` | SYS_IS_KEY_DOWN | SDL_Scancode | 1 wenn gedrückt |
| `0x107` | SYS_GET_MOUSE_POS | — | (x<<16)\|y |
| `0x108` | SYS_IS_MOUSE_BUTTON_DOWN | Button-Index | 1 wenn gedrückt |
| `0x109` | SYS_OPENDIR | Pfad-Zeiger | Dir-Handle |
| `0x10A` | SYS_READDIR | Dir-Handle | Zeiger auf dirent |
| `0x10B` | SYS_CLOSEDIR | Dir-Handle | 0 |
| `0x10C` | SYS_MKDIR | Pfad-Zeiger | 0 |
| `0x10D` | SYS_REWINDDIR | Dir-Handle | 0 |

### SYS_SHOW_FRAMEBUFFER im Detail

Das ist der kritischste Syscall für Games:

1. Guest ruft `sys_show_framebuffer(buffer_ptr)` auf
2. Emulator liest `buffer_ptr` aus dem Parameterblock
3. Kopiert `width × height × bpp` Bytes aus dem Guest-RAM in `transfer_buffer`
4. Diese Kopie erfolgt unter `transfer_buffer_mtx`
5. Main-Thread liest `transfer_buffer` bei nächstem Display-Tick und zeigt es an

---

## 6. Speicher & Adressraum

### Guest-Perspektive

```
Adresse       Inhalt
──────────────────────────────────────────────────
0x00000000    .text        (Code — read-only)
              .rodata      (Konstanten — read-only)
              .eh_frame    (Exception-Handling-Tabellen)
              .data        (Initialisierte Daten)
              .init_array  (C++-Konstruktor-Zeiger)
              .fini_array  (C++-Destruktor-Zeiger)
              .bss         (Null-initialisierte Daten)
              [heap_start] (malloc-Heap, wächst aufwärts)
              ...
0x01E00000    Heap-Ende
              ...
              [Stack, wächst abwärts von 0x02000000]
0x02000000    _stack_top   (RAM-Ende)
──────────────────────────────────────────────────
```

Gesamtgröße: **32 MB**. Die Boundary Stack/Heap ist nicht hart — bei Stack-Overflow wird kein Trap ausgelöst, es tritt einfach Datenverfälschung auf (wie auf echter Hardware).

### Host-Perspektive

Der Emulator hält den gesamten Guest-Adressraum als:

```cpp
std::vector<uint8_t> ram;  // 32 MB, index 0 = Adresse ram_origin
```

Adressübersetzung: `ram[guest_addr - ram_origin]`

**Read-Only-Schutz:** `ro_end` markiert das Ende von `.text` und `.rodata`. Jeder Schreibzugriff auf Adressen `< ro_end` löst einen `MemFault`-Trap aus.

**Bounds-Checking:** Jeder Speicherzugriff (Fetch, Load, Store) prüft per `is_in_ram(address, size)` ob Adresse+Größe im gültigen RAM-Bereich liegt. Außerhalb → `MemFault`.

### Heap-Management

Der Heap-Start (`heap_start`) wird vom ELF-Loader nach dem Einlesen aller Sektionen gesetzt: direkt nach `.bss`. Guest-Programme nutzen Standard-C `malloc()`/`free()`, die intern `sbrk()` aufrufen, was wiederum als Semihosting-Syscall implementiert ist.

---

## 7. ELF-Loader

### Was er macht

Der ELF-Loader (`ELFLoader`) liest die ELF32-Binärdatei des Guest-Programms und lädt die relevanten Sektionen in den emulierten RAM.

### Ablauf

1. **ELF-Header lesen**: Magic-Bytes prüfen (`0x7F 'E' 'L' 'F'`), Entry-Point merken
2. **Section-Headers iterieren**: Alle Sektionen durchgehen
3. **Loadable Sektions filtern**: Nur Sektionen mit `SHF_ALLOC`-Flag werden geladen
4. **In RAM kopieren**:
   - Sektionen mit Daten (`.text`, `.rodata`, `.data`): Bytes in `ram` at `section.addr - ram_origin` kopieren
   - `.bss`: Null-Bytes schreiben (oder überspringen wenn `zero_bss=false` in Config)
5. **Debug-Sektionen merken**: `.debug_*`-Sektionen für DWARF-Parser speichern
6. **Heap-Start setzen**: `cpu.heap_start = highest_loaded_addr` (rounded up, aligned)
7. **PC setzen**: `cpu.pc = elf_header.entry_point`

### ELFSection-Struct

```cpp
struct ELFSection {
    std::string name;           // z.B. ".text", ".bss"
    std::vector<uint8_t> data;  // Roh-Bytes (leer bei .bss)
    uint32_t address;           // Load-Adresse im Guest-RAM
    uint32_t size;              // Größe in Bytes
    uint32_t type;              // SHT_PROGBITS, SHT_NOBITS, etc.
    uint32_t flags;             // SHF_ALLOC | SHF_EXECINSTR, etc.
};
```

---

## 8. Datei-I/O (FileHandleTable)

### Konzept

Guest-Programme sehen ein virtuelles POSIX-Dateisystem. Alle Pfade werden relativ zu einem konfigurierten `storage_path` aufgelöst — das ist die "Sandbox". Der Guest kann keine Dateien außerhalb dieser Sandbox öffnen.

### Klassen-Hierarchie

```
FileHandle (abstrakt)
├── RegularFile   — wraps std::fstream
└── StandardStream — wraps stdin/stdout/stderr

DirHandle (abstrakt)
└── RegularDir    — wraps std::filesystem::directory_iterator
```

### FileHandleTable

Verwaltet eine Tabelle `fd → FileHandle*`:

| FD | Standard-Belegung |
|----|------------------|
| 0 | stdin (StandardStream) |
| 1 | stdout (StandardStream) |
| 2 | stderr (StandardStream) |
| 3+ | dynamisch zugewiesene Dateien |

**Operationen:**
- `openFile(name, mode)` → neuer FD; Sonderfall `:tt` → stdout
- `closeFile(fd)` → `delete` Handle, FD frei
- `read(fd, buf, len)` → liest in Guest-RAM
- `write(fd, buf, len)` → schreibt aus Guest-RAM
- `seek(fd, offset)` → fseek
- `getLength(fd)` → Dateigröße

**Datei-Modi** (ARM-Semihosting-Konvention, `mode` 0–11):

| Wert | Modus |
|------|-------|
| 0 | "r" (read) |
| 4 | "r+" (read+write) |
| 8 | "w" (write, truncate) |
| 9 | "wb" (binary write) |
| ... | ... |

### Pfad-Sanitization

```cpp
bool isPathSafe(const string& guest_path) {
    auto full = std::filesystem::weakly_canonical(storage_path / guest_path);
    auto base = std::filesystem::weakly_canonical(storage_path);
    auto [it_base, it_full] = std::mismatch(base.begin(), base.end(),
                                             full.begin(), full.end());
    return it_base == base.end();  // full muss mit base beginnen
}
```

Verhindert Path-Traversal wie `../../etc/passwd` zuverlässig über `weakly_canonical`.

---

## 9. Display-System (SDL2)

### Initialisierung

1. `SDL_Init(SDL_INIT_VIDEO)` aufrufen
2. Fenster erstellen mit Breite×Höhe aus Config (z.B. 320×200 für DOOM)
3. Renderer mit Hardware-Acceleration erstellen
4. SDL_Texture erstellen — Pixelformat wird aus `framebuffer.format` übersetzt:

| Config-Format | SDL-Pixelformat |
|---------------|-----------------|
| `ARGB` | SDL_PIXELFORMAT_BGRA8888 |
| `RGB` | SDL_PIXELFORMAT_BGR24 |
| `RGB565` | SDL_PIXELFORMAT_RGB565 |
| `RGBA` | SDL_PIXELFORMAT_RGBA8888 |

5. Auto-Scaling: Fenster wird so skaliert, dass es ins Display passt

### Frame-Update (Main-Thread, 60 FPS)

```
1. transfer_buffer_mtx sperren
2. transfer_buffer nach SDL_Texture kopieren (SDL_LockTexture + memcpy)
3. transfer_buffer_mtx entsperren
4. SDL_RenderClear()
5. SDL_RenderCopy() — Texture ins Fenster skalieren
6. SDL_RenderPresent() — auf Bildschirm bringen
7. Warten bis 1/60s vergangen
```

---

## 10. Input-System (SDL2)

### Tastatur

```
SDL_KEYDOWN event → scancode in key_queue (unter queue_mtx)
                  → key_state[scancode] = true

SDL_KEYUP event  → (scancode | 0x8000) in key_queue
                 → key_state[scancode] = false
```

Der Guest liest Tastatureingaben über:
- `SYS_KEY_AVAILABLE`: Prüft ob `key_queue` nicht leer
- `SYS_GET_KEY`: Holt nächsten Eintrag aus `key_queue` (pop)
- `SYS_IS_KEY_DOWN`: Liest `key_state[scancode]` direkt (Realtime)

Queue-Einträge kodieren KEYDOWN (bit 15 = 0) und KEYUP (bit 15 = 1) im gleichen Wert.

### Maus

```
SDL_MOUSEMOTION → host-Koordinaten → skaliert auf Framebuffer-Raum
                                   → mouse_x, mouse_y (atomar)

SDL_MOUSEBUTTONDOWN / UP → mouse_buttons Bitfeld
```

Der Guest liest über:
- `SYS_GET_MOUSE_POS`: Gibt `(x << 16) | y` zurück
- `SYS_IS_MOUSE_BUTTON_DOWN`: Gibt Button-Bit zurück

### Fenster-Resize

Bei Fenstergröße-Änderung wird das Aspect-Ratio aus `framebuffer.width / framebuffer.height` erzwungen — kein Verzerrung der Darstellung.

---

## 11. Konfiguration (Config + TOML)

### config.toml Struktur

```toml
[binary]
path = "/absoluter/pfad/zum/guest.elf"

[storage]
path = "/absoluter/pfad/zur/sandbox"  # Wurzel des virtuellen FS

[ram]
ram_origin   = 0x00000000  # Startadresse
ram_size_mb  = 32          # Größe in MB
stack_margin_mb = 2        # Reserviert für Stack (von oben)

[framebuffer]
width  = 320
height = 240
format = "RGB565"          # oder ARGB, RGB, RGBA

[debug]
perf_monitor = true        # Prints MIPS jede Sekunde
fps = 60                   # Ziel-FPS

[[debug.breakpoint]]
address = 0x12345          # Breakpoint bei Adresse
# ODER:
# file = "main.c"
# line = 42                # Breakpoint bei Source-Zeile (via DWARF)

[init]
randomize_registers = true  # Register mit Zufallswerten initialisieren
randomize_ram       = true  # RAM mit Zufallsdaten füllen (kein Zero-init)
zero_bss            = true  # .bss-Sektion auf null setzen
```

### Config-Struct (C++)

```cpp
struct Config {
    std::string binary_path;
    std::string storage_path;

    uint32_t ram_origin;
    uint32_t ram_size_mb;
    uint32_t ram_end;       // berechnet: origin + size * 1024*1024
    uint32_t stack_margin_mb;

    FramebufferConfig framebuffer;  // width, height, format, bpp
    DebugConfig debug;              // perf_monitor, fps, breakpoints
    InitConfig init;                // randomize_registers/ram, zero_bss
};
```

Die Config ist als globale Variable `g_config` zugänglich (extern deklariert in `Utils.hpp`) — alle Komponenten können darauf zugreifen ohne sie durchzureichen.

---

## 12. DWARF-Debugger

Der Emulator enthält einen vollständigen **Source-Level-Debugger** — kein GDB, sondern komplett custom gebaut. Er wird nur eingebunden wenn `EMULATOR_DEBUG` beim Compile gesetzt ist.

### DWARFReader

Parst DWARF5-Debuginformationen aus der Guest-ELF mit **libdwarf**.

**Datenstrukturen:**

```cpp
struct LineEntry {
    uint32_t address;   // Instruktionsadresse
    uint32_t line;      // Quelldatei-Zeile
    std::string file;   // Quelldatei-Pfad
};

struct SubProgram {
    uint32_t low_pc;     // Startadresse der Funktion
    uint32_t high_pc;    // Endadresse
    std::string name;    // Funktionsname
    std::vector<Variable> locals;  // Lokale Variablen
};

struct Variable {
    std::string name;
    std::string type_name;
    LocationType loc_type;  // Register oder Frame-Pointer-Relativ
    union {
        int reg_num;        // Register-Nummer (DW_OP_reg0..reg31)
        int32_t fp_offset;  // Offset von FP (DW_OP_fbreg + SLEB128)
    };
};
```

**Parse-Ablauf:**

1. `dwarf_init_path(elf_path)` → `m_dbg` Handle
2. Iteriere über alle Compilation Units (CUs)
3. Pro CU: `dwarf_srclines_b()` → Zeilen-Tabelle
4. Alle `LineEntry`-Objekte sammeln → nach `address` sortieren
5. `dwarf_offdie_b()` für Typ-Informationen
6. Subprograms: `DW_TAG_subprogram` → low_pc/high_pc/name
7. Lokale Variablen: `DW_AT_location` → DW_OP_reg0..31 oder DW_OP_fbreg+offset
8. `dwarf_finish(m_dbg)` — MUSS vor Destruktor

**Lookups:**

```cpp
// PC → Quelldatei + Zeile (binäre Suche in sortierten line_entries)
std::optional<LineEntry> lookup_line(uint32_t pc);

// Quelldatei + Zeile → PC (für config.toml Breakpoints)
std::optional<uint32_t> lookup_address(string file, uint32_t line);

// PC → Funktionsname + lokale Variablen (binäre Suche in sub_programs)
std::optional<SubProgram> lookup_subprogram(uint32_t pc);
```

### RV32Debugger

Der interaktive Debugger, der bei jedem Breakpoint aufgerufen wird.

**Breakpoint-Typen:**

1. **Adress-Breakpoint**: Direkt aus config.toml, gespeichert in `breakpoint_addresses` Set
2. **Source-Breakpoint**: Datei+Zeile in config.toml → via DWARF-Reader in Adresse aufgelöst → ebenfalls in `breakpoint_addresses`
3. **Einfaches EBREAK**: Ohne Semihosting-Sequenz → Breakpoint bei aktueller Adresse

**`should_break()` Logik:**

```
Jede Instruktion:
1. Wenn pc in breakpoint_addresses → break
2. Wenn StepMode == Into → break (jeder Schritt)
3. Wenn StepMode == Over:
   - Hole aktuellen SP
   - Hole aktuelle Quelldatei-Zeile via DWARF
   - Wenn SP >= step_sp UND Zeile != step_line → break
   (d.h.: zurück aus aufgerufener Funktion UND in anderer Zeile)
```

**Debugger-UI (Terminal):**

```
╭─────────────────────────────────────────╮
│  Breakpoint at 0x00012345               │
│  main.c:42  void do_something()         │
├─────────────────────────────────────────┤
│  Source:                                │
│    40  │  int x = 5;                    │
│    41  │  int y = 10;                   │
│  → 42  │  do_something();               │
│    43  │  }                             │
├─────────────────────────────────────────┤
│  Assembly:                              │
│    0x00012340  addi sp,sp,-16           │
│    0x00012344  sw ra,12(sp)             │
│  → 0x00012348  jal 0x12400             │
├─────────────────────────────────────────┤
│  Registers:                             │
│  pc=0x00012348  sp=0x01FFFFE0  ...      │
├─────────────────────────────────────────┤
│  Local Variables:                       │
│  x (int) = 5   [frame-0x4]             │
│  y (int) = 10  [frame-0x8]             │
╰─────────────────────────────────────────╯
dbg> _
```

Box-Drawing nutzt UTF-8-Zeichen (`╭`, `─`, `╮`, `│`, `╰`, `╯`, `→`). Die `display_width()`-Funktion zählt UTF-8-Codepoints (nicht Bytes) für korrektes Alignment.

**Debugger-Befehle:**

| Befehl | Wirkung |
|--------|---------|
| `c` | Continue (weiter laufen) |
| `si` | Step Into (nächste Instruktion) |
| `so` | Step Over (über Funktionsaufruf hinweg) |
| `print(a0)` | Register ausgeben (ABI-Name oder xN) |
| `print(0x1234)` | Speicherinhalt an Adresse ausgeben |
| `print(myvar)` | Lokale Variable ausgeben (via DWARF) |

**Disassembly:** Ruft extern `riscv64-unknown-elf-objdump -d` auf und parst die Ausgabe in eine Map `pc → asm-String` + `pc → Funktionsname`.

---

## 13. Threading & Synchronisation

### Thread-Modell

```
┌──────────────────────────────────────────────────────┐
│  Main Thread                                         │
│                                                      │
│  while (running) {                                   │
│    SDL_PollEvent(...)    // Tastatur, Maus, Resize    │
│    Display::update_display()  // 60 FPS              │
│    if (perf_monitor) print_mips()                    │
│    SDL_Delay(frame_time_remaining)                   │
│  }                                                   │
│  cpu_thread.join()                                   │
└──────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────┐
│  CPU Thread (std::thread)                            │
│                                                      │
│  while (cpu.trap_reason == None) {                   │
│    for (int i = 0; i < 1000; i++)                    │
│      cpu.step()                                      │
│    if (debugger.should_break())                      │
│      debugger.on_trap()                              │
│  }                                                   │
└──────────────────────────────────────────────────────┘
```

### Synchronisationspunkte

| Mutex/Atomic | Geschützte Ressource | Wer schreibt | Wer liest |
|---|---|---|---|
| `transfer_buffer_mtx` | `transfer_buffer` | CPU (SYS_SHOW_FRAMEBUFFER) | Main Thread (Display) |
| `queue_mtx` | `key_queue` | Main Thread (SDL Events) | CPU (SYS_GET_KEY) |
| `std::atomic<uint64_t>` | `cycles` | CPU Thread | Main Thread (Perf-Monitor) |
| `key_state[]` | Echtzeit-Tastaturstatus | Main Thread | CPU Thread (SYS_IS_KEY_DOWN) |

`key_state` wird über `std::atomic<bool>` oder mit `queue_mtx` abgesichert (je nach Zugriffsmuster).

### Debugger-Halt

Wenn ein Breakpoint feuert, pausiert der CPU-Thread **ohne** dass der Main-Thread weiß. Der Main-Thread läuft weiter und zeigt weiterhin den letzten Framebuffer an. Der CPU-Thread wartet in `on_trap()` blockierend auf Terminal-Eingabe.

---

## 14. Toolchain & Startup-Sequenz

### Cross-Compiler

Guest-Programme werden mit `riscv64-unknown-elf-gcc` cross-compiliert für RV32IM:

```cmake
set(CMAKE_C_COMPILER   riscv64-unknown-elf-gcc)
set(CMAKE_CXX_COMPILER riscv64-unknown-elf-g++)

set(ARCH_FLAGS "-march=rv32im -mabi=ilp32 -msmall-data-limit=0")
```

`-msmall-data-limit=0` deaktiviert den kleinen Datenpuffer (GP-relativ), da der GP manuell gesetzt wird.

Debug-Flags: `-gdwarf-5 -g -O0` → erzeugt vollständige DWARF5-Debug-Infos

### Linker-Script (`linker.ld`)

Bestimmt das Memory-Layout komplett:

```
MEMORY {
  RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 32M
}

SECTIONS {
  .text    : { *(.text) *(.text.*) }  > RAM
  .rodata  : { *(.rodata) }           > RAM
  .eh_frame: { *(.eh_frame) }         > RAM
  .data    : { *(.data) }             > RAM
  .init_array : { ... }               > RAM
  .fini_array : { ... }               > RAM
  .bss     : { *(.bss) *(COMMON) }    > RAM
}

_stack_top = ORIGIN(RAM) + LENGTH(RAM);      /* 0x02000000 */
_heap_end  = _stack_top - 2M;               /* 0x01E00000 */
```

`__global_pointer$` wird auf `_sdata + 0x800` gesetzt — das ist der Anker für GP-relative Adressierung (±2 KB Reichweite).

### Startup-Sequenz (`start.S`)

```asm
.section .text
.global _start
_start:
    # 1. Stack-Pointer initialisieren
    la   sp, _stack_top          # sp = 0x02000000

    # 2. Global Pointer initialisieren
    .option push
    .option norelax
    la   gp, __global_pointer$  # gp = _sdata + 0x800
    .option pop

    # 3. Semihosting init (No-Op in diesem Emulator)
    call init_semihosting

    # 4. C++-Konstruktoren laufen lassen
    call __libc_init_array

    # 5. main() aufrufen
    call main

    # 6. exit() aufrufen (ruft SYS_EXIT_EXTENDED)
    call exit

    # 7. Endlos-Loop (sollte nie erreicht werden)
1:  j 1b
```

### Exit-Handler (`_exit.S`)

```asm
_exit:
    # a0 enthält Exit-Code von main()
    # Semihosting SYS_EXIT_EXTENDED aufrufen
    slli zero, zero, 0x1f    # Semihosting-Trigger 1
    ebreak                   # Semihosting-Trigger 2
    srai zero, zero, 0x7     # Semihosting-Trigger 3 → Handler
```

Der Parameter-Block enthält `{reason=0x20026, exit_code}` auf dem Stack.

---

## 15. Guest-Bibliothek (Programs/common)

Diese Bibliothek stellt C-Funktionen bereit, die alle Guest-Programme nutzen können. Sie ist die "Stdlib" des Emulators.

### `rv32_syscalls.h` — Semihosting-Wrapper

```c
static inline uint32_t semihost(uint32_t nr, uint32_t param) {
    register uint32_t a0 asm("a0") = nr;
    register uint32_t a1 asm("a1") = param;
    asm volatile(
        "slli zero, zero, 0x1f\n"
        "ebreak\n"
        "srai zero, zero, 0x7\n"
        : "+r"(a0) : "r"(a1)
    );
    return a0;
}
```

Darauf aufbauend typsichere Wrapper:

```c
static inline DisplayInfo sys_get_display_info() {
    DisplayInfo info;
    semihost(SYS_GET_FRAMEBUFFER_INFO, (uint32_t)&info);
    return info;
}

static inline void sys_show_framebuffer(void* buf) {
    semihost(SYS_SHOW_FRAMEBUFFER, (uint32_t)buf);
}
```

### `rv32_input.h` / `rv32_input.c`

Vollständige SDL-Scancode-Enumeration (512 Scancodes) — dieselben Codes wie SDL2. Guest-Programme können so direkt SDL-Konstanten verwenden:

```c
bool key_available();         // SYS_KEY_AVAILABLE
uint32_t pop_key();           // SYS_GET_KEY
bool is_key_down(uint32_t);   // SYS_IS_KEY_DOWN
```

### `rv32_time.h` / `rv32_time.c`

```c
uint64_t get_us();           // SYS_GET_US
void sleep_us(uint64_t us);  // SYS_SLEEP_US
```

### `rv32_file.h` / `rv32_file.c` und `rv32_dirent.h` / `rv32_dirent.c`

POSIX-ähnliche Dateisystem-API über Semihosting — ermöglicht `fopen`/`fread`/`fwrite` und `opendir`/`readdir`.

---

## 16. Guest-Programme

### DOOM (`Programs/RV32DOOM/`)

- Basiert auf **PureDOOM** — einer Single-Header-Bibliothek, die den kompletten DOOM-Engine-Code enthält
- Display: 320×200 Pixel, RGB565-Format, 35 FPS
- WAD-Datei wird über semihosting aus dem Storage-Pfad geladen
- Key-Mapping: SDL-Scancodes → DOOM-interne Keycodes (25 Mapping-Einträge + alle F-Tasten, Pfeiltasten, Modifier)

```c
// Hauptschleife (vereinfacht)
while (1) {
    // Input verarbeiten
    while (key_available()) {
        uint32_t k = pop_key();
        bool pressed = !(k & 0x8000);
        doom_key_t dk = sdl_to_doom_key(k & 0x7FFF);
        doom_key_fire(dk, pressed);
    }

    // DOOM tick (35 Hz)
    doom_update();

    // Framebuffer flippen
    sys_show_framebuffer(doom_get_framebuffer(0));

    // FPS begrenzen
    sleep_us(1000000 / 35);
}
```

### SNES-Emulator (`Programs/LakeSnes/`)

- Basiert auf **LakeSnes** — einem vollständigen SNES-Emulator in C
- Läuft vollständig **emuliert auf der emulierten CPU** — ein Emulator im Emulator
- Enthält komplette SNES-Hardware-Emulation: CPU (65816), APU (SPC700), PPU, DMA, Input, Cart, DSP
- ROM und Save-Dateien werden aus Storage geladen
- PAL/NTSC-Erkennung für korrekte Frame-Rate (50/60 Hz)
- Display: SNES-native Auflösung (256×224 oder 512×448 im HiRes-Modus)

### TestPrograms (`Programs/TestPrograms/`)

- Verschiedene Tests für Datei-I/O, Timing, Display, Input
- Nützlich für Verifikation von Syscall-Implementierungen

---

## 17. Build-System

### Host-Emulator (CMake)

```cmake
cmake_minimum_required(VERSION 3.30)
project(Cpp CXX)
set(CMAKE_CXX_STANDARD 20)

# Quellen
add_executable(Cpp
    src/main.cpp
    src/RV32.cpp
    src/ELFLoader.cpp
    src/FileHandle.cpp
    src/Config.cpp
    src/DWARFReader.cpp
    src/RV32Debugger.cpp
    ...
)

# Abhängigkeiten
find_package(SDL2 REQUIRED)
target_link_libraries(Cpp SDL2::SDL2 dwarf)

# Apple Silicon Support
if(APPLE)
    include_directories(/opt/homebrew/include)
    link_directories(/opt/homebrew/lib)
endif()

# Debugger optional aktivieren
option(EMULATOR_DEBUG "Enable source-level debugger" OFF)
if(EMULATOR_DEBUG)
    target_compile_definitions(Cpp PRIVATE EMULATOR_DEBUG)
endif()

# toml11 (Header-Only)
target_include_directories(Cpp PRIVATE third_party/toml11)
```

### Guest-Programme (Cross-Compile)

```bash
cmake -B cmake-build-release-rv32i \
      -DCMAKE_TOOLCHAIN_FILE=../../Toolchain/rv32-semihosting-toolchain.cmake \
      -DCMAKE_BUILD_TYPE=Release
cmake --build cmake-build-release-rv32i
```

Jedes Guest-Programm muss `${STARTUP_FILES}` in `add_executable` einbinden (aus der Toolchain-CMake) — das bringt `start.S` und `_exit.S` mit.

---

## 18. Datenfluss End-to-End

Hier der vollständige Weg eines DOOM-Frames:

```
1. DOOM-Code schreibt RGB565-Pixeldaten in sein Framebuffer-Array
   [Guest-RAM: 0x00500000..0x0051F400]

2. DOOM ruft sys_show_framebuffer(framebuffer_ptr) auf
   → Inline-Asm führt Semihosting-Trigger-Sequenz aus

3. CPU erkennt semihosting_step-Sequenz
   → Liest a0=0x101 (SYS_SHOW_FRAMEBUFFER), a1=0x00500000
   → Liest Parameterblock aus Guest-RAM
   → Sperrt transfer_buffer_mtx
   → memcpy(transfer_buffer, &ram[0x500000], 320*200*2)
   → Entsperrt transfer_buffer_mtx

4. Main-Thread (Display-Loop):
   → SDL_Delay bis nächster Frame fällig
   → Sperrt transfer_buffer_mtx
   → SDL_LockTexture()
   → memcpy(texture_pixels, transfer_buffer, 320*200*2)
   → SDL_UnlockTexture()
   → Entsperrt transfer_buffer_mtx
   → SDL_RenderCopy() — skaliert auf Fenstergröße
   → SDL_RenderPresent() — auf Bildschirm

5. Tastatur-Weg:
   → User drückt Taste
   → SDL_KEYDOWN Event im Main-Thread
   → Sperrt queue_mtx
   → key_queue.push(scancode)
   → Entsperrt queue_mtx
   → key_state[scancode] = true

6. DOOM fragt Tastatur ab:
   → key_available() → CPU prüft queue_mtx, liest queue.size()
   → pop_key() → CPU holt scancode aus queue
   → sdl_to_doom_key() → DOOM-interner Keycode
   → doom_key_fire(key, pressed)
```

---

## 19. Sicherheitskonzepte

### Speicher-Sandboxing

Alle Guest-Speicherzugriffe (Instruktions-Fetch, Load, Store) gehen durch `is_in_ram(address, size)`:

```cpp
bool is_in_ram(uint32_t addr, uint32_t size) {
    return addr >= g_config.ram_origin &&
           (uint64_t)addr + size <= (uint64_t)g_config.ram_end;
}
```

Außerhalb → `TrapReason::MemFault` → CPU stoppt.

### Read-Only-Schutz

```cpp
// In execute(), beim STORE:
if (address < ro_end) {
    trap_reason = TrapReason::MemFault;
    return;
}
```

Verhindert, dass Guest-Code sich selbst überschreibt (Code-Injection in den Guest hinein ist damit schwerer, aber das ist kein Security-Feature des Hosts).

### Dateisystem-Sandboxing

Der `storage_path` in der Config ist die harte Grenze. `isPathSafe()` mit `weakly_canonical` macht Path-Traversal (`../../`) unmöglich. Special-Pfad `:tt` (ARM-Semihosting für Terminal) wird auf stdout gemappt.

### Keine Shell-Injection

Externe Prozesse werden nur für `riscv64-unknown-elf-objdump` aufgerufen (im Debugger) — mit fest kodiertem Pfad und nur dem ELF-Pfad als Argument. Kein `system()` mit User-Input.

---

## 20. Leistungscharakteristik

### CPU-Performance

- **Batch-Größe**: 1000 Instruktionen pro Schleifeniterierung (reduziert Loop-Overhead)
- **Typische Performance**: 10–50 MIPS auf moderner Hardware
- **Bottleneck**: `switch(opcode)` Dispatch + RAM-Array-Zugriff pro Instruktion
- **Optimierung**: Alle Decoder-Hilfsfunktionen `[[gnu::always_inline]]`

### Perf-Monitor

Wenn `perf_monitor = true` in der Config:

```
Einmal pro Sekunde:
  prev_cycles = cycles (std::atomic, relaxed load)
  sleep(1s)
  mips = (cycles - prev_cycles) / 1_000_000
  print("MIPS: {mips:.2f}")
```

### Display-Timing

- Main-Thread führt exaktes Frame-Timing durch: misst `SDL_GetTicks()` vor/nach Frame-Update
- `SDL_Delay(remaining_ms)` um 60 FPS zu halten
- Framebuffer-Kopie (memcpy) läuft in O(width × height × bpp) — für 320×200×2 = 128 KB, vernachlässigbar

### DOOM-Performance auf dem Emulator

DOOM läuft mit 35 FPS (DOOM-intern). Bei ~10 MIPS emulierter CPU-Speed reicht das aus, da DOOM typischerweise ~500k Instruktionen pro Frame benötigt (auf normalem 486er). Der Emulator ist schnell genug.

### SNES im Emulator (LakeSnes)

LakeSnes ist anspruchsvoller — die SNES-CPU (65816) ist komplex. Mit ~10–50 MIPS Host-Emulation kann LakeSnes je nach SNES-ROM die Echtzeit-Grenze erreichen oder nicht.

---

## Anhang: Dateistruktur

```
.
├── Cpp/                        ← Host-Emulator (C++)
│   ├── CMakeLists.txt
│   ├── config/config.toml      ← Laufzeit-Konfiguration
│   ├── inc/
│   │   ├── RV32.hpp            ← CPU-Interface
│   │   ├── ISA.hpp             ← Opcode/Funct-Enums
│   │   ├── Registers.hpp       ← Registerdatei + ABI-Namen
│   │   ├── Syscall.hpp         ← Alle Syscall-Codes
│   │   ├── Config.hpp          ← Config-Struct
│   │   ├── ELFLoader.hpp       ← ELF-Parser-Interface
│   │   ├── DWARFReader.hpp     ← DWARF5-Parser-Interface
│   │   ├── RV32Debugger.hpp    ← Debugger-Interface
│   │   ├── FileHandle.hpp      ← Datei-I/O-Abstraktion
│   │   ├── Display.hpp         ← SDL2-Display-Interface
│   │   ├── Input.hpp           ← SDL2-Input-Interface
│   │   └── Utils.hpp           ← Hilfsfunktionen, g_config
│   └── src/
│       ├── main.cpp            ← Entry Point, Thread-Setup
│       ├── RV32.cpp            ← CPU-Implementierung
│       ├── ELFLoader.cpp       ← ELF-Parser
│       ├── FileHandle.cpp      ← Datei-I/O
│       ├── Config.cpp          ← TOML-Loader
│       ├── DWARFReader.cpp     ← DWARF5-Parser
│       └── RV32Debugger.cpp    ← Debugger
│
├── Toolchain/                  ← Cross-Compile-Toolchain
│   ├── rv32-semihosting-toolchain.cmake
│   ├── linker.ld               ← Guest-Memory-Layout
│   ├── start.S                 ← Startup-Sequenz
│   └── _exit.S                 ← Exit-Handler
│
├── Programs/                   ← Guest-Programme
│   ├── common/                 ← Shared Guest-Bibliothek
│   │   ├── rv32_syscalls.h     ← Semihosting-Wrapper
│   │   ├── rv32_display.h/c    ← Display-API
│   │   ├── rv32_input.h/c      ← Input-API
│   │   ├── rv32_time.h/c       ← Zeit-API
│   │   ├── rv32_file.h/c       ← Datei-API
│   │   └── rv32_dirent.h/c     ← Verzeichnis-API
│   ├── RV32DOOM/               ← DOOM-Port
│   │   ├── main.c
│   │   └── CMakeLists.txt
│   └── LakeSnes/               ← SNES-Emulator-Port
│       ├── main.c
│       ├── snes/               ← Komplette SNES-HW-Emulation
│       └── CMakeLists.txt
│
├── Python/                     ← Ältere Referenz-Implementierung
├── doc/                        ← Spezifikationen (DWARF5.pdf, etc.)
└── CLAUDE.md                   ← Projekt-Anleitung für Claude
```

---

*Ende der technischen Dokumentation.*