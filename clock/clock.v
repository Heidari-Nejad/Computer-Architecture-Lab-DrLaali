module clk (enable, start_value, puls_period, clk_out);
  input wire enable;
  input wire start_value;
  input wire puls_period;
  output reg clk_out;

  always @ ( enable ) begin
    if (enable) begin
      clk_out = start_value;
    end else begin
      clk_out = 0;
    end

    while ( 1 ) begin
      if (enable) begin
        #(puls_period) clk_out = ~clk_out;
      end else begin
        #(puls_period) clk_out = 0;
      end
    end
  end
endmodule // clk
