`include "./1bit_full_adder.v"

module nbit_CLA_full_adder (num_one, num_two, S);

  // you can customize the bit number from here
  parameter integer BIT_NUMBER = 64;

  input [BIT_NUMBER-1 : 0] num_one;
  input [BIT_NUMBER-1 : 0] num_two;

  output [BIT_NUMBER : 0] S;

  wire [BIT_NUMBER : 0] Cins;
  wire [BIT_NUMBER-1 : 0] generates, propagates;
  wire [BIT_NUMBER-1 : 0] sum;

  assign Cins[0] = 1'b0;
  generate
    for (genvar i=0 ; i<BIT_NUMBER ; i=i+1)
      begin
        assign generates[i] = num_one[i] & num_two[i];
        assign propagates[i] = num_one[i] ^ num_two[i];
        assign Cins[i+1] = generates[i] | propagates[i] & Cins[i];
      end
  endgenerate


  generate
    for (genvar j=0 ; j<BIT_NUMBER ; j=j+1)
      begin
        wire cout;
        one_bit_full_adder adder (num_one[j], num_two[j], Cins[j], sum[j], cout);
      end
  endgenerate


  assign S = {Cins[BIT_NUMBER], sum};
endmodule // nbit_full_addeX,Y,cin,s,coutr
