`include "increment_program_counter/increment_program_counter.v"
`include "instruction_memory/instruction_memory.v"
`include "multiplexer/2bit_multiplexer.v"
`include "immediate_generator/imm_gen.v"
`include "register_file/register_file.v"
`include "data_memory/data_memory.v"
`include "alu_control/alu_control.v"
`include "control/control.v"
`include "alu/alu.v"

module riscv_cpu(clk, address);
    input clk;
    input [6:0] address;
    wire [1:0] aluOp;
    wire [3:0] aluControl;
    wire [31:0] instruction;
    wire [63:0] regFileWriteData, regFileReadData, regFileReadData1, regFileReadData2, immGenOut, aluInput2, aluResult;
    wire memWrite, memRead, branch, memToReg, aluSrc , regWrite, zero, increment_program_counter_eset;

    register_file register_file_instance (regWrite, instruction[19:15], instruction[24:20], instruction[11:7], regFileWriteData, regFileReadData1, regFileReadData2, clk);
    multiplexer_2to1 #(64) afterRegFileMux (regFileReadData2, immGenOut, aluSrc, aluInput2);
    memory dataMem (clk, regFileReadData2, {1'b0, aluResult[5:0]}, {1'b0, aluResult[5:0]}, memRead, memWrite, regFileReadData);
    multiplexer_2to1 #(64) afterDataMemoryMux (regFileReadData, aluResult, memToReg, regFileWriteData);
    instruction_memory instructionMem (address, instruction);
    control control_instance (instruction[6:0], aluSrc, memToReg, regWrite, memRead, memWrite, branch, aluOp[1], aluOp[0]);
    alu_control alu_control_instance (aluOp, instruction[31:25], instruction[14:12], aluControl);
    imm_gen imm_gen_instance (instruction, immGenOut);
    alu alu_instance (regFileReadData1, aluInput2, aluControl, aluResult, zero);
    increment_program_counter ipc (clk, increment_program_counter_eset, address, adder_out);

endmodule
