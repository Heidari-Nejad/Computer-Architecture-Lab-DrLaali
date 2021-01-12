module register_file(regWrite, readReg1, readReg2, writeReg, writeData, readData1, readData2, clk);
  input [4:0] readReg1, readReg2, writeReg;
  input [63:0] writeData;
  output reg [63:0] readData1, readData2;
  reg [63:0] registerFile [0:31];
  input clk, regWrite;

  always @(readReg1) begin
    if (readReg1 == 0) begin
      readData1 = 0;
    end else begin
      readData1 = registerFile[readReg1];
    end
  end

  always @(readReg2) begin
    if (readReg2 == 0) begin
      readData2 = 0;
    end else begin
      readData2 = registerFile[readReg2];
    end
  end

  always @(posedge clk) begin
    if (regWrite == 1) begin
      registerFile[writeReg] = writeData;
    end
  end

endmodule
