//
// Created by Mark Verbeek on 18.10.25.
//

#ifndef CPU_HPP
#define CPU_HPP

#include <cstdint>
#include <random>

#include "ISA.hpp"

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

	bool running;

private:
	uint32_t fetch() const;
    static DecodedInstruction decode(uint32_t data);
    void execute(DecodedInstruction inst);
    void init_regs(bool initRandom);
	uint32_t read_u32(uint32_t address) const;
	uint16_t read_u16(uint32_t address) const;
	uint8_t read_u8(uint32_t address) const;
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
	static void print_inst(DecodedInstruction inst);
	template<typename T>
	T read_value(uint32_t address) const;
	template<typename T>
	void write_value(uint32_t address, T value);

    std::mt19937 rng;
    uint32_t pc;
    uint32_t regs[32];
	bool update_pc;
	std::vector<uint8_t> ram;
};



#endif //CPU_HPP
