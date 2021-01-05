module multiplexer_2to1 (i0, i1, s, out);
    parameter SIZE = 1;
    input [SIZE-1:0] i0;
    input [SIZE-1:0] i1;
    input wire s;
    output reg out;


    always @(s) begin
      if (s == 1'b0)
        out = i0;
      else
        out = i1;
    end

endmodule
