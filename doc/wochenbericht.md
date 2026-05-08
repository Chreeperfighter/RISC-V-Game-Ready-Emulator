# Wochenbericht — RISC-V Game Ready Emulator

Diplomarbeit | HTBLuVA Graz-Gösting, 5BHEL | Mark Verbeek

---

## KW 39 — 25. Sep 2025

- Projektstart, erstes Commit, Repository angelegt

---

## KW 40 — 01. Okt 2025

- Erste Struktur aufgesetzt

---

## KW 41 — 07.–12. Okt 2025

- Grundstruktur für Python- und C++-Emulator angelegt
- Python: Klassen für Instructions, Register, PC; Dekodierung; Memory-Implementierung
- Fast alle RV32I-Instruktionen dekodiert und ausführbar, erste Tests erfolgreich
- Einfacher Framebuffer in Python implementiert, Klassen in separate Dateien aufgeteilt
- Toolchain eingerichtet, erste Cross-Compilation-Tests

---

## KW 42 — 13.–19. Okt 2025

- Python: ELF Loader implementiert, einfacher Debugger hinzugefügt
- Python: RAM-basierter Ansatz, Framebuffer verbessert
- **C++-Port begonnen:** Fast alle Instructions portiert, voll funktionsfähiger Emulator
- C++: Framebuffer, Threads, Display-Kontrolle, MMIO, weitere Syscalls implementiert

---

## KW 44 — 27. Okt – 02. Nov 2025

- Keyboard-Input und Timer-Syscalls implementiert
- Maus-Input hinzugefügt, einfaches Terminal-Testprogramm in C geschrieben

---

## KW 46 — 10. Nov 2025

- **Umstieg auf Semihosting-Architektur**
- Neue Klassenstruktur, Komponenten in separate Klassen ausgelagert (Display, Input, Audio, …)

---

## KW 47 — 20. Nov 2025

- Repository aufgeräumt, .gitignore konfiguriert, Build-Artefakte entfernt

---

*(Pause Nov – Jan)*

---

## KW 4 — 21.–29. Jan 2026

- WireWorld-Demo begonnen (zellulärer Automat als Gastprogramm)
- Semihosting weiterentwickelt

---

## KW 6 — 02.–08. Feb 2026

- **DOOM auf RV32 zum Laufen gebracht** (via PureDOOM, header-only C-Port)
- Keyboard-Syscalls für DOOM-Input implementiert
- Quake-Port begonnen
- **File-I/O endlich funktionierend:** Sandbox-Dateisystem für Gastprogramme, viel Aufräumarbeit

---

## KW 8 — 25.–26. Feb 2026

- Konfiguration auf TOML umgestellt (`config.toml`, `Config`-Klasse)
- Alte monolithische Syscall-Implementierung entfernt
- Semihosting und globale Config weiterentwickelt
- **Debugger-Grundstruktur** angelegt, ELF-Typen umbenannt, Config-Verbesserungen

---

## KW 9 — 28. Feb – 04. Mär 2026

- **DWARF5 `.debug_line`-Parser implementiert** (Adresse → Quelldatei:Zeile)
- DWARF5 Datei-/Verzeichnistabellen-Parsing, Quelltextausgabe im Debugger

---

## KW 10 — 08. Mär 2026

- **Umstieg auf libdwarf** (statt eigenem Parser)
- Grundlage für `.debug_info`-Parsing (Variablen, Funktionen) gelegt

---

## KW 11 — 11.–12. Mär 2026

- **Debugger-UI** mit Terminal-Boxen (UTF-8), libdwarf-Rewrite
- **Peanut-GB-Port:** Game Boy / GBC-Emulator als erstes Gastprogramm mit eigenem Emulator
- Geteilte Gastbibliothek (`Programs/common/`) eingeführt
- **RV32M-Extension implementiert** (MUL/DIV/REM inkl. aller Sonderfälle), Fehlerbehandlung verbessert

---

## KW 12 — 18.–21. Mär 2026

- **retro-go-Port:** Multi-System-Emulator (NES, GB, GBC) als Gastprogramm portiert
- Dirent-Syscalls (`opendir`/`readdir`/`closedir`/`mkdir`) implementiert
- File-I/O-Syscalls vollständig überarbeitet und erweitert
- CPU/Debugger refaktoriert, Gastbibliothek bereinigt, technische Übersicht erstellt
- retro-go-Auswahlmenü hinzugefügt, Emulator-Input responsiver gemacht
- **Audio-Semihosting:** `SYS_AUDIO_INIT`/`SYS_AUDIO_SUBMIT`/`SYS_AUDIO_GET_QUEUED_BYTES`
- SDL2-Audio-Backend mit Host-seitigem Pacing, DOOM-Sound, retro-go-Audio-Treiber
- Syscalls verallgemeinert, Code aufgeräumt

---

## KW 13 — 23.–27. Mär 2026

- **Controller-Support** (SDL2 GameController API), bis zu 4 Controller
- Input-Thread-Safety hergestellt, Display-Tearing behoben
- ROM-Dateiendungen zu .gitignore hinzugefügt
- Multi-Controller-Support (Slot-Verwaltung), `fps`-Config entfernt, Syscall-Structs korrigiert

---

## KW 14 — 31. Mär 2026

- **RV32\_Retro-Port:** SNES-Emulation via snes9x2002 (libretro-Core)
- **C++-Gastprogramm-Support:** `CMAKE_CXX_COMPILER` im Toolchain, `cxx_support.c`-Glue-Code
- Toolchain-Verbesserungen, **PC-Bounds-Checks** nach jedem Sprung/Branch
- **errno-Handling vollständig überarbeitet** (alle Semihosting-Handler setzen errno korrekt vor Return)

---

*(Pause April)*

---

## KW 18 — 01. Mai 2026

- **Diplomarbeit:** Kapitel 4.3 verfasst — Anwendungsfall retro-go (Multi-System-Emulation, Portierbarkeit, Audio, Performance)
- **Diplomarbeit:** Kapitel 5.2 verfasst — Reflexion der Technik:
  - Interpreter-Entscheidung (kein JIT, bewusst einfach gehalten)
  - LTO-Problem: `-flto=auto` führte zu Illegal-Instruction-Traps durch precompilierte libgcc mit RV32IMC, Lösung: LTO deaktiviert
  - Dateisystem-Problem: `init_semihosting` fehlte in `start.S`, Newlib hat alle Dateizugriffe still ignoriert
- Gesamtbewertung Diplomarbeit: **Note Gut (2)**, nahe an Sehr Gut
