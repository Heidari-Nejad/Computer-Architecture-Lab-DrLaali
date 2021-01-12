module clk (enable, clk_out);
  input enable;
  output reg clk_out;
  parameter PULS_PERIOD = 1;

  always @ ( enable ) begin
    if (enable) begin
      clk_out = 1;
    end else begin
      clk_out = 0;
    end

    while ( 1 ) begin
      #(PULS_PERIOD) clk_out = ~clk_out;
    end
  end
endmodule // clk
