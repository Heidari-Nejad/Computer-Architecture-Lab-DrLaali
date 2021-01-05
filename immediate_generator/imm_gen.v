module imm_gen(inst, out);
    input wire [31:0] inst;
    output [63:0] out;

    reg [63:0] temp;

    always @( inst ) begin
      if (inst[6:0] == 7'b0100011) begin
        temp = {{53{inst[31]}}, inst[30:25], inst[11:7]};
      end else if (inst[6:0] == 7'b1100011) begin
        temp = {{53{inst[31]}}, inst[7], inst[30:25], inst[11:8]};
      end else if (inst[6:0] == 7'b0000011) begin
        temp = {{53{inst[31]}}, inst[30:20]};
      end else begin
        temp = 64'bx;
      end
    end
    assign out = temp;
endmodule
