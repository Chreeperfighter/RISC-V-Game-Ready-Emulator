//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef SYSCALL_HPP
#define SYSCALL_HPP
#include <cstdint>

enum class Syscall : uint32_t {
    READ = 63,
    // a0 -> fd (0 = stdin, 1 = stdout, 2 = stderr)
    // a1 -> buffer address
    // a2 -> max length
    // a0 <- bytes read
    WRITE = 64,
    // a0 -> fd (0 = stdin, 1 = stdout, 2 = stderr)
    // a1 -> buffer address
    // a2 -> number of bytes
    // a0 <- bytes written
    FSTAT = 80,
    // a0 -> fd (0 = stdin, 1 = stdout, 2 = stderr)
    // a1 -> stat buffer
    // a0 <- status (0: success, -1: error)
    BRK = 214,
    // a0 -> break address (0 = don't change)
    // a0 <- program break address
    GET_CYCLES = 100,
    // a0 <- lower 32 bit
    // a1 <- upper 32 bit
    SHOW_BUFFER = 101,
    // a0 -> framebuffer address
    GET_FRAMEBUFFER_INFO = 200,
    // a0 -> address to write info
    // a0 <- status (0: success, != 0: error)
    EXIT = 10,
    // a0 -> exit code
    GET_US = 11,
    // a0 <- time in us
    SLEEP_US = 12,
    // a0 -> time in us
    KEY_AVAILABLE = 13,
    // a0 <- available (0: queue empty)
    GET_KEY = 14,
    // a0 <- key code
    IS_KEY_DOWN = 15,
    // a0 -> key code to check
    // a0 <- key down (1 if down, 0 if up)
    CLEAR_KEY_QUEUE = 16,
    // a0 <- success (0 if success, -1 if fail)
    GET_MOUSE_POS = 17,
    // a0 <- x position
    // a1 <- y position
    IS_MOUSE_BUTTON_DOWN = 18,
    // a0 -> button
    // a0 <- key down (1 if down, 0 if up)

    /*
     * SEMIHOSTING
     */
    SYS_EXIT = 0x18,
    /*
    An application calls this operation to report an exception to the debugger directly. The most common use is to report
    that execution has completed, using ADP_Stopped_ApplicationExit.
    */
    SYS_EXIT_EXTENDED = 0x20,

    SYS_GET_FRAMEBUFFER_INFO = 0x12,
    /*
    Returns framebuffer configuration information.
    Entry
    On entry, the PARAMETER REGISTER contains a pointer to a data block:
        A writeable memory address where framebuffer information will be written.
    Return
    On exit, the RETURN REGISTER contains:
        • 0 if the call is successful.
        • –1 if an error occurs (invalid address).
    The data block is populated with:
        • field 1: Framebuffer width (uint32_t)
        • field 2: Framebuffer height (uint32_t)
        • field 3: Framebuffer bits per pixel (uint32_t)
    */

    SYS_SHOW_FRAMEBUFFER = 0x11,
    /*
    Returns framebuffer configuration information.
    Entry
    On entry, the PARAMETER REGISTER contains the address of the framebuffer
    Return
    */

    SYS_GET_MOUSE_POS = 0x14,
    /*
    Returns the position of the mouse cursor
    Entry
    On entry, the PARAMETER REGISTER contains the address of a pointer to a two field data block.
    The data block is updated as follows:
    field 1
        x position
    field 2
        y position
    */

    SYS_FLEN = 0x0C,
    /*
    Returns the length of a specified file.
    6.7.1 Entry
    On entry, the PARAMETER REGISTER contains a pointer to a one-field argument block:
    field 1
        A handle for a previously opened, seekable file object.
    6.7.2 Return
    On exit, the RETURN REGISTER contains:
        • The current length of the file object, if the call is successful.
        • –1 if an error occurs.
    */
    SYS_ISTTY = 0x09,
    /*
    Checks whether a file is connected to an interactive device.
    6.11.1 Entry
    On entry, the PARAMETER REGISTER contains a pointer to a one-field argument block:
    field 1
        A handle for a previously opened file object.
    6.11.2 Return
    On exit, the RETURN REGISTER contains:
        • 1 if the handle identifies an interactive device.
        • 0 if the handle identifies a file.
        • A value other than 1 or 0 if an error occurs.
    */
    SYS_WRITE = 0x05,
    /*
    Writes the contents of a buffer to a specified file at the current file position.
    The file position is specified either:
        •  Explicitly, by a SYS_SEEK (0x0A).
        • Implicitly as one byte beyond the previous SYS_READ (0x06) or SYS_WRITE (0x05) request.
    The file position is at the start of the file when the file is opened, and is lost when the file is closed.
    Perform the file operation as a single action whenever possible. For example, do not split a write of 16KB into four 4KB
    chunks unless there is no alternative.
    6.22.1 Entry
    On entry, the PARAMETER REGISTER contains a pointer to a three-field data block:
    field 1
        Contains a handle for a file previously opened with SYS_OPEN (0x01).
    field 2
        Points to the memory containing the data to be written.
    field 3
        Contains the number of bytes to be written from the buffer to the file.
    6.22.2 Return
    On exit, the RETURN REGISTER contains:
        • 0 if the call is successful.
        • The number of bytes that are not written, if there is an error.
    */
    SYS_OPEN = 0x01,
    /*
    Opens a file on the host system.
    6.12.1 Entry
    On entry, the PARAMETER REGISTER contains a pointer to a three-field argument block:
    field 1
        A pointer to a null-terminated string containing a file or device name.
    field 2
        An integer that specifies the file opening mode. The Value of mode table gives the valid values for the integer,
        and their corresponding ISO C fopen() mode.
    field 3
        An integer that gives the length of the string pointed to by field 1.
        The length does not include the terminating null character that must be present.
    6.12.2 Return
    On exit, the RETURN REGISTER contains:
        • A nonzero handle if the call is successful.
        • –1 if the call is not successful.
    */
    SYS_ERRNO = 0x13,
    /*
    Returns the value of the C library errno variable that is associated with the semihosting implementation.
    Whether errno is set or not, and to what value, is entirely host-specific, except where the ISO C standard defines the
    behavior.
    6.4.1 Entry
        There are no parameters. The PARAMETER REGISTER must be 0.
    6.4.2 Return
        On exit, the RETURN REGISTER contains the value of the C library errno variable.
    */
    SYS_CLOSE = 0x02,
    /*
    Closes a file on the host system. The handle must reference a file that was opened with SYS_OPEN (0x01).
    6.2.1 Entry
    On entry, the PARAMETER REGISTER contains a pointer to a one-field argument block:
    field 1
        Contains a handle for an open file.
    6.2.2 Return
    On exit, the RETURN REGISTER contains:
        • 0 if the call is successful
        • –1 if the call is not successful.
    */
};

#endif //SYSCALL_HPP
