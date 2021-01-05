`include "../register_file.v"

module test;
  reg [4:0] readReg1, readReg2, writeReg;
  reg [63:0] writeData;
  wire [63:0] readData1, readData2;
  reg clk, regWrite;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);

    // initializing some data into register file for test purpose
    #1
    regWrite = 1;
    writeReg = 5'b01101;
    writeData = 64'b0011011101100010001101011110000000011011101100010001101011110010;

    #1
    regWrite = 1;
    writeReg = 5'b01110;
    writeData = 64'b0001101110110001000110101011000101001101110110001010110100011000;


    // test fetching register data from registerFile
    #5
    regWrite = 0;
    readReg1 = 5'b01101;
    readReg2 = 5'b01110;

    $finish;
  end

  initial begin
    clk = 0;
    forever begin
      #1
      clk = ~clk;
    end
  end

  register_file register_file_test (regWrite, readReg1, readReg2, writeReg, writeData, readData1, readData2, clk);

  always @ ( * ) begin
    $monitor("regWrite: %b, readReg1: %b, readReg2: %b, readData1: %b, readData2: %b, writeReg: %b, writeData: %b, clk: %b",
      regWrite, readReg1, readReg2, readData1, readData2, writeReg, writeData, clk);
  end
endmodule // test
