module multiplexer_4to1 (i0, i1, i2, i3, s0, s1, out);

    input wire i0;
    input wire i1;
    input wire i2;
    input wire i3;

    input wire s0;
    input wire s1;

    output reg out;

    always @(s) begin
      if ({s0, s1} == 2'b00 )
        out = i0;
      else if ({s0, s1} == 2'b01 )
        out = i1;
      else if ({s0, s1} == 2'b10 )
        out = i2;
      else if ({s0, s1} == 2'b11 )
        out = i3
    end
    
endmodule
