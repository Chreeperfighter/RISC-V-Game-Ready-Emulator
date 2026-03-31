/*
 * Bare-metal C++ ABI support
 *
 * __dso_handle  – DSO identity handle; needed by __cxa_atexit for registering
 *                 static destructors.  On bare metal there is no dynamic
 *                 linker, so we define it ourselves.
 *
 * __cxa_atexit  – Registers a destructor to be called when the DSO is
 *                 unloaded (or at program exit).  Since we never return from
 *                 main() in a meaningful way on bare metal, we stub it out
 *                 so the linker is satisfied without dragging in atexit().
 */

void *__dso_handle __attribute__((weak)) = &__dso_handle;

int __cxa_atexit(void (*destructor)(void *), void *arg, void *dso) {
    (void)destructor;
    (void)arg;
    (void)dso;
    return 0;
}