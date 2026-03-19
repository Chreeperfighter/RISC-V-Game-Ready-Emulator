#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include "../common/rv32_dirent.h"

static void list_dir(const char* path) {
    printf("Listing: %s\n", path);
    DIR* dir = opendir(path);
    if (!dir) { printf("  opendir failed (expected if not a dir or doesn't exist)\n"); return; }

    struct dirent* entry;
    int count = 0;
    while ((entry = readdir(dir)) != NULL) {
        printf("  [%s] %s\n", (entry->d_type == DT_DIR) ? "DIR" : "FILE", entry->d_name);
        count++;
    }
    if (count == 0) printf("  (empty)\n");
    closedir(dir);
}

static void write_file(const char* path, const char* content) {
    FILE* f = fopen(path, "w");
    if (!f) { printf("  fopen write failed: %s\n", path); return; }
    int written = fprintf(f, "%s", content);
    fclose(f);
    printf("  wrote %d bytes to %s\n", written, path);
}

/* Returns 1 if content matches expected, 0 otherwise */
static int read_and_verify(const char* path, const char* expected) {
    FILE* f = fopen(path, "r");
    if (!f) { printf("  fopen read failed: %s\n", path); return 0; }

    char buf[128] = {0};
    char* result = fgets(buf, sizeof(buf), f);
    fclose(f);

    if (!result) {
        printf("  fgets returned NULL (empty file or error): %s\n", path);
        return (expected[0] == '\0') ? 1 : 0;
    }

    if (strcmp(buf, expected) == 0) {
        printf("  OK: content matches \"%s\"\n", buf);
        return 1;
    } else {
        printf("  MISMATCH: got \"%s\", expected \"%s\"\n", buf, expected);
        return 0;
    }
}

int main(void) {
    int pass = 0, fail = 0;
#define CHECK(expr, label) do { if (expr) { printf("  PASS: %s\n", label); pass++; } else { printf("  FAIL: %s\n", label); fail++; } } while(0)

    /* --- Initial state --- */
    printf("=== Listing root ===\n");
    list_dir("/");

    /* --- Edge: opendir on non-existent path --- */
    printf("\n=== opendir edge cases ===\n");
    CHECK(opendir("/does_not_exist") == NULL, "opendir non-existent returns NULL");
    CHECK(opendir("") == NULL,                "opendir empty string returns NULL");

    /* --- mkdir tests --- */
    printf("\n=== mkdir ===\n");
    CHECK(mkdir("/testdir",     0755) == 0, "mkdir /testdir succeeds");
    CHECK(mkdir("/testdir/sub", 0755) == 0, "mkdir /testdir/sub succeeds");
    CHECK(mkdir("/testdir",     0755) != 0, "mkdir /testdir again fails (already exists)");
    CHECK(mkdir("/no_parent/x", 0755) != 0, "mkdir where parent missing fails");
    CHECK(mkdir("",             0755) != 0, "mkdir empty string fails");

    /* --- Edge: opendir on a regular file --- */
    printf("\n=== opendir on a file ===\n");
    write_file("/testdir/hello.txt", "hello world\n");
    CHECK(opendir("/testdir/hello.txt") == NULL, "opendir on a file returns NULL");

    /* --- File write/read-back --- */
    printf("\n=== file write + verify ===\n");
    write_file("/testdir/sub/data.txt", "nested file\n");
    CHECK(read_and_verify("/testdir/hello.txt",    "hello world\n"), "hello.txt content correct");
    CHECK(read_and_verify("/testdir/sub/data.txt", "nested file\n"), "data.txt content correct");

    /* --- Edge: read non-existent file --- */
    printf("\n=== fopen edge cases ===\n");
    CHECK(fopen("/testdir/ghost.txt", "r") == NULL, "fopen read non-existent returns NULL");
    CHECK(fopen("", "r")                  == NULL,  "fopen empty path returns NULL");

    /* --- Empty file --- */
    printf("\n=== empty file ===\n");
    write_file("/testdir/empty.txt", "");
    CHECK(read_and_verify("/testdir/empty.txt", ""), "empty file: fgets returns NULL or empty");

    /* --- Directory listing after setup --- */
    printf("\n=== directory listings ===\n");
    list_dir("/testdir");
    list_dir("/testdir/sub");

    /* --- Summary --- */
    printf("\n=== Results: %d passed, %d failed ===\n", pass, fail);
    return (fail == 0) ? 0 : 1;
}