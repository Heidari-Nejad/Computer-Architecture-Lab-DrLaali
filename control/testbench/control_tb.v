`include "../control.v"

module test;
  reg [6:0] opc;
  wire ALUsrc;
  wire MemToReg;
  wire RegWrite;
  wire MemRead;
  wire MemWrite;
  wire Branch;
  wire AluOp1;
  wire AluOp0;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test
    #1 opc = 7'b0110011;
    #1 opc = 7'b0000011;
    #1 opc = 7'b0100011;
    #1 opc = 7'b1100011;
    $finish;
  end

  control control_test (opc, ALUsrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, AluOp1, AluOp0);

  always @ ( opc ) begin
    $monitor("opc: %b, ALUsrc: %b, MemToReg: %b, RegWrite: %b, MemRead: %b, MemWrite: %b, Branch: %b, AluOp1: %b, AluOp0: %b",
      opc, ALUsrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, AluOp1, AluOp0);
  end
endmodule // test
