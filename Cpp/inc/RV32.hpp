//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef CPU_HPP
#define CPU_HPP

#include <cstdint>
#include <random>

#include "Config.hpp"
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
	void load_bin(const uint8_t* bin, size_t size, uint32_t start_address);
	uint32_t get_pc() const {
		return pc;
	}
	Registers get_regs() const {
		return regs;
	}
	uint8_t* get_framebuffer() const {
		return front_buffer.load(std::memory_order_acquire);
	}
	void swap_framebuffers() {
		uint8_t* old_front = front_buffer.load(std::memory_order_acquire);
		front_buffer.store(back_buffer, std::memory_order_release);
		back_buffer = old_front;

	}
	bool running = true;
	Display *display = nullptr;

private:
	uint32_t fetch() const;
    static DecodedInstruction decode(uint32_t data);
    void execute(DecodedInstruction inst);
    void init_regs(bool initRandom);
	uint64_t read_u64(uint32_t address) const;
	uint32_t read_u32(uint32_t address) const;
	uint16_t read_u16(uint32_t address) const;
	uint8_t read_u8(uint32_t address) const;
	const uint8_t* read_bytes(uint32_t address, size_t size) const;
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

    std::mt19937 rng;
    uint32_t pc;
    Registers regs;
	bool update_pc;
	std::vector<uint8_t> ram;
	std::vector<uint8_t> vram;
	mutable std::mutex vram_mutex;
	uint32_t heap_start;
	uint32_t heap_end;
	std::atomic<uint8_t*> front_buffer{nullptr};
	uint8_t* back_buffer = nullptr;
};



#endif //CPU_HPP
