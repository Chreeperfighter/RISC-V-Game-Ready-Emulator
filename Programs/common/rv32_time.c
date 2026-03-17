//
// Created by Mark Verbeek on 11.03.26.
//

#include "rv32_time.h"
#include "rv32_syscalls.h"

uint32_t get_us(bool* ok) {
    uint32_t us;
    int32_t err = sys_get_us(&us);
    if (ok) *ok = (err == 0);
    return us;
}
bool sleep_us(uint32_t duration_us) {
    return sys_sleep_us(&duration_us) == 0;
}

/* newlib hook: called by gettimeofday(). tv points to {long tv_sec, long tv_usec}. */
int _gettimeofday(void *tv, void *tz) {
    (void)tz;
    if (tv) {
        uint32_t us;
        sys_get_us(&us);
        long *t = (long *)tv;
        t[0] = (long)(us / 1000000); /* tv_sec  */
        t[1] = (long)(us % 1000000); /* tv_usec */
    }
    return 0;
}