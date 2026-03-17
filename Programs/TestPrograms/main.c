#include <stdio.h>
#include "../common/rv32_dirent.h"

static void list_dir(const char* path) {
    printf("Listing: %s\n", path);
    DIR* dir = opendir(path);
    if (!dir) { printf("  opendir failed\n"); return; }

    struct dirent* entry;
    while ((entry = readdir(dir)) != NULL) {
        printf("  [%s] %s\n", (entry->d_type == DT_DIR) ? "DIR" : "FILE", entry->d_name);
    }
    closedir(dir);
}

int main(void) {
    // List root
    list_dir("/");

    // Create a directory structure
    printf("\nCreating dirs...\n");
    printf("  mkdir /testdir     -> %d\n", mkdir("/testdir"));
    printf("  mkdir /testdir/sub -> %d\n", mkdir("/testdir/sub"));
    printf("  mkdir /testdir     -> %d (should fail, exists)\n", mkdir("/testdir"));

    // Create some files
    printf("\nCreating files...\n");
    FILE* f = fopen("/testdir/hello.txt", "w");
    if (f) { fprintf(f, "hello world\n"); fclose(f); printf("  wrote /testdir/hello.txt\n"); }

    f = fopen("/testdir/sub/data.txt", "w");
    if (f) { fprintf(f, "nested file\n"); fclose(f); printf("  wrote /testdir/sub/data.txt\n"); }

    // List the created structure
    printf("\n");
    list_dir("/testdir");
    list_dir("/testdir/sub");

    // Read back a file
    printf("\nReading /testdir/hello.txt:\n  ");
    f = fopen("/testdir/hello.txt", "r");
    if (f) {
        char buf[64];
        fgets(buf, sizeof(buf), f);
        fclose(f);
        printf("%s", buf);
    }

    printf("\nDone.\n");
    return 0;
}