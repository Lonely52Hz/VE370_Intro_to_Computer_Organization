`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/02 00:26:31
// Design Name: 
// Module Name: MUX3
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


module MUX3(in1, in2, in3, out, sel);
    input [31:0] in1, in2, in3;
    output reg [31:0] out;
    input [1:0] sel;

    always @ (in1 or in2 or in3 or sel) begin
        case (sel)
            2'b00: out = in1;
            2'b01: out = in2;
            2'b10: out = in3;
        endcase
    end
    
endmodule
