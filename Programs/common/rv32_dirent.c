//
// Created by Mark Verbeek on 16.03.26.
//

#include "rv32_dirent.h"
#include "rv32_syscalls.h"
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

DIR* opendir(const char* path) {
    struct {
        uint32_t path_ptr;
        uint32_t len;
    } args;
    args.path_ptr = (uint32_t)path;
    args.len      = (uint32_t)strlen(path);

    int32_t handle = sys_opendir(&args);
    if (handle < 0)
        return NULL;

    DIR* dir = malloc(sizeof(DIR));
    if (!dir)
        return NULL;

    dir->handle = handle;
    return dir;
}

struct dirent* readdir(DIR* dir) {
    struct {
        uint32_t handle;
        uint32_t dirent_ptr;
    } args;
    args.handle     = (uint32_t)dir->handle;
    args.dirent_ptr = (uint32_t)&dir->entry;

    int32_t ret = sys_readdir(&args);
    if (ret < 0)
        return NULL;  /* end of directory or error */

    return &dir->entry;
}

void rewinddir(DIR* dir) {
    struct {
        uint32_t handle;
    } args;
    args.handle = (uint32_t)dir->handle;

    sys_rewinddir(&args);
}

int mkdir(const char* path, int mode) {
    struct {
        uint32_t path_ptr;
        uint32_t len;
    } args;
    args.path_ptr = (uint32_t)(uintptr_t)path;
    args.len      = (uint32_t)strlen(path);

    return (int)sys_mkdir(&args);
}

int closedir(DIR* dir) {
    struct {
        uint32_t handle;
    } args;
    args.handle = (uint32_t)dir->handle;

    int32_t ret = sys_closedir(&args);
    free(dir);
    return (int)ret;
}

int access(const char *path, int mode) {
    /* Use opendir/stat-like check: try to open as file via semihosting SYS_OPEN */
    struct {
        uint32_t path_ptr;
        uint32_t open_mode;
        uint32_t len;
    } args;
    args.path_ptr  = (uint32_t)(uintptr_t)path;
    args.open_mode = 1; /* read-only */
    args.len       = (uint32_t)strlen(path);
    int32_t fd = semihost(0x01 /* SYS_OPEN */, (uint32_t)&args);
    if (fd < 0) return -1;
    struct { uint32_t fd; } close_args = { (uint32_t)fd };
    semihost(0x02 /* SYS_CLOSE */, (uint32_t)&close_args);
    return 0;
}

int rmdir(const char *path) {
    /* not supported — return -1 */
    (void)path;
    return -1;
}