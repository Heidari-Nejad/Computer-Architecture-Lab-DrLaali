`include "../alu.v"

module test;
  reg [63:0] input0, input1;
  reg [3:0] aluControl;
  wire [63:0] res;
  wire zero;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);

    // test add
    #10
    input0     = 64'b0011011101100010001101011110000000110101100000110011010101111000;
    input1     = 64'b0011010111101000001101011110000000110101111010100011010111100000;
    aluControl = 4'b0010;

    // test subtract
    #10
    input0     = 64'b1011011101100010001101101101000000110101100000110011010101111000;
    input1     = 64'b0011010111101000001101011110000000110111111010100011010111100000;
    aluControl = 4'b0110;

    // test and
    #10
    input0     = 64'b0011011101100010001101011001111000110101100000110011010101111000;
    input1     = 64'b0011010111101000001101011110000000110101111010100011010111100000;
    aluControl = 4'b0000;

    // test or
    #10
    input0     = 64'b0011011101100010001101011110000000110101100000110011010101111000;
    input1     = 64'b0011010111101000001101011110111000110101111010100011010111100000;
    aluControl = 4'b0001;

    // test zero
    #10
    input0     = 64'b0011010111101000001101011110000000110101111010100011010111100000;
    input1     = 64'b0011010111101000001101011110000000110101111010100011010111100000;
    aluControl = 4'b0110;

    $finish;
  end

  alu alu_test (input0, input1, aluControl, res, zero);

  always @ ( * ) begin
    $monitor("input0: %b, input1: %b, aluControl: %b, res: %b, zero: %b",
      input0, input1, aluControl, res, zero);
  end
endmodule // test
