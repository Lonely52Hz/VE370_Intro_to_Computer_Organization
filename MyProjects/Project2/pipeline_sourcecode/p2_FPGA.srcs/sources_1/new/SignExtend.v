`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 23:34:57
// Design Name: 
// Module Name: SignExtend
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


module SignExtend(in, out);
    input [15:0] in;
    output [31:0] out;

    assign out[15:0] = in[15:0];
    assign out[31:16] = (in[15]) ? 16'b1111111111111111 : 16'b0;

endmodule
