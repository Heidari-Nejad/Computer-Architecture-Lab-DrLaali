module d_flip_flop(D, clk, reset, Q, Qbar);
    input wire D;
    input wire clk;
    input wire reset;
    output reg Q;
    output reg Qbar;

    always @(posedge clk) begin
        if(reset == 1'b1)
            Q = 0;
        else
            Q = D;
        Qbar = ~Q;
    end
endmodule
