//
// Created by Mark Verbeek on 16.03.26.
//

#ifndef COMMON_RV32_DIRENT_H
#define COMMON_RV32_DIRENT_H

#define DT_DIR 4
#define DT_REG 8

struct dirent {
    unsigned char d_type;
    char          d_name[256];
};

/* Opaque directory stream, like POSIX DIR */
typedef struct {
    int           handle;  /* host-side dir handle from SYS_OPENDIR */
    struct dirent entry;   /* storage for current entry, returned by readdir() */
} DIR;

DIR*           opendir(const char* path);
struct dirent* readdir(DIR* dir);
int            closedir(DIR* dir);
void           rewinddir(DIR* dir);
int            access(const char *path, int mode);
int            rmdir(const char *path);

#endif //COMMON_RV32_DIRENT_H