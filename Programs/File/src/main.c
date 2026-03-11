#include <stdio.h>
#include <string.h>

/*
void print_separator(const char* title) {
    printf("\n========== %s ==========\n", title);
}

void test_basic_write_read() {
    print_separator("TEST 1: Basic Write and Read");

    FILE* f = fopen("test_output.txt", "w");
    if (f == NULL) {
        printf("ERROR: Failed to open file for writing\n");
        return;
    }
    printf("✓ Opened file for writing\n");

    const char* msg = "Hello from RISC-V!\n";
    size_t written = fwrite(msg, 1, strlen(msg), f);
    printf("✓ Wrote %d bytes\n", (int)written);

    fclose(f);
    printf("✓ Closed file\n");

    // Now read it back
    f = fopen("test_output.txt", "r");
    if (f == NULL) {
        printf("ERROR: Failed to open file for reading\n");
        return;
    }
    printf("✓ Opened file for reading\n");

    char buffer[100];
    size_t bytes_read = fread(buffer, 1, 100, f);
    printf("✓ Read %d bytes\n", (int)bytes_read);

    buffer[bytes_read] = '\0';
    printf("Content: %s", buffer);

    fclose(f);
    printf("✓ Test 1 PASSED!\n");
}

void test_fprintf_fscanf() {
    print_separator("TEST 2: fprintf and fscanf");

    FILE* f = fopen("test_format.txt", "w");
    if (f == NULL) {
        printf("ERROR: Failed to open file\n");
        return;
    }

    fprintf(f, "Integer: %d\n", 42);
    fprintf(f, "String: %s\n", "Testing");
    fprintf(f, "Hex: 0x%x\n", 255);
    printf("✓ Wrote formatted data\n");
    fclose(f);

    // Read it back
    f = fopen("test_format.txt", "r");
    if (f == NULL) {
        printf("ERROR: Failed to open file for reading\n");
        return;
    }

    int num;
    char str[50];
    int hex_val;

    fscanf(f, "Integer: %d\n", &num);
    fscanf(f, "String: %s\n", str);
    fscanf(f, "Hex: 0x%x\n", &hex_val);

    printf("Read back:\n");
    printf("  Integer: %d (expected 42)\n", num);
    printf("  String: %s (expected Testing)\n", str);
    printf("  Hex: 0x%x (expected 0xff)\n", hex_val);

    int test_passed = (num == 42) && (strcmp(str, "Testing") == 0) && (hex_val == 255);

    fclose(f);
    if (test_passed) {
        printf("✓ Test 2 PASSED!\n");
    } else {
        printf("✗ Test 2 FAILED!\n");
    }
}

void test_fgets_fputs() {
    print_separator("TEST 3: fgets and fputs");

    FILE* f = fopen("test_lines.txt", "w");
    if (f == NULL) {
        printf("ERROR: Failed to open file\n");
        return;
    }

    fputs("Line number one\n", f);
    fputs("Line number two\n", f);
    fputs("Line number three\n", f);
    printf("✓ Wrote 3 lines\n");
    fclose(f);

    // Read back line by line
    f = fopen("test_lines.txt", "r");
    if (f == NULL) {
        printf("ERROR: Failed to open file for reading\n");
        return;
    }

    char line[100];
    int line_num = 1;
    printf("Reading lines:\n");
    while (fgets(line, sizeof(line), f) != NULL) {
        printf("  Line %d: %s", line_num, line);
        line_num++;
    }

    fclose(f);

    if (line_num == 4) {
        printf("✓ Test 3 PASSED!\n");
    } else {
        printf("✗ Test 3 FAILED! (read %d lines, expected 3)\n", line_num - 1);
    }
}

void test_fseek_ftell() {
    print_separator("TEST 4: fseek and ftell (SEEK_SET only)");

    FILE* f = fopen("test_seek.txt", "w");
    if (f == NULL) {
        printf("ERROR: Failed to open file\n");
        return;
    }

    fputs("0123456789ABCDEF", f);
    fclose(f);
    printf("✓ Wrote test data: 0123456789ABCDEF\n");

    // Test seeking
    f = fopen("test_seek.txt", "r");
    if (f == NULL) {
        printf("ERROR: Failed to open file for reading\n");
        return;
    }

    char c;
    int errors = 0;

    // Read from beginning
    fread(&c, 1, 1, f);
    printf("✓ First char: %c (expected 0) - %s\n", c, (c == '0') ? "PASS" : "FAIL");
    if (c != '0') errors++;

    // Seek to position 8 from start
    fseek(f, 8, SEEK_SET);
    long pos = ftell(f);
    printf("✓ Position after seek to 8: %ld - %s\n", pos, (pos == 8) ? "PASS" : "FAIL");
    if (pos != 8) errors++;

    fread(&c, 1, 1, f);
    printf("✓ Char at position 8: %c (expected 8) - %s\n", c, (c == '8') ? "PASS" : "FAIL");
    if (c != '8') errors++;

    // Seek to position 5
    fseek(f, 5, SEEK_SET);
    pos = ftell(f);
    fread(&c, 1, 1, f);
    printf("✓ Char at position 5: %c (expected 5) - %s\n", c, (c == '5') ? "PASS" : "FAIL");
    if (c != '5') errors++;

    // Seek to position 15 (last char)
    fseek(f, 15, SEEK_SET);
    fread(&c, 1, 1, f);
    printf("✓ Last char (position 15): %c (expected F) - %s\n", c, (c == 'F') ? "PASS" : "FAIL");
    if (c != 'F') errors++;

    // Seek back to start
    fseek(f, 0, SEEK_SET);
    fread(&c, 1, 1, f);
    printf("✓ After seeking to 0: %c (expected 0) - %s\n", c, (c == '0') ? "PASS" : "FAIL");
    if (c != '0') errors++;

    fclose(f);

    if (errors == 0) {
        printf("✓ Test 4 PASSED!\n");
    } else {
        printf("✗ Test 4 FAILED! (%d errors)\n", errors);
    }
}

void test_binary_io() {
    print_separator("TEST 5: Binary I/O");

    FILE* f = fopen("test_binary.bin", "wb");
    if (f == NULL) {
        printf("ERROR: Failed to open file\n");
        return;
    }

    unsigned char data[] = {0x00, 0x01, 0x02, 0x03, 0x0A, 0x0D, 0xFF, 0xFE, 0xFD, 0xFC};
    size_t written = fwrite(data, 1, sizeof(data), f);
    printf("✓ Wrote %d binary bytes\n", (int)written);
    fclose(f);

    // Read back
    f = fopen("test_binary.bin", "rb");
    if (f == NULL) {
        printf("ERROR: Failed to open file for reading\n");
        return;
    }

    unsigned char buffer[20];
    size_t bytes_read = fread(buffer, 1, sizeof(buffer), f);
    printf("✓ Read %d bytes\n", (int)bytes_read);

    printf("Data (hex): ");
    int i;
    for (i = 0; i < (int)bytes_read; i++) {
        printf("%02x ", buffer[i]);
    }
    printf("\n");

    // Verify
    int match = 1;
    for (i = 0; i < (int)sizeof(data); i++) {
        if (buffer[i] != data[i]) {
            match = 0;
            printf("Mismatch at byte %d: got 0x%02x, expected 0x%02x\n", i, buffer[i], data[i]);
        }
    }

    fclose(f);

    if (match && bytes_read == sizeof(data)) {
        printf("✓ Test 5 PASSED!\n");
    } else {
        printf("✗ Test 5 FAILED!\n");
    }
}

void test_append_mode() {
    print_separator("TEST 6: Append Mode");

    // Write initial content
    FILE* f = fopen("test_append.txt", "w");
    if (f == NULL) {
        printf("ERROR: Failed to open file\n");
        return;
    }
    fputs("Initial line\n", f);
    fclose(f);
    printf("✓ Wrote initial content\n");

    // Append to it
    f = fopen("test_append.txt", "a");
    if (f == NULL) {
        printf("ERROR: Failed to open file for appending\n");
        return;
    }
    fputs("Appended line 1\n", f);
    fputs("Appended line 2\n", f);
    fclose(f);
    printf("✓ Appended content\n");

    // Read all
    f = fopen("test_append.txt", "r");
    if (f == NULL) {
        printf("ERROR: Failed to open file for reading\n");
        return;
    }

    printf("Final content:\n");
    char line[100];
    int line_count = 0;
    while (fgets(line, sizeof(line), f) != NULL) {
        printf("  %s", line);
        line_count++;
    }

    fclose(f);

    if (line_count == 3) {
        printf("✓ Test 6 PASSED!\n");
    } else {
        printf("✗ Test 6 FAILED! (got %d lines, expected 3)\n", line_count);
    }
}

void test_feof_ferror() {
    print_separator("TEST 7: feof and ferror");

    FILE* f = fopen("test_eof.txt", "w");
    if (f == NULL) {
        printf("ERROR: Failed to open file\n");
        return;
    }
    fputs("Short file", f);
    fclose(f);
    printf("✓ Created test file\n");

    f = fopen("test_eof.txt", "r");
    if (f == NULL) {
        printf("ERROR: Failed to open file for reading\n");
        return;
    }

    char buffer[100];

    // Read all data (should not set EOF yet)
    size_t read1 = fread(buffer, 1, 10, f);
    printf("✓ First read: %d bytes\n", (int)read1);

    // Try to read more (should hit EOF)
    size_t read2 = fread(buffer, 1, 10, f);
    printf("✓ Second read: %d bytes (should be 0)\n", (int)read2);

    if (feof(f)) {
        printf("✓ EOF detected correctly\n");
    } else {
        printf("✗ EOF not detected\n");
    }

    if (ferror(f)) {
        printf("✗ Unexpected error flag\n");
    } else {
        printf("✓ No error flag (correct)\n");
    }

    fclose(f);
    printf("✓ Test 7 PASSED!\n");
}

void test_rewind() {
    print_separator("TEST 8: rewind");

    FILE* f = fopen("test_rewind.txt", "w");
    if (f == NULL) {
        printf("ERROR: Failed to open file\n");
        return;
    }
    fputs("ABCDEFGHIJ", f);
    fclose(f);
    printf("✓ Wrote: ABCDEFGHIJ\n");

    f = fopen("test_rewind.txt", "r");
    if (f == NULL) {
        printf("ERROR: Failed to open file for reading\n");
        return;
    }

    char c;
    int errors = 0;

    fread(&c, 1, 1, f);
    printf("✓ First read: %c (expected A) - %s\n", c, (c == 'A') ? "PASS" : "FAIL");
    if (c != 'A') errors++;

    fread(&c, 1, 1, f);
    fread(&c, 1, 1, f);
    printf("✓ After 3 reads: %c (expected C) - %s\n", c, (c == 'C') ? "PASS" : "FAIL");
    if (c != 'C') errors++;

    rewind(f);
    printf("✓ Rewound file\n");

    fread(&c, 1, 1, f);
    printf("✓ After rewind: %c (expected A) - %s\n", c, (c == 'A') ? "PASS" : "FAIL");
    if (c != 'A') errors++;

    fclose(f);

    if (errors == 0) {
        printf("✓ Test 8 PASSED!\n");
    } else {
        printf("✗ Test 8 FAILED!\n");
    }
}

void test_stdin_stdout() {
    print_separator("TEST 9: stdout/stderr");

    printf("This goes to stdout\n");
    fprintf(stdout, "This also goes to stdout (fprintf)\n");
    fprintf(stderr, "This goes to stderr\n");

    printf("✓ Test 9 PASSED!\n");
}

void test_multiple_files() {
    print_separator("TEST 10: Multiple Open Files");

    FILE* f1 = fopen("test_multi1.txt", "w");
    FILE* f2 = fopen("test_multi2.txt", "w");
    FILE* f3 = fopen("test_multi3.txt", "w");

    if (f1 == NULL || f2 == NULL || f3 == NULL) {
        printf("ERROR: Failed to open files\n");
        if (f1) fclose(f1);
        if (f2) fclose(f2);
        if (f3) fclose(f3);
        return;
    }

    printf("✓ Opened 3 files simultaneously\n");

    fputs("Content from file 1\n", f1);
    fputs("Content from file 2\n", f2);
    fputs("Content from file 3\n", f3);

    printf("✓ Wrote to all 3 files\n");

    fclose(f1);
    fclose(f2);
    fclose(f3);

    printf("✓ Closed all files\n");

    // Verify by reading back
    f1 = fopen("test_multi1.txt", "r");
    if (f1 == NULL) {
        printf("ERROR: Failed to reopen file 1\n");
        return;
    }

    char buffer[50];
    fgets(buffer, sizeof(buffer), f1);
    printf("File 1 content: %s", buffer);
    fclose(f1);

    printf("✓ Test 10 PASSED!\n");
}

void test_edge_cases() {
    print_separator("TEST 11: Edge Cases");

    int errors = 0;

    // Test 1: Empty file
    FILE* f = fopen("test_empty.txt", "w");
    fclose(f);

    f = fopen("test_empty.txt", "r");
    char buffer[10];
    size_t bytes_read = fread(buffer, 1, sizeof(buffer), f);
    printf("✓ Empty file read: %d bytes (expected 0) - %s\n",
           (int)bytes_read, (bytes_read == 0) ? "PASS" : "FAIL");
    if (bytes_read != 0) errors++;
    fclose(f);

    // Test 2: Reading past EOF
    f = fopen("test_eof2.txt", "w");
    fputs("ABC", f);
    fclose(f);

    f = fopen("test_eof2.txt", "r");
    fread(buffer, 1, 10, f);  // Try to read more than available
    if (feof(f)) {
        printf("✓ Reading past EOF sets EOF flag - PASS\n");
    } else {
        printf("✗ Reading past EOF doesn't set EOF flag - FAIL\n");
        errors++;
    }
    fclose(f);

    // Test 3: Opening non-existent file
    f = fopen("this_file_does_not_exist_xyz.txt", "r");
    if (f == NULL) {
        printf("✓ Opening non-existent file returns NULL - PASS\n");
    } else {
        printf("✗ Non-existent file opened?! - FAIL\n");
        fclose(f);
        errors++;
    }

    // Test 4: Write then read without closing (flush test)
    f = fopen("test_flush.txt", "w+");
    if (f != NULL) {
        fputs("TestData", f);
        fflush(f);  // Flush to ensure data is written
        fseek(f, 0, SEEK_SET);  // Seek back to start

        char read_buf[20];
        size_t n = fread(read_buf, 1, 8, f);
        read_buf[n] = '\0';

        if (strcmp(read_buf, "TestData") == 0) {
            printf("✓ Write-flush-read test - PASS\n");
        } else {
            printf("✗ Write-flush-read test - FAIL (got: %s)\n", read_buf);
            errors++;
        }
        fclose(f);
    }

    if (errors == 0) {
        printf("✓ Test 11 PASSED!\n");
    } else {
        printf("✗ Test 11 FAILED! (%d errors)\n", errors);
    }
}

void test_character_io() {
    print_separator("TEST 12: Character I/O (fgetc/fputc)");

    FILE* f = fopen("test_chars.txt", "w");
    if (f == NULL) {
        printf("ERROR: Failed to open file\n");
        return;
    }

    // Write individual characters
    fputc('H', f);
    fputc('e', f);
    fputc('l', f);
    fputc('l', f);
    fputc('o', f);
    fputc('\n', f);
    printf("✓ Wrote characters with fputc\n");
    fclose(f);

    // Read them back
    f = fopen("test_chars.txt", "r");
    if (f == NULL) {
        printf("ERROR: Failed to open file for reading\n");
        return;
    }

    printf("Reading with fgetc: ");
    int c;
    while ((c = fgetc(f)) != EOF) {
        putchar(c);
    }

    fclose(f);
    printf("✓ Test 12 PASSED!\n");
}

void test_mixed_read_write() {
    print_separator("TEST 13: Mixed Read/Write Operations");

    // Create initial file
    FILE* f = fopen("test_mixed.txt", "w");
    if (f == NULL) {
        printf("ERROR: Failed to open file\n");
        return;
    }
    fprintf(f, "Line 1\nLine 2\nLine 3\n");
    fclose(f);
    printf("✓ Created initial file with 3 lines\n");

    // Open for reading and writing
    f = fopen("test_mixed.txt", "r+");
    if (f == NULL) {
        printf("ERROR: Failed to open file for r+\n");
        return;
    }

    // Read first line
    char buffer[50];
    fgets(buffer, sizeof(buffer), f);
    printf("✓ Read: %s", buffer);

    // Write at current position
    fprintf(f, "INSERTED\n");
    fclose(f);

    // Read entire file
    f = fopen("test_mixed.txt", "r");
    printf("✓ Final file content:\n");
    while (fgets(buffer, sizeof(buffer), f) != NULL) {
        printf("  %s", buffer);
    }
    fclose(f);

    printf("✓ Test 13 PASSED!\n");
}

int main1() {
    printf("======================================\n");
    printf("  RISC-V FILE I/O TEST SUITE\n");
    printf("  Comprehensive Testing Program\n");
    printf("======================================\n");

    test_basic_write_read();
    test_fprintf_fscanf();
    test_fgets_fputs();
    test_fseek_ftell();
    test_binary_io();
    test_append_mode();
    test_feof_ferror();
    test_rewind();
    test_stdin_stdout();
    test_multiple_files();
    test_edge_cases();
    test_character_io();
    test_mixed_read_write();

    printf("\n======================================\n");
    printf("  ALL TESTS COMPLETED!\n");
    printf("  Check output above for PASS/FAIL\n");
    printf("======================================\n");

    return 0;
}
*/

void test() {
    int           a = -42;
    unsigned int  b = 100;
    char          c = 'Z';
    float         d = 3.14f;
    short         e = -7;
    long          f = 123456;

    printf("a=%d b=%u c=%c d=%f e=%d f=%ld\n", a, b, c, d, e, f);
}

int main() {
    test();
    return 0;
}