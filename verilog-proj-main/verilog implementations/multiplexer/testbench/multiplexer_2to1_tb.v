`include "../2bit_multiplexer.v"

module test_mul_2to1;
    reg i0;
    reg i1;
    reg s;
    wire out;

    multiplexer mul (i0, i1, s, out);

    initial
    begin
    $monitor("i0: %b, i1: %b, s: %b, out: %b --- at time %t", i0, i1, s, out, $time);
    $dumpfile("multiplexer.vcd");
    $dumpvars(0,test);

        i0 = 1;
        i1 = 0;

        s = 0;
        #10

        s = 1;
        #10

        s = 0;
        #10

        $finish;
    end
endmodule
