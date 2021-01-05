`include "../imm_gen.v"

module test;
  reg [31:0] inst;
  wire [63:0] out;

  imm_gen im_g (inst, out);

  initial
  begin
    $monitor("inst: %b, out: %b, time %t", inst, out, $time);
    $dumpfile("shift_register.vcd");
    $dumpvars(0,test);

      #1
      inst = 32'b11000111101000001011000001100011;
      #1
      inst = 32'b00110101101000001011000011100011;
      #1
      inst = 32'b00110101101000001011011000000011;
      #1
      inst = 32'b10110101101000001011011110000011;

    $finish;
  end

endmodule
