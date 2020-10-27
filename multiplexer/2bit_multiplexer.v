module multiplexer (i0, i1, s, out);

    input wire i0;
    input wire i1;
    input wire s;
    output reg out;

    always @(s) begin
      if (s == 1'b0)
        out = i0;
      else
        out = i1;
    end

endmodule
