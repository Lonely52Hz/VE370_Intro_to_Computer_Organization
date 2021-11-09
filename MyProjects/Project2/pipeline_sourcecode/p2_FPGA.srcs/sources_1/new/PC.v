`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 21:28:53
// Design Name: 
// Module Name: PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC(clk, write, in, out);
    input clk, write;   
    input [31:0] in;
    output reg [31:0] out;

    initial begin
        out = 32'b0;
    end

    always @ (posedge clk) begin
        if (write) begin
            out = in;
        end
    end

endmodule
