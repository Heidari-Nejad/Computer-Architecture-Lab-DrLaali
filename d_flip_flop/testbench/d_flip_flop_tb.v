`include "../d_flip_flop.v"

module test;
    reg D;
    reg clk;
    reg reset;
    wire Q;
    wire Qbar;

    d_flip_flop dff (D, clk, reset, Q, Qbar);

    initial
    begin
    $monitor("D: %b, clock: %b, reset: %b, Q: %b, Qbar: %b --- at time %t", D, clk, reset, Q, Qbar, $time);
    $dumpfile("d_flip_flop.vcd");
    $dumpvars(0,test);
        D = 0;
        #10

        D = 1;
        reset = 1;
        #10

        D = 0;
        reset = 0;
        #10

        D = 1;
        reset =0;
        #10

        D = 0;
        reset = 1;
        #10

        D = 1;
        reset = 1;
        #10

        D = 1;
        reset = 0;
        #10

        D = 1;
        reset = 1;
        #10
        $finish;
    end

    initial begin
      clk = 0;
      forever begin
        #5
        clk = ~clk;
      end
    end

endmodule
