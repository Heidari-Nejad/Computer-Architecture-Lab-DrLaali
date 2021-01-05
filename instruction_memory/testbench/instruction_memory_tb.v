`include "../instruction_memory.v"

module test;
  reg rd;
  reg [4:0] address;
  reg [31:0] instruction_in;
  wire [31:0] instruction_out;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);

    // initializing some data into memory for test purpose
    #10
    rd = 0;
    address = 7'b0110011;
    instruction_in = 64'b00110111011000100011010111100000;

    // test fetching data from instruction_memory
    #10
    rd = 1;
    address = 7'b0110011;

    $finish;
  end

  instruction_memory instruction_memory_test (address, instruction_out, instruction_in, rd);

  always @ ( * ) begin
    $monitor("address: %b, instruction_out: %b, instruction_in: %b, rd: %b",
      address, instruction_out, instruction_in, rd);
  end
endmodule // test
