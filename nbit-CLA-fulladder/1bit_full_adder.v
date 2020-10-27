module one_bit_full_adder (x,y,Cin,s,Cout);
  input x;
  input y;
  input Cin;
  output s;
  output Cout;

  assign s = x ^ y ^ Cin;
  assign Cout = (x & y) | (x ^ y) & Cin;
endmodule // 1bit_full_adder
