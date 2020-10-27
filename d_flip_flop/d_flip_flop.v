module d_flip_flop(D, clk, Q, Qbar);
    input wire D;
    input wire clk;
    output reg Q;
    output reg Qbar;

    always @(posedge clk) begin
        if(D == 1'b0)
            Q = 0;
        else
            Q = 1;
        Qbar = ~Q;
    end
endmodule
