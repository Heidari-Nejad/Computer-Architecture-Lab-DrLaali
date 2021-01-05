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

    // R-format
    if (Opc[6] == 0 && Opc[5] == 1 && Opc[4] == 1 && Opc[3] == 0 &&
      Opc[2] == 0 && Opc[1] == 1 && Opc[0] == 1) begin
      ALUsrc   = 0;
      MemToReg = 0;
      RegWrite = 1;
      MemRead  = 0;
      MemWrite = 0;
      Branch   = 0;
      AluOp1   = 1;
      AluOp0   = 0;
    end

    // ld
    else if (Opc[6] == 0 && Opc[5] == 0 && Opc[4] == 0 && Opc[3] == 0 &&
      Opc[2] == 0 && Opc[1] == 1 && Opc[0] == 1) begin
      ALUsrc   = 1;
      MemToReg = 1;
      RegWrite = 1;
      MemRead  = 1;
      MemWrite = 0;
      Branch   = 0;
      AluOp1   = 0;
      AluOp0   = 0;
    end

    // sd
    else if (Opc[6] == 0 && Opc[5] == 1 && Opc[4] == 0 && Opc[3] == 0 &&
      Opc[2] == 0 && Opc[1] == 1 && Opc[0] == 1) begin
      ALUsrc   = 1;
      MemToReg = x;
      RegWrite = 0;
      MemRead  = 0;
      MemWrite = 1;
      Branch   = 0;
      AluOp1   = 0;
      AluOp0   = 0;
    end

    // beq
    else if (Opc[6] == 1 && Opc[5] == 1 && Opc[4] == 0 && Opc[3] == 0 &&
      Opc[2] == 0 && Opc[1] == 1 && Opc[0] == 1) begin
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
