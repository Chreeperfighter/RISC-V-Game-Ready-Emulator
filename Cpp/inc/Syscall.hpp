//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef SYSCALL_HPP
#define SYSCALL_HPP
#include <cstdint>

enum class Syscall : uint32_t {
    /*
     * SEMIHOSTING
     */
    SYS_EXIT = 0x18,
    /*
    An application calls this operation to report an exception to the debugger directly. The most common use is to report
    that execution has completed, using ADP_Stopped_ApplicationExit.
    */
    SYS_EXIT_EXTENDED = 0x20,

    SYS_GET_DISPLAY_INFO = 0x100,
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

    SYS_SHOW_FRAMEBUFFER = 0x101,
    /*
    Returns framebuffer configuration information.
    Entry
    On entry, the PARAMETER REGISTER contains the address of the framebuffer
    Return
    */

    SYS_GET_US = 0x102,
    /*
    Return the time in us
    Entry:
    On entry, the PARAMETER REGISTER contains a pointer to a data block:
        A writeable memory address where the time will be written.
    Return:
    On exit, the RETURN REGISTER contains:
        • 0 if the call is successful.
        • –1 if an error occurs (invalid address).
    The data block is populated with:
        • field 1: Time in us (uint32_t)
    */

    SYS_SLEEP_US = 0x103,
    /*
    On entry, the PARAMETER REGISTER contains a pointer to a data block:
        Time to sleep in us.
    On exit, the RETURN REGISTER contains:
        • 0 if the call is successful.
        • –1 if an error occurs (invalid address).
    */

    SYS_KEY_AVAILABLE = 0x104,
    /*
    On exit, the RETURN REGISTER contains:
        0 if queue is empty
        != 0 if queue isn't empty
    */

    SYS_GET_KEY = 0x105,
    /*
    On exit, the RETURN REGISTER contains:
        Key Code
    */

    SYS_IS_KEY_DOWN = 0x106,
    /*
    Returns if the given key is down
    Entry
    On entry, the PARAMETER REGISTER contains the key to check
    Return
    On exit, the RETURN REGISTER contains:
        • 1 if the button is down.
        • 0 if the button is up.
        • -1 if an error occurred.
    */

    SYS_GET_MOUSE_POS = 0x107,
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

    SYS_IS_MOUSE_BUTTON_DOWN = 0x108,
    /*
    Entry
    On entry, the PARAMETER REGISTER contains a pointer to a data block:
        Mouse button to check.
    Return
    On exit, the RETURN REGISTER contains:
        • 1 if the button is pressed.
        • 0 if the button is not pressed.
        • -1 if an error occurred.
    */

    SYS_OPENDIR = 0x109,
    SYS_READDIR = 0x10A,
    SYS_CLOSEDIR = 0x10B,
    SYS_MKDIR = 0x10C,
    SYS_REWINDDIR = 0x10D,

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
    SYS_REMOVE = 0x0E,
    SYS_RENAME = 0x0F,
    SYS_SEEK = 0x0A,
    /*
    Seeks to a specified position in a file using an offset specified from the start of the file.
    The file is assumed to be a byte array and the offset is given in bytes.
    6.17.1 Entry
    On entry, the PARAMETER REGISTER contains a pointer to a two-field data block:
    field 1
        A handle for a seekable file object.
    field 2
        The absolute byte position to seek to.
    6.17.2 Return
    On exit, the RETURN REGISTER contains:
        • 0 if the request is successful.
        • A negative value if the request is not successful. Use SYS_ERRNO (0x13) to read the value of the host errno
    variable describing the error.
    */
    SYS_READ = 0x06,
    /*
    Reads the contents of a file into a buffer.
    The file position is specified either:
        • Explicitly by a SYS_SEEK (0x0A).
        • Implicitly one byte beyond the previous SYS_READ (0x06) or SYS_WRITE (0x05) request.
    The file position is at the start of the file when it is opened, and is lost when the file is closed. Perform the file operation
    as a single action whenever possible. For example, do not split a read of 16KB into four 4KB chunks unless there is no
    alternative.
    6.13.1 Entry
    On entry, the PARAMETER REGISTER contains a pointer to a three-field data block:
    field 1
        Contains a handle for a file previously opened with SYS_OPEN (0x01).
    field 2
        Points to a buffer.
    field 3
        Contains the number of bytes to read to the buffer from the file.
    6.13.2 Return
    On exit, the RETURN REGISTER contains the number of bytes not filled in the buffer
    (buffer_length - bytes_read) as follows:
        • If the RETURN REGISTER is 0, the entire buffer was successfully filled.
        • If the RETURN REGISTER is the same as field 3, no bytes were read (EOF can be assumed).
        • If the RETURN REGISTER contains a value smaller than field 3, the read succeeded but the buffer was only
    partly filled. For interactive devices, this is the most common return value.
    */
    SYS_WRITE0 = 0x04,
    /*
    Writes a null-terminated string to the debug channel.
    When executed under an ARM debugger, the characters appear on the host debugger console.
    6.24.1 Entry
    On entry, the PARAMETER REGISTER contains a pointer to the first byte of the string.
    6.24.2 Return
    None. The RETURN REGISTER is corrupted.
    */
};

#endif //SYSCALL_HPP
