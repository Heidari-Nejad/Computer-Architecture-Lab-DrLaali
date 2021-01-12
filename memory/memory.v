module memory(clk, data_in, read_adr, write_adr, rd, wr, data_out);
  input [63:0] data_in;
  input [9:0] read_adr;
  input [9:0] write_adr;
  input rd, wr;
  output [63:0] data_out;

  // memory array
  reg [63:0] memory_cells[0:1023];
  reg [63:0] temp_out;

  // read
  always @ ( posedge clk ) begin
    if(rd) begin
      if(wr && (read_adr == write_adr)) begin
        // temp_out = 'bx;
        temp_out = data_in;
      end
      else begin
        temp_out = memory_cells[read_adr];
      end
    end
  end

  always @ ( posedge clk ) begin
    if(wr) begin
      memory_cells[write_adr] = data_in;
    end
  end

  assign data_out = temp_out;
endmodule
