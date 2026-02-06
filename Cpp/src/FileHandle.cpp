#include "FileHandle.hpp"
#include <cstring>

// RegularFile implementation
RegularFile::RegularFile(const std::string& filename, std::ios::openmode mode)
    : filename(filename) {
    file.open(filename, mode | std::ios::binary);
    if (!file.is_open()) {
        // errno already set (hopefully), but we can try to be more specific
        errno = ENOENT;  // Most common case
    }
}

ssize_t RegularFile::read(char* buffer, size_t count) {
    if (!file.is_open()) {
        errno = EBADF;
        return -1;
    }

    file.read(buffer, count);
    ssize_t bytes_read = file.gcount();

    if (file.bad()) {
        errno = EIO;
        return -1;
    }

    // EOF is not an error, just return 0 or partial read
    return bytes_read;
}

ssize_t RegularFile::write(const char* buffer, size_t count) {
    if (!file.is_open()) {
        errno = EBADF;
        return -1;
    }

    file.write(buffer, count);

    if (file.bad()) {
        errno = EIO;
        return -1;
    }

    if (file.fail()) {
        errno = ENOSPC;
        return -1;
    }

    return count;
}

void RegularFile::close() {
    file.close();
}

bool RegularFile::isOpen() const {
    return file.is_open();
}

ssize_t RegularFile::getLength() {
    if (!file.is_open()) {
        errno = EBADF;
        return -1;
    }

    std::streampos current = file.tellg();
    if (current == static_cast<std::streampos>(-1)) {
        current = file.tellp();
    }

    file.seekg(0, std::ios::end);
    std::streampos length = file.tellg();

    if (length == static_cast<std::streampos>(-1)) {
        errno = EIO;
        if (current != static_cast<std::streampos>(-1)) {
            file.seekg(current);
        }
        return -1;
    }

    if (current != static_cast<std::streampos>(-1)) {
        file.seekg(current);
    }

    return static_cast<ssize_t>(length);
}

ssize_t RegularFile::seek(ssize_t offset) {
    if (!file.is_open()) {
        errno = EBADF;
        return -1;
    }

    // Negative offset is invalid
    if (offset < 0) {
        errno = EINVAL;
        return -1;
    }

    // Clear any error flags before seeking
    file.clear();

    // Seek from beginning on both input and output positions
    file.seekg(offset, std::ios::beg);
    file.seekp(offset, std::ios::beg);

    // Try to get position from input first, then output
    std::streampos pos = file.tellg();
    if (pos == static_cast<std::streampos>(-1) || file.fail()) {
        file.clear();
        pos = file.tellp();
    }

    // If both failed, return error
    if (pos == static_cast<std::streampos>(-1)) {
        errno = EINVAL;
        return -1;
    }

    // Clear any error flags that might have been set
    file.clear();

    return static_cast<ssize_t>(pos);
}

// StandardStream implementation
StandardStream::StandardStream(std::istream* input)
    : in(input), out(nullptr) {}

StandardStream::StandardStream(std::ostream* output)
    : in(nullptr), out(output) {}

ssize_t StandardStream::read(char* buffer, size_t count) {
    if (!in) {
        errno = EBADF;
        return -1;
    }

    in->read(buffer, count);
    ssize_t bytes_read = in->gcount();

    if (in->bad()) {
        errno = EIO;
        return -1;
    }

    return bytes_read;
}

ssize_t StandardStream::write(const char* buffer, size_t count) {
    if (!out) {
        errno = EBADF;
        return -1;
    }

    out->write(buffer, count);
    out->flush();

    if (out->bad() || out->fail()) {
        errno = EIO;
        return -1;
    }

    return count;
}

void StandardStream::close() {
    // Don't actually close standard streams
}

bool StandardStream::isOpen() const {
    return true;
}

ssize_t StandardStream::getLength() {
    errno = ESPIPE;  // Illegal seek on pipe/stream
    return -1;
}

ssize_t StandardStream::seek(ssize_t offset) {
    errno = ESPIPE;  // Can't seek on standard streams
    return -1;
}

// FileHandleTable implementation
FileHandleTable::FileHandleTable(const std::string& base_directory) : next_fd(3), base_dir(base_directory) {
    handles[0] = std::make_unique<StandardStream>(&std::cin);
    handles[1] = std::make_unique<StandardStream>(&std::cout);
    handles[2] = std::make_unique<StandardStream>(&std::cerr);
}

bool FileHandleTable::isPathSafe(const std::string& path) const {
    // Check for absolute paths
    if (path.find("/") == 0 || path.find("\\") == 0) {
        return false;
    }

    // Check for drive letters (Windows)
    if (path.length() >= 2 && path[1] == ':') {
        return false;
    }

    // Resolve the path and check if it stays within base_dir
    std::filesystem::path full_path = std::filesystem::path(base_dir) / path;
    std::filesystem::path canonical = std::filesystem::weakly_canonical(full_path);

    // Check if canonical path starts with base_dir
    std::string canonical_str = canonical.string();
    std::string base_str = base_dir;

    // Make sure we're comparing full directory components
    if (!base_str.empty() && base_str.back() != std::filesystem::path::preferred_separator) {
        base_str += std::filesystem::path::preferred_separator;
    }

    return canonical_str.find(base_str) == 0;
}

int FileHandleTable::open(const std::string& filename, std::ios::openmode mode) {
    int fd;
    if (filename == ":tt") {
        if (mode == std::ios::app) {
            fd = 2;
        }
        else if (mode == std::ios::trunc) {
            fd = 1;
        }
        else {
            fd = 0;
        }
        return fd;
    }
    // Check if path is safe
    if (!isPathSafe(filename)) {
        errno = EACCES;
        return -1;
    }

    // Build full path
    std::filesystem::path full_path = std::filesystem::path(base_dir) / filename;
    fd = next_fd++;
    handles[fd] = std::make_unique<RegularFile>(full_path, mode);

    if (!handles[fd]->isOpen()) {
        handles.erase(fd);
        // errno already set by RegularFile
        return -1;
    }

    return fd;
}

ssize_t FileHandleTable::read(int fd, char* buffer, size_t count) {
    if (handles.find(fd) == handles.end()) {
        errno = EBADF;
        return -1;
    }
    return handles[fd]->read(buffer, count);
}

ssize_t FileHandleTable::write(int fd, const char* buffer, size_t count) {
    if (handles.find(fd) == handles.end()) {
        errno = EBADF;
        return -1;
    }
    return handles[fd]->write(buffer, count);
}

int FileHandleTable::close(int fd) {
    if (fd <= 2) {
        // Can close, but just no-op for standard streams
        // Some programs try to close stdout/stderr
        return 0;
    }

    if (handles.find(fd) == handles.end()) {
        errno = EBADF;
        return -1;
    }

    handles[fd]->close();
    handles.erase(fd);
    return 0;
}

ssize_t FileHandleTable::getLength(int fd) {
    if (handles.find(fd) == handles.end()) {
        errno = EBADF;
        return -1;
    }
    return handles[fd]->getLength();
}

ssize_t FileHandleTable::seek(int fd, ssize_t offset) {
    if (handles.find(fd) == handles.end()) {
        errno = EBADF;
        return -1;
    }
    return handles[fd]->seek(offset);
}