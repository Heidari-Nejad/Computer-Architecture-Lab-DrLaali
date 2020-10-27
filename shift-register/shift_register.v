module shift_register (in, out, clk);
  input wire in;
  input wire clk;
  output reg out;

  reg f2_in;
  reg f3_in;
  reg f4_in;

  wire f1_out =0;
  wire f2_out =0;
  wire f3_out =0;
  wire f4_out =0;

  wire f1_out_bar = ~f1_out;
  wire f2_out_bar = ~f2_out;
  wire f3_out_bar = ~f3_out;
  wire f4_out_bar = ~f4_out;


  d_flip_flop f1 (in, clk, f1_out, f1_out_bar);
  d_flip_flop f2 (f2_in, clk, f2_out, f2_out_bar);
  d_flip_flop f3 (f3_in, clk, f3_out, f3_out_bar);
  d_flip_flop f4 (f4_in, clk, f4_out, f4_out_bar);

  always @(posedge clk) begin
    f2_in = f1_out;
    f3_in = f2_out;
    f4_in = f3_out;
    out = f4_out;
  end
endmodule // shift_registerin,


// flip flop type D
module d_flip_flop(D, clk, Q, Qbar);
    input wire D;
    input wire clk;
    output reg Q;
    output reg Qbar;

    always @(posedge clk) begin
        if(D == 1'b0)
            Q = 0;
        else
            Q = 1;
        Qbar = ~Q;
    end
endmodule
