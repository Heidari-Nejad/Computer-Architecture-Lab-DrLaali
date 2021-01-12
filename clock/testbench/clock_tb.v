`include "../clock.v"

module test;
  reg enable;
  wire clk_out;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
    enable = 0;
    #200
    $finish;
  end

  clk clock (enable, clk_out);

  always @ ( * ) begin
    $monitor("time %t, enable: %b, clk_out: %b", $time, enable, clk_out);
  end

endmodule // test
