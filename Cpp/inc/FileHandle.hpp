#ifndef FILE_HANDLE_HPP
#define FILE_HANDLE_HPP

#include <iostream>
#include <fstream>
#include <unordered_map>
#include <memory>
#include <string>
#include <cerrno>
#include <filesystem>

#define DT_DIR 4
#define DT_REG 8

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

class DirHandle {
    std::vector<std::filesystem::directory_entry> entries;
    size_t index = 0;
    bool open = false;
public:
    DirHandle(const std::filesystem::path& path);
    bool isOpen() const;
    void close();
    const std::filesystem::directory_entry* readNext();
    void rewind();
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
    std::unordered_map<int, std::unique_ptr<FileHandle>> file_handles;
    std::unordered_map<int, std::unique_ptr<DirHandle>> dir_handles;
    int next_fd;
    int next_dd;
    std::string base_dir;

public:
    FileHandleTable(const std::string& base_directory);
    
    // Syscall-like interface - sets errno on error
    bool isPathSafe(const std::string& path) const;
    int openFile(const std::string& filename, std::ios::openmode mode);
    ssize_t readFile(int fd, char* buffer, size_t count);
    ssize_t writeFile(int fd, const char* buffer, size_t count);
    int closeFile(int fd);
    ssize_t getFileLength(int fd);
    ssize_t seekFile(int fd, ssize_t offset);
    int removeFile(const std::string& path);
    int renameFile(const std::string& old_path, const std::string& new_path);

    int openDir(const std::string& path);
    const std::filesystem::directory_entry* dirReadNext(int dd);
    int closeDir(int dd);
    int makeDir(const std::string& path);
    int rewindDir(int dd);
};

#endif // FILE_HANDLE_HPP