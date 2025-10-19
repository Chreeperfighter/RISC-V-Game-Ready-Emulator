//
// Created by Mark Verbeek on 14.10.25.
//

#ifndef UTIL_H
#define UTIL_H
#include <stdint.h>

void breakpoint(void);
unsigned int get_display_width();
unsigned int get_display_height();
void set_display_enable(int enable);
unsigned int get_display_status(void);
void update_display();
unsigned long long get_cycles(void);
int read(uint32_t fd, const char *buffer, uint32_t max_bytes);
int write(uint32_t fd, const char *buffer, uint32_t num_bytes);

#endif //UTIL_H
