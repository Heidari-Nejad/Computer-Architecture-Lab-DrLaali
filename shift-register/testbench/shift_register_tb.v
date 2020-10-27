`include "../shift_register.v"

module test;
    reg in;
    reg clk;
    wire out;

    shift_register shRe (in, clk, out);

    initial
    begin
    $monitor("int: %b, clock: %b, out: %b --- at time %t", in, clk, out, $time);
    $dumpfile("shift_register.vcd");
    $dumpvars(0,test);
        in = 0;
        #4

        in = 1;
        #4

        in = 0;
        #4

        in = 0;
        #4

        in = 1;
        #4

        D = 1;
        #4

        $finish;
    end

    integer i;
    initial begin
      clk = 0;
      for(i=0;i<20;i=i+1) begin
        #2
        clk = ~clk;
      end
    end

endmodule
