module memory(data_in, read_adr, write_adr, rd, wr, data_out);
  input [63:0] data_in;
  input [9:0] read_adr;
  input [9:0] write_adr;
  input rd, wr;
  output [63:0] data_out;

  // memory array
  reg [63:0] cells[0:1023];
  reg [63:0] temp_out;

  // read
  always @ ( * ) begin
    if(rd) begin
      if(wr && (read_adr == write_adr)) begin
        temp_out = 'bx;
      end
      else begin
        temp_out = cells[read_adr];
      end
    end
  end

  always @ ( * ) begin
    if(wr) begin
      cells[write_adr] = data_in;
    end
  end

  assign data_out = temp_out;
endmodule
