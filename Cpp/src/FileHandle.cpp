#include "FileHandle.hpp"
#include <cstring>

DirHandle::DirHandle(const std::filesystem::path &path) {
    if (std::filesystem::is_directory(path)) {
        for (auto &entry: std::filesystem::directory_iterator(path)) {
            entries.push_back(entry);
        }
        open = true;
    }
}

bool DirHandle::isOpen() const {
    return open;
}

void DirHandle::close() {
    entries.clear();
    open = false;
}

const std::filesystem::directory_entry *DirHandle::readNext() {
    if (index >= entries.size()) return nullptr;
    return &entries[index++];
}

void DirHandle::rewind() {
    index = 0;
}

// RegularFile implementation
RegularFile::RegularFile(const std::string &filename, std::ios::openmode mode)
    : filename(filename) {
    file.open(filename, mode | std::ios::binary);
    if (!file.is_open()) {
        // errno already set (hopefully), but we can try to be more specific
        errno = ENOENT; // Most common case
    }
}

ssize_t RegularFile::read(char *buffer, size_t count) {
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

ssize_t RegularFile::write(const char *buffer, size_t count) {
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
StandardStream::StandardStream(std::istream *input)
    : in(input), out(nullptr) {
}

StandardStream::StandardStream(std::ostream *output)
    : in(nullptr), out(output) {
}

ssize_t StandardStream::read(char *buffer, size_t count) {
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

ssize_t StandardStream::write(const char *buffer, size_t count) {
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
    errno = ESPIPE; // Illegal seek on pipe/stream
    return -1;
}

ssize_t StandardStream::seek(ssize_t offset) {
    errno = ESPIPE; // Can't seek on standard streams
    return -1;
}

// FileHandleTable implementation
FileHandleTable::FileHandleTable(const std::string &base_directory) : next_fd(3), next_dd(0), base_dir(base_directory) {
    std::filesystem::create_directories(base_directory);
    file_handles[0] = std::make_unique < StandardStream > (&std::cin);
    file_handles[1] = std::make_unique < StandardStream > (&std::cout);
    file_handles[2] = std::make_unique < StandardStream > (&std::cerr);
}

static std::string sanitize_path(const std::string &path) {
    std::string s = std::filesystem::path(path).lexically_normal().string();
    if (!s.empty() && s[0] == '/') s = s.substr(1);
    return s;
}

bool FileHandleTable::isPathSafe(const std::string &path) const {
    auto full = std::filesystem::weakly_canonical(std::filesystem::path(base_dir) / path);
    auto base = std::filesystem::weakly_canonical(base_dir);

    auto [a, b] = std::mismatch(base.begin(), base.end(), full.begin(), full.end());
    return a == base.end();
}

int FileHandleTable::openFile(const std::string &filename, std::ios::openmode mode) {
    int fd;
    if (filename == ":tt") {
        if (mode == std::ios::app) {
            fd = 2;
        } else if (mode == std::ios::trunc) {
            fd = 1;
        } else {
            fd = 0;
        }
        return fd;
    }
    std::string safe_path = sanitize_path(filename);

    // Check if path is safe
    if (!isPathSafe(safe_path)) {
        errno = EACCES;
        return -1;
    }

    // Build full path
    std::filesystem::path full_path = std::filesystem::path(base_dir) / safe_path;
    fd = next_fd++;
    file_handles[fd] = std::make_unique < RegularFile > (full_path, mode);

    if (!file_handles[fd]->isOpen()) {
        file_handles.erase(fd);
        // errno already set by RegularFile
        return -1;
    }

    return fd;
}

ssize_t FileHandleTable::readFile(int fd, char *buffer, size_t count) {
    if (file_handles.find(fd) == file_handles.end()) {
        errno = EBADF;
        return -1;
    }
    return file_handles[fd]->read(buffer, count);
}

ssize_t FileHandleTable::writeFile(int fd, const char *buffer, size_t count) {
    if (file_handles.find(fd) == file_handles.end()) {
        errno = EBADF;
        return -1;
    }
    return file_handles[fd]->write(buffer, count);
}

int FileHandleTable::closeFile(int fd) {
    if (fd <= 2) {
        // Can close, but just no-op for standard streams
        // Some programs try to close stdout/stderr
        return 0;
    }

    if (file_handles.find(fd) == file_handles.end()) {
        errno = EBADF;
        return -1;
    }

    file_handles[fd]->close();
    file_handles.erase(fd);
    return 0;
}

ssize_t FileHandleTable::getFileLength(int fd) {
    if (file_handles.find(fd) == file_handles.end()) {
        errno = EBADF;
        return -1;
    }
    return file_handles[fd]->getLength();
}

ssize_t FileHandleTable::seekFile(int fd, ssize_t offset) {
    if (file_handles.find(fd) == file_handles.end()) {
        errno = EBADF;
        return -1;
    }
    return file_handles[fd]->seek(offset);
}

int FileHandleTable::removeFile(const std::string &path) {
    std::string safe_path = sanitize_path(path);
    // Check if path is safe
    if (!isPathSafe(safe_path)) {
        errno = EACCES;
        return -1;
    }
    std::filesystem::path full_path = std::filesystem::path(base_dir) / safe_path;
    std::error_code ec;
    if (!std::filesystem::remove(full_path, ec)) {
        errno = ec ? ec.value() : ENOENT;
        return -1;
    }
    return 0;
}

int FileHandleTable::renameFile(const std::string &old_path, const std::string &new_path) {
    std::string safe_old = sanitize_path(old_path);
    std::string safe_new = sanitize_path(new_path);

    if (!isPathSafe(safe_old) || !isPathSafe(safe_new)) {
        errno = EACCES;
        return -1;
    }

    std::error_code ec;
    std::filesystem::rename(
        std::filesystem::path(base_dir) / safe_old,
        std::filesystem::path(base_dir) / safe_new, ec);

    if (ec) {
        errno = ec.value();
        return -1;
    }
    return 0;
}

int FileHandleTable::openDir(const std::string &path) {
    int dd;
    std::string safe_path = sanitize_path(path);
    // Check if path is safe
    if (!isPathSafe(safe_path)) {
        errno = EACCES;
        return -1;
    }

    // Build full path
    std::filesystem::path full_path = std::filesystem::path(base_dir) / safe_path;
    dd = next_dd++;
    dir_handles[dd] = std::make_unique < DirHandle > (full_path);

    if (!dir_handles[dd]->isOpen()) {
        dir_handles.erase(dd);
        // errno already set by RegularFile
        return -1;
    }

    return dd;
}

const std::filesystem::directory_entry *FileHandleTable::dirReadNext(int dd) {
    auto it = dir_handles.find(dd);
    if (it == dir_handles.end()) {
        errno = EBADF;
        return nullptr;
    }
    return it->second->readNext();
}

int FileHandleTable::closeDir(int dd) {
    auto it = dir_handles.find(dd);
    if (it == dir_handles.end()) {
        errno = EBADF;
        return -1;
    }
    dir_handles[dd]->close();
    dir_handles.erase(dd);
    return 0;
}

int FileHandleTable::makeDir(const std::string &path) {
    std::string safe_path = sanitize_path(path);
    if (!isPathSafe(safe_path)) {
        errno = EACCES;
        return -1;
    }
    std::filesystem::path full_path = std::filesystem::path(base_dir) / safe_path;
    std::error_code ec;
    std::filesystem::create_directory(full_path, ec);
    if (ec && ec != std::make_error_code(std::errc::file_exists)) {
        errno = ec.value();
        return -1;
    }
    return 0;
}

int FileHandleTable::rewindDir(int dd) {
    auto it = dir_handles.find(dd);
    if (it == dir_handles.end()) {
        errno = EBADF;
        return -1;
    }
    it->second->rewind();
    return 0;
}