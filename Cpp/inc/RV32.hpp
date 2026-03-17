//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef CPU_HPP
#define CPU_HPP

#include <cstdint>
#include <random>
#include <queue>

#include "Config.hpp"
#include "ISA.hpp"
#include "Registers.hpp"
#include "ELFLoader.hpp"
#include "FileHandle.hpp"

struct DecodedInstruction {
  	Opcode opcode;
  	uint8_t rd;
  	uint8_t rs1;
  	uint8_t rs2;
  	Funct3 funct3;
  	Funct7 funct7;
  	int32_t imm;
};

enum class TrapReason {
	None,
	Breakpoint,
	IllegalInst,
	MemFault,
};

class RV32 {
public:
    RV32(bool randomizeRegs, bool randomizeMemory, std::string base_dir);
    void step();
	void load_section(const ELFSection &section);
	void set_entry(uint32_t entry);
	uint32_t get_pc() const {
		return pc;
	}
	uint32_t read_reg(uint8_t index) const {
		return regs.read(index);
	}
	Registers get_regs() const {
		return regs;
	}
	void get_transfer_buffer(std::vector<uint8_t>& display_buffer) const {
		std::lock_guard<std::mutex> lock(transfer_buffer_mtx);
		display_buffer = transfer_buffer;
	}
	void add_key_to_queue(const uint32_t key) {
		std::lock_guard<std::mutex> lock(queue_mtx);
		key_queue.push(key);
	}
	void add_key_state(const uint32_t key) {
		key_state[key] = true;
	}
	void remove_key_state(const uint32_t key) {
		key_state[key] = false;
	}
	void add_mouse_button_state(const uint32_t mouse_button) {
		mouse_button_state[mouse_button] = true;
	}
	void remove_mouse_button_state(const uint32_t mouse_button) {
		mouse_button_state[mouse_button] = false;
	}
	void set_mouse_pos(const int32_t x, const int32_t y) {
		mouse_pos_x = x;
		mouse_pos_y = y;
	}
	uint64_t get_cycles() {
		return std::atomic_ref<uint64_t>(cycles).load(std::memory_order_relaxed);
	}
	std::vector<uint8_t> read_bytes(uint32_t address, size_t size);

	bool running = true;
	TrapReason trap = TrapReason::None;
	std::string trap_message;

private:
	uint32_t fetch();
	DecodedInstruction decode(uint32_t data);
    void execute(DecodedInstruction inst);
    void init_regs(bool initRandom);
	uint64_t read_u64(uint32_t address);
	uint32_t read_u32(uint32_t address);
	uint16_t read_u16(uint32_t address);
	uint8_t read_u8(uint32_t address);
	void write_u64(uint32_t address, uint64_t value);
	void write_u32(uint32_t address, uint32_t value);
	void write_u16(uint32_t address, uint16_t value);
	void write_u8(uint32_t address, uint8_t value);
	void write_bytes(uint32_t address, const std::vector<uint8_t> &value);
	[[gnu::always_inline]] static void decode_r_type(DecodedInstruction &inst, uint32_t data);
	[[gnu::always_inline]] static void decode_i_type(DecodedInstruction &inst, uint32_t data);
	[[gnu::always_inline]] static void decode_s_type(DecodedInstruction &inst, uint32_t data);
	[[gnu::always_inline]] static void decode_b_type(DecodedInstruction &inst, uint32_t data);
	[[gnu::always_inline]] static void decode_u_type(DecodedInstruction &inst, uint32_t data);
	[[gnu::always_inline]] static void decode_j_type(DecodedInstruction &inst, uint32_t data);
	[[gnu::always_inline]] static inline uint32_t get_bits(uint32_t data, unsigned int start, unsigned int end);
    void handle_sys_exit(uint32_t exit_code);
    void handle_sys_exit_extended(uint32_t parameter);
	void handle_sys_get_display_info(uint32_t parameter);
	void handle_sys_show_framebuffer(uint32_t parameter);
	void handle_sys_get_mouse_pos(uint32_t parameter);
	void handle_sys_is_mouse_button_down(uint32_t parameter);
	void handle_sys_get_us(uint32_t parameter);
	void handle_sys_sleep_us(uint32_t parameter);
	void handle_sys_key_available(uint32_t parameter);
	void handle_sys_get_key(uint32_t parameter);
	void handle_sys_is_key_down(uint32_t parameter);
	void handle_sys_opendir(uint32_t parameter);
	void handle_sys_readdir(uint32_t parameter);
	void handle_sys_closedir(uint32_t parameter);
	void handle_sys_mkdir(uint32_t parameter);
	void handle_sys_rewinddir(uint32_t parameter);
    void handle_sys_flen(uint32_t parameter);
    void handle_sys_istty(uint32_t parameter);
    void handle_sys_write(uint32_t parameter);
    void handle_sys_open(uint32_t parameter);
    void handle_sys_close(uint32_t parameter);
	void handle_sys_remove(uint32_t parameter);
	void handle_sys_rename(uint32_t parameter);
	void handle_sys_seek(uint32_t parameter);
	void handle_sys_read(uint32_t parameter);
	void handle_sys_write0(uint32_t parameter);
	[[gnu::always_inline]] static int32_t sign_extend(uint32_t value, unsigned int fromBits);
	template<typename T>
	T read_value(uint32_t address);
	template<typename T>
	void write_value(uint32_t address, T value);
	template<typename T>
	std::vector<uint8_t> to_bytes(const T &val) {
		const uint8_t *ptr = reinterpret_cast<const uint8_t *>(&val);
		return {ptr, ptr + sizeof(T)};
	}
	void handle_semihosting();
	void trigger_trap(TrapReason trap_reason, const std::string& function_name, const std::string &message);

    bool is_queue_empty() const {
		std::lock_guard<std::mutex> lock(queue_mtx);
		return key_queue.empty();
	}
	uint32_t pop_from_queue() {
	    std::lock_guard<std::mutex> lock(queue_mtx);
    	if (key_queue.empty()) {
    		return 0;
    	}
    	const uint32_t key = key_queue.front();
    	key_queue.pop();
    	return key;
    }

	bool is_read_only(uint32_t address) const {
	    return address < ro_end;
    }

    std::mt19937 rng{std::random_device{}()};
	uint64_t cycles = 0;
    uint32_t pc = 0;
    Registers regs;
	std::vector<uint8_t> ram;
	std::vector<uint8_t> transfer_buffer;
	uint32_t transfer_buffer_address = 0;
	mutable std::mutex transfer_buffer_mtx;
	uint32_t ro_end = 0;
	std::queue<uint32_t> key_queue;
	mutable std::mutex queue_mtx;
	bool key_state[512] = {false};
	bool mouse_button_state[3] = {false};
	int32_t mouse_pos_x = 0;
	int32_t mouse_pos_y = 0;
	int semihosting_step = 0;
	bool semihosting_instruction = false;

	FileHandleTable* fht = nullptr;
};



#endif //CPU_HPP
