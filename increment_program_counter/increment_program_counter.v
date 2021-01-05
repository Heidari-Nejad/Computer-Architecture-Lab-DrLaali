`include "../shift-register/shift_register.v"
`include "../nbit-CLA-fulladder/nbit_CLA_full_adder.v"

module increment_program_counter (clk, reset, sh_reg_res, adder_res);
  // input [4:0] I;
  input clk;
  input reset;
  output [3:0] sh_reg_res;
  output [4:0] adder_res;

  wire [4:0] sh_in;
  // wire [3:0] sh_out;
  wire [3:0] adder_in;
  // wire [4:0] adder_out;

  shift_register #(5) shreg(clk, reset, sh_in, adder_in);
  nbit_CLA_full_adder #(4) adder(4'b1101, adder_in, sh_in);

  always @ ( posedge clk ) begin
    // sh_in = adder_out;
    // adder_in = sh_out;
    // $display("sh_in : %b",sh_in);
    // $display("adder_in : %b",adder_in);
    // $display("sh_out : %b",sh_out);
    // $display("adder_out : %b",adder_out);
  end

  assign sh_reg_res = adder_in;
  assign adder_res = sh_in;
endmodule // increment_program_counter
