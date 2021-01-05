`include "../shift_register.v"

module test;
    reg [4:0] in;
    reg clk;
    reg reset;
    wire [3:0] out;

    shift_register #(8) shRe (clk, reset, in, out);

    initial
    begin
    $monitor("in: %b, clock: %b, reset: %b, out: %b --- at time %t", in, clk, reset, out, $time);
    $dumpfile("shift_register.vcd");
    $dumpvars(0,test);

        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10110;
        #1
        in = 5'b10000;
        #1
        in = 5'b11010;
        #1
        in = 5'b00010;
        #1

        $finish;
    end

    integer i;
    initial begin
      clk = 0;
      forever begin
        #1
        clk = ~clk;
      end
    end

endmodule
