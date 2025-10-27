//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef CPU_HPP
#define CPU_HPP

#include <cstdint>
#include <random>
#include <queue>

#include "ISA.hpp"
#include "Registers.hpp"
#include "Devices.hpp"

struct DecodedInstruction {
  	Opcode opcode;
  	uint8_t rd;
  	uint8_t rs1;
  	uint8_t rs2;
  	Funct3 funct3;
  	Funct7 funct7;
  	int32_t imm;

	enum class Format {
   		R_TYPE,
    	I_TYPE,
    	S_TYPE,
    	B_TYPE,
    	U_TYPE,
    	J_TYPE
	} format;
};

class RV32 {
public:
    RV32(bool randomizeRegs, bool randomizeMemory);
    void step();
	void load_bin(const std::vector<uint8_t>& bin, size_t size, uint32_t start_address);
	uint32_t get_pc() const {
		return pc;
	}
	Registers get_regs() const {
		return regs;
	}
	void set_heap(const uint32_t heap) {
		heap_start = heap;
		heap_end = heap;
	}
	void set_text_range(const uint32_t start, const uint32_t end) {
		text_start = start;
		text_end = end;
	}
	void get_transfer_buffer(std::vector<uint8_t>& display_buffer) const {
		std::lock_guard<std::mutex> lock(transfer_buffer_mtx);
		display_buffer = transfer_buffer;
	}
	void add_key_to_queue(const uint32_t key) {
		std::lock_guard<std::mutex> lock(queue_mtx);
		key_queue.push(key);
	}
	mutable bool running = true;

private:
	uint32_t fetch() const;
	DecodedInstruction decode(uint32_t data) const;
    void execute(DecodedInstruction inst);
    void init_regs(bool initRandom);
	uint64_t read_u64(uint32_t address) const;
	uint32_t read_u32(uint32_t address) const;
	uint16_t read_u16(uint32_t address) const;
	uint8_t read_u8(uint32_t address) const;
	std::vector<uint8_t> read_bytes(uint32_t address, size_t size) const;
	void write_u64(uint32_t address, uint64_t value);
	void write_u32(uint32_t address, uint32_t value);
	void write_u16(uint32_t address, uint16_t value);
	void write_u8(uint32_t address, uint8_t value);
	static void decode_r_type(DecodedInstruction &inst, uint32_t data);
	static void decode_i_type(DecodedInstruction &inst, uint32_t data);
	static void decode_s_type(DecodedInstruction &inst, uint32_t data);
	static void decode_b_type(DecodedInstruction &inst, uint32_t data);
	static void decode_u_type(DecodedInstruction &inst, uint32_t data);
	static void decode_j_type(DecodedInstruction &inst, uint32_t data);
	static uint32_t get_bits(uint32_t data, unsigned int start, unsigned int end);
	static int32_t sign_extend(uint32_t value, unsigned int fromBits);
	void print_inst(DecodedInstruction inst) const;
	template<typename T>
	T read_value(uint32_t address) const;
	template<typename T>
	void write_value(uint32_t address, T value);
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

    std::mt19937 rng;
    uint32_t pc;
    Registers regs;
	bool update_pc;
	std::vector<uint8_t> ram;
	std::vector<uint8_t> transfer_buffer;
	uint32_t transfer_buffer_address{};
	mutable std::mutex transfer_buffer_mtx;
	uint32_t heap_start{};
	uint32_t heap_end{};
	uint32_t text_start{};
	uint32_t text_end{};
	std::queue<uint32_t> key_queue;
	mutable std::mutex queue_mtx;
};



#endif //CPU_HPP
