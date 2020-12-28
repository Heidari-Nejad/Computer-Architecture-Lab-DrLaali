`include "../nbit_CLA_full_adder.v"

module test;

// reg [7 : 0] first8 = 8'b00000000;
// reg [7 : 0] second8 = 8'b00000000;
reg [63 : 0] first64 =  64'b0000000000000000000000000000000000000000000000000000000000000000;
reg [63 : 0] second64 = 64'b0000000000000000000000000000000000000000000000000000000000000000;

// wire [8 : 0] add_result8;
wire [64 : 0] add_result64;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);

    // # 50;
    // first8 =  8'b00000000;
    // second8 = 8'b00000001;
    //
    // # 50;
    // first8 =  8'b00000010;
    // second8 = 8'b00000001;
    //
    // # 50;
    // first8 =  8'b00001010;
    // second8 = 8'b01110001;

    first64 =  64'b0000000000000000000011111000000000010000000000000000011100000000;
    second64 = 64'b0000000001000000000000101100000011000010000000001111110000000000;

    #1

    first64 =  64'b0000011010100000000000001111100000000000000000000000000000000000;
    second64 = 64'b0000000001000000000000101100000011000010000000001111110000000000;

    #1

    first64 =  64'b0000000001000000000000101100000011000010000000001111110000000000;
    second64 = 64'b0000000000000000000000010110101110100000001101100110000000000000;

    # 50 $finish;
  end

  // nbit_CLA_full_adder adder8 (first8, second8, add_result8, num8);
  nbit_CLA_full_adder #(64) adder64 (first64, second64, add_result64);

  // initial begin
  //    $monitor("8bit ---> At time %t, result = %b", $time, add_result8);
  // end

  initial begin
    $monitor("64bit ---> At time %t, result = %b", $time, add_result64);
  end

endmodule // test
