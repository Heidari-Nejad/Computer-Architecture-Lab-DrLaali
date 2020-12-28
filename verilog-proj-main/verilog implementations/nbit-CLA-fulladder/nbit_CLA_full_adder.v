module nbit_CLA_full_adder (num_one, num_two, S);
  parameter integer BIT_NUMBER = 8;

  input [BIT_NUMBER-1 : 0] num_one;
  input [BIT_NUMBER-1 : 0] num_two;
  output [BIT_NUMBER : 0] S;

  reg [BIT_NUMBER : 0] Cins;
  reg [BIT_NUMBER-1 : 0] generates, propagates;
  reg [BIT_NUMBER-1 : 0] sum;

  integer i,j;
  reg cout;

  always @( * ) begin
  // $display("%b",num_one);
  // $display("%b",num_two);
  // $display("%b",S);

    Cins =0;
    generates =0;
    propagates =0;
    sum =0;

    for ( i=0 ; i<BIT_NUMBER ; i=i+1) begin
      generates[i] = num_one[i] & num_two[i];
      propagates[i] = num_one[i] ^ num_two[i];
      Cins[i+1] = generates[i] | propagates[i] & Cins[i];
    end

    for ( j=0 ; j<BIT_NUMBER ; j=j+1) begin
      sum[j] = num_one[j] ^ num_two[j] ^ Cins[j];
      cout = (num_one[j] & num_two[j]) | (num_one[j] ^ num_two[j]) & Cins[j];
    end
    // $display("MONITOR --> time %t, f: %b, sec: %b, res: %b", $time, num_one, num_two, {Cins[BIT_NUMBER], sum});
    // $display("S = %b", S);
  end

  assign S = {Cins[BIT_NUMBER], sum};
endmodule // nbit_full_addeX,Y,cin,s,coutr
