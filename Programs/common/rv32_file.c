//
// Created by Mark Verbeek on 16.03.26.
//

#include "rv32_file.h"

#include <string.h>

int rename(const char *oldpath, const char *newpath) {
    struct {
        uint32_t old_ptr;  // pointer to old path string
        uint32_t old_len;  // length of old path (without null)
        uint32_t new_ptr;  // pointer to new path string
        uint32_t new_len;  // length of new path (without null)
    } args;

    args.old_ptr = (uint32_t)oldpath;
    args.old_len = strlen(oldpath);
    args.new_ptr = (uint32_t)newpath;
    args.new_len = strlen(newpath);

    return sys_rename(&args);
}
