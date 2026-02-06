#ifndef FILE_HANDLE_HPP
#define FILE_HANDLE_HPP

#include <iostream>
#include <fstream>
#include <unordered_map>
#include <memory>
#include <string>
#include <cerrno>
#include <filesystem>

class FileHandle {
public:
    virtual ~FileHandle() = default;
    virtual ssize_t read(char* buffer, size_t count) = 0;
    virtual ssize_t write(const char* buffer, size_t count) = 0;
    virtual void close() = 0;
    virtual bool isOpen() const = 0;
    virtual ssize_t getLength() = 0;
    virtual ssize_t seek(ssize_t offset) = 0;
};

class RegularFile : public FileHandle {
    std::fstream file;
    std::string filename;
public:
    RegularFile(const std::string& filename, std::ios::openmode mode);
    
    ssize_t read(char* buffer, size_t count) override;
    ssize_t write(const char* buffer, size_t count) override;
    void close() override;
    bool isOpen() const override;
    ssize_t getLength() override;
    ssize_t seek(ssize_t offset) override;
};

class StandardStream : public FileHandle {
    std::istream* in;
    std::ostream* out;
    
public:
    StandardStream(std::istream* input);
    StandardStream(std::ostream* output);
    
    ssize_t read(char* buffer, size_t count) override;
    ssize_t write(const char* buffer, size_t count) override;
    void close() override;
    bool isOpen() const override;
    ssize_t getLength() override;
    ssize_t seek(ssize_t offset) override;
};

class FileHandleTable {
    std::unordered_map<int, std::unique_ptr<FileHandle>> handles;
    int next_fd;
    std::string base_dir;

public:
    FileHandleTable(const std::string& base_directory);
    
    // Syscall-like interface - sets errno on error
    bool isPathSafe(const std::string& path) const;
    int open(const std::string& filename, std::ios::openmode mode);
    ssize_t read(int fd, char* buffer, size_t count);
    ssize_t write(int fd, const char* buffer, size_t count);
    int close(int fd);
    ssize_t getLength(int fd);
    ssize_t seek(int fd, ssize_t offset);
};

#endif // FILE_HANDLE_HPP