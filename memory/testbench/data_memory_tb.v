`include "../data_memory.v"

module test;
  reg [63:0] data_in;
  reg [9:0] read_adr;
  reg [9:0] write_adr;
  reg rd, wr;
  wire [63:0] data_out;

  memory mem(data_in, read_adr, write_adr, rd, wr, data_out);

  initial
  begin
    $monitor("data_in: %b, read_adr: %b, write_adr: %b, rd: %b, wr: %b, data_out: %b, time: %t", data_in, read_adr, write_adr, rd, wr, data_out, $time);
    $dumpfile("multiplexer.vcd");
    $dumpvars(0,test);

        data_in = 64'b0000010100000010000000000000000010000000111000000000000000000000;
        wr = 1'b1;
        rd = 1'b0;
        write_adr = 10'b0110000100;
        read_adr = 10'b0110000100;
        #10

        data_in = 64'b0000010100000010000011101000000010000000111000000000000000000000;
        wr = 1'b1;
        rd = 1'b0;
        write_adr = 10'b0110100100;
        read_adr = 10'b0110000100;
        #10

        data_in = 64'b0000000000000001110000000000000101101100000000000000000000000000;
        wr = 1'b0;
        rd = 1'b1;
        write_adr = 10'b0110000100;
        read_adr = 10'b0110100100;
        #10

        data_in = 64'b0000000110101101100000000011000000000011011100000000000000000000;
        wr = 1'b0;
        rd = 1'b1;
        write_adr = 10'b0110000100;
        read_adr = 10'b0110000100;
        #10

        data_in = 64'b0000000110101101100000000011000000000011011100000000000000000000;
        wr = 1'b0;
        rd = 1'b1;
        write_adr = 10'b0111000100;
        read_adr = 10'b0110110100;
        #10

        $finish;
  end
endmodule
