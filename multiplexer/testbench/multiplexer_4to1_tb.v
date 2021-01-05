`include "../4bit_multiplexer.v"

module test_mul_4to1;
    reg i0;
    reg i1;
    reg i2;
    reg i3;

    reg s0;
    reg s1;

    wire out;

    multiplexer mul (i0, i1, i2, i3, s0, s1, out);

    initial
    begin
    $monitor("i0: %b, i1: %b, i2: %b, i3: %b, s0: %b, s1: %b, out: %b --- at time %t", i0, i1, i2, i3, s0, s1, out, $time);
    $dumpfile("multiplexer.vcd");
    $dumpvars(0,test);

        i0 = 1;
        i1 = 0;
        i2 = 0;
        i3 = 1;

        s0 = 0;
        s1 = 0;
        #10

        s0 = 1;
        s1 = 0;
        #10

        s0 = 0;
        s1 = 1;
        #10

        s0 = 1;
        s1 = 1;
        #10

        s0 = 0;
        s1 = 0;
        #10

        $finish;
    end
endmodule
