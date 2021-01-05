
// instruction memory in datapath is only allowed to have read functionality
// but in this verilog code i provide write functionality just for test
// purposes.

module instruction_memory(address, instruction_out, instruction_in, rd);
  input rd;
  input [6:0] address;
  input [31:0] instruction_in;
  output reg [31:0] instruction_out;
  reg [31:0] mem[127:0];

  always @ ( * ) begin
    if (rd) begin
      instruction_out = mem[address];
    end else begin
      mem[address] = instruction_in;
    end
  end

endmodule
