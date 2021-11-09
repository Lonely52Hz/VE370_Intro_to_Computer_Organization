`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 20:17:54
// Design Name: 
// Module Name: ALU
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


module ALU(control, in1, in2, zero, result);
    input [3:0] control;
    input [31:0] in1, in2;
    output reg zero;
    output reg [31:0] result;

    initial begin
        result = 32'b0;
    end

    always @ (control or in1 or in2) begin
        case (control)
            4'b0000: result = in1 & in2;
            4'b0001: result = in1 | in2;
            4'b0010: result = in1 + in2;
            4'b0110: result = in1 - in2;
            4'b0111: result = (in1 < in2) ? 1 : 0;
            4'b1100: result = ~(in1 | in2);
        endcase
    end

    always @ (*) begin
        if (result == 0) begin
            zero = 1;
        end
        else begin
            zero = 0;
        end
    end

endmodule
