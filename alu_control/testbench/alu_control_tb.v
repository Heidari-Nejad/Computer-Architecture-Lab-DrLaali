`include "../alu_control.v"

module test;
  reg [1:0] aluOp;
  reg [6:0] funct7;
  reg [2:0] funct3;
  wire [3:0] aluControl;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);

    // test ld double word
    #10
    aluOp  = 2'b00;
    funct7 = 7'bxxxxxxx;
    funct3 = 7'bxxx;

    // test sd double word
    #10
    aluOp  = 2'b00;
    funct7 = 7'bxxxxxxx;
    funct3 = 7'bxxx;

    // test beq double word
    #10
    aluOp  = 2'b01;
    funct7 = 7'bxxxxxxx;
    funct3 = 7'bxxx;

    // test add double word
    #10
    aluOp  = 2'b10;
    funct7 = 7'b0000000;
    funct3 = 3'b000;

    // test sub double word
    #10
    aluOp  = 2'b10;
    funct7 = 7'b0100000;
    funct3 = 3'b000;

    // test and double word
    #10
    aluOp  = 2'b10;
    funct7 = 7'b0000000;
    funct3 = 3'b111;

    // test or double word
    #10
    aluOp  = 2'b10;
    funct7 = 7'b0000000;
    funct3 = 3'b110;

    $finish;
  end

  alu_control alu_control_test (aluOp, funct7, funct3, aluControl);

  always @ ( * ) begin
    $monitor("aluOp: %b, funct7: %b, funct3: %b, aluControl: %b",
      aluOp, funct7, funct3, aluControl);
  end
endmodule // test
