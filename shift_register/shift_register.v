module shift_register (clk, reset, in, out);
	input wire clk, reset;
	input wire [4:0] in;
	output [3:0] out;

  parameter SIZE = 64;
	integer i;

  reg [SIZE-1:0] ser;

	initial begin
		ser = 0;
	end

	always@(posedge clk)
	begin

		if(reset == 1'b1) begin
			ser = 0;
		end
		else begin
	    for(i=0 ; i<5 ; i=i+1) begin
				ser[SIZE-1:1] = ser[SIZE-2:0];
				ser[0] = in[4-i];
	    end
		end
		// $display("%b",ser);
	end

	assign out = ser[SIZE-1:SIZE-4];
endmodule
