module test;

reg first = 1'b0;
reg second = 1'b0;
reg carry = 1'b0;

wire add_result;
wire cout;

  initial begin
    $dumpfile("oneBitTest.vcd");
    $dumpvars(0,test);

    # 10;
    first = 1'b1;
    second = 1'b0;
    carry = 1'b1;

    # 30;
    first = 1'b0;
    second = 1'b1;
    carry = 1'b0;

    # 40;
    first = 1'b0;
    second = 1'b0;
    carry = 1'b1;

    # 50;
    first = 1'b1;
    second = 1'b1;
    carry = 1'b1;

    # 100 $finish;
  end

  one_bit_full_adder adder (first, second, carry, add_result, cout);

  initial
     $monitor("At time %t, s = %b, cout = %b",
              $time, add_result, cout);
endmodule // test
