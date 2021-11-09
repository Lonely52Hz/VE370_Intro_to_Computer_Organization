`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 21:48:57
// Design Name: 
// Module Name: IFID
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


module IFID(clk, write, flush, 
            IF_PC4, IF_Instruction,
            ID_PC4, ID_Instruction);

    input clk, write, flush;
    input [31:0] IF_PC4, IF_Instruction;
    output reg [31:0] ID_PC4, ID_Instruction;

    initial begin
        ID_PC4 = 32'b0;
        ID_Instruction = 32'b0;
    end

    always @ (posedge clk) begin
        if (flush) begin
            ID_PC4 = 32'b0;
            ID_Instruction = 32'b0;
        end 
        else begin
            if (write) begin
                ID_PC4 = IF_PC4;
                ID_Instruction = IF_Instruction;
            end
            else begin
                ID_PC4 = ID_PC4;
                ID_Instruction = ID_Instruction;
            end
        end
    end

endmodule
