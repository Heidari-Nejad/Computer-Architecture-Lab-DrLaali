module alu(input0, input1, aluControl,  res, zero);
    input  [63:0] input0, input1;
    input  [3:0] aluControl;
    output reg [63:0] res;
    output reg zero;

    always @(aluControl or input0 or input1) begin

      if (aluControl == 4'b0010) begin
        res = input0 + input1;
      end else if (aluControl == 4'b0110) begin
        res = input0 - input1;
      end else if (aluControl == 4'b0000) begin
        res = input0 & input1;
      end else if (aluControl == 4'b0001) begin
        res = input0 | input1;
      end

      if (res == 0) begin
        assign zero = 1;
      end else begin
        assign zero = 0;
      end

    end
endmodule
