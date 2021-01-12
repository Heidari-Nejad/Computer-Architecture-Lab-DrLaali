`include "increment_program_counter/increment_program_counter.v"
`include "multiplexer/2bit_multiplexer.v"
`include "immediate_generator/imm_gen.v"
`include "register_file/register_file.v"
`include "alu_control/alu_control.v"
`include "control/control.v"
`include "memory/me"
`include "alu/alu.v"

module riscv_cpu(clk, address);
    input wire clk;
    input wire [9:0] address;
    wire [63:0] instruction;

    // control
    wire aluOp0, aluOp1;
    wire branch, memRead, memToReg, memWrite, aluSrc, regWrite, zero;

    // register_file
    wire [4:0]  register_file_readReg1, register_file_readReg2, register_file_writeReg;
    wire [63:0] register_file_writeData;
    wire [63:0] register_file_readData1, register_file_readData2;

    // immediate_generator
    wire [63:0] imm_gen_out;

    // alu_control
    wire [3:0] aluControl_out;

    // ALU
    wire [63:0] alu_second_input;
    wire [63:0] alu_out;

    // data_memory
    wire [63:0] data_memory_out;


    memory           sample_instruction_memory (clk, x, address, x, 1, 0, instruction);
    control          sample_control (instruction[6:0], aluSrc, memToReg, regWrite, memRead, memWrite, branch, aluOp1, aluOp0);
    register_file    sample_register_file (regWrite,
       register_file_readReg1, register_file_readReg2,
       register_file_writeReg,
       register_file_writeData,
       readDatregister_file_readData1a1,
       register_file_readData2,
       clk);
    imm_gen          sample_immediate_generator (instruction, imm_gen_out);
    multiplexer_2to1 imm_gen_or_readdata2_mux (register_file_readData2, imm_gen_out, aluSrc, alu_second_input);
    alu_control      sample_alu_control ({aluOp1, aluOp0}, instruction[31:25], instruction[14:12], alu_control_out);
    alu              sample_alu (register_file_readData1, alu_second_input, aluControl_out, alu_out, zero);
    memory           sample_data_memory (clk, register_file_readData2, alu_out, alu_out, 1, 1, data_memory_out);
    multiplexer_2to1 alu_or_data_memory_mux (alu_out, data_memory_out, memToReg, register_file_writeData);

endmodule
