`timescale 1ns / 1ps

module PC(clk, in, out);
    input clk;   
    input [31:0] in;
    output reg [31:0] out;

    initial begin
        out = 32'b0;
    end

    always @ (posedge clk) begin 
        out = in;
    end    

endmodule
