`include "../clock.v"

module test;
  reg enable;
  reg start_value;
  reg puls_period;
  wire clk_out;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
    start_value = 0;
    enable = 0;
    puls_period = 4'b0110;
    #200 $finish;
  end

  clk clock (enable, start_value, puls_period, clk_out);

  always @ ( * ) begin
    $monitor("time %t, enable: %b, clk_out: %b, start_value: %b", $time, enable, clk_out, start_value);
  end

endmodule // test
