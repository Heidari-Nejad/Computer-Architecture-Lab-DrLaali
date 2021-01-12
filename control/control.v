module control (Opc, ALUsrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, AluOp1, AluOp0);
  input [6:0] Opc;
  output reg ALUsrc;
  output reg MemToReg;
  output reg RegWrite;
  output reg MemRead;
  output reg MemWrite;
  output reg Branch;
  output reg AluOp1;
  output reg AluOp0;


  always @ ( Opc ) begin

  // fix this

    // R-format 0110011
    if (Opc == 7'b0110011) begin
      ALUsrc   = 0;
      MemToReg = 0;
      RegWrite = 1;
      MemRead  = 0;
      MemWrite = 0;
      Branch   = 0;
      AluOp1   = 1;
      AluOp0   = 0;
    end

    // ld 0000011
    else if (Opc[6] == 7'b0000011) begin
      ALUsrc   = 1;
      MemToReg = 1;
      RegWrite = 1;
      MemRead  = 1;
      MemWrite = 0;
      Branch   = 0;
      AluOp1   = 0;
      AluOp0   = 0;
    end

    // sd 0100011
    else if (Opc[6] == 7'b0100011) begin
      ALUsrc   = 1;
      MemToReg = x;
      RegWrite = 0;
      MemRead  = 0;
      MemWrite = 1;
      Branch   = 0;
      AluOp1   = 0;
      AluOp0   = 0;
    end

    // beq 1100011
    else if (Opc[6] == 7'b1100011) begin
      ALUsrc   = 0;
      MemToReg = x;
      RegWrite = 0;
      MemRead  = 0;
      MemWrite = 0;
      Branch   = 1;
      AluOp1   = 0;
      AluOp0   = 1;
    end
  end
endmodule // control
