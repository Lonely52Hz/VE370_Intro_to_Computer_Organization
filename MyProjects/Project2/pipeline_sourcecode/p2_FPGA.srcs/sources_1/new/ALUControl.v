`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 20:06:06
// Design Name: 
// Module Name: ALUControl
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


module ALUControl( ALUop, funcode, control);
    input [1:0] ALUop;
    input [5:0] funcode;
    output reg [3:0] control;

    always @ (ALUop or funcode) begin
        case (ALUop)
            2'b00: control = 4'b0010;
            2'b01: control = 4'b0110;
            2'b10: begin
                case (funcode) 
                    6'b100000: control = 4'b0010;
                    6'b100010: control = 4'b0110;
                    6'b100100: control = 4'b0000;
                    6'b100101: control = 4'b0001;
                    6'b101010: control = 4'b0111;
                endcase
            end
            2'b11: control = 4'b0000;
        endcase
    end
    
endmodule
