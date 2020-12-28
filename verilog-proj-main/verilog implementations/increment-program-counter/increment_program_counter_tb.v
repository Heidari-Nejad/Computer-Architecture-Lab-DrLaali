`include "increment_program_counter.v"

module test;
  // reg [0:4] I;
  reg clk;
  reg reset;
  wire [3:0] sh_reg_out;
  wire [4:0] adder_out;


  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
      reset =0;
      #20;

      // I =5'b00100;
      // reset =0;
      // #50
    $finish;
  end

  increment_program_counter ipc (clk, reset, sh_reg_out, adder_out);

  initial begin
    $monitor("time %t, shift_register_output: %b, adder_output: %b, clk: %b, reset: %b", $time, sh_reg_out, adder_out, clk, reset);
  end

  integer i;
  initial begin
    clk = 0;
    forever begin
      #1
      clk = ~clk;
    end
  end

endmodule // test
