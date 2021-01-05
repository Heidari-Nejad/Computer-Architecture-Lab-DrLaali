module alu_control(aluOp, funct7, funct3, aluControl);
    input [1:0] aluOp;
    input [6:0] funct7;
    input [2:0] funct3;
    output reg [3:0] aluControl;

    always @( * ) begin
      if (aluOp == 2'b00) begin
        aluControl = 4'b0010;
      end else if (aluOp == 2'b10) begin
        if (funct7 == 7'b0100000) begin
          aluControl = 4'b0110;
        end else if (funct3 == 3'b000) begin
          aluControl = 4'b0010;
        end else if (funct3 == 3'b111) begin
          aluControl = 4'b0000;
        end else if (funct3 == 3'b110) begin
          aluControl = 4'b0001;
        end
      end else if (aluOp == 2'b01) begin
        aluControl = 4'b0110;
      end
    end
endmodule
