module d_flip_flop(D, clk, reset, Q, Qbar);
    input wire D, clk, reset;
    output reg Q, Qbar;

    always @(posedge clk) begin
      Q = D & ~reset;
      Qbar = ~Q;
    end
endmodule
