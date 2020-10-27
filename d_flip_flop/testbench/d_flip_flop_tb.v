`include "../d_flip_flop.v"

module test;
    reg D;
    reg clk;
    wire Q;
    wire Qbar;

    d_flip_flop dff (D, clk, Q, Qbar);

    initial
    begin
    $monitor("D: %b, clock: %b, Q: %b, Qbar: %b --- at time %t", D, clk, Q, Qbar, $time);
    $dumpfile("d_flip_flop.vcd");
    $dumpvars(0,test);
        D = 0;
        #10

        D = 1;
        #10

        D = 0;
        #10

        D = 1;
        #10

        D = 0;
        #10

        D = 1;
        #10
        $finish;
    end

    integer i;
    initial begin
      clk = 0;
      for(i=0;i<20;i=i+1) begin
        #5
        clk = ~clk;
      end
    end

endmodule
