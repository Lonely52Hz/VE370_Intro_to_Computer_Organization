`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 21:13:43
// Design Name: 
// Module Name: MEMWB
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


module MEMWB(clk, 
             MEM_RegWrite, MEM_MemToReg, MEM_ReadData, MEM_ALUResult, MEM_RegisterRd,
             WB_RegWrite, WB_MemToReg, WB_MemReadData, WB_ALUResult, WB_RegisterRd);

    input clk, MEM_RegWrite, MEM_MemToReg;
    input [31:0] MEM_ReadData, MEM_ALUResult;
    input [4:0] MEM_RegisterRd;
    output reg WB_RegWrite, WB_MemToReg;
    output reg [31:0] WB_MemReadData, WB_ALUResult;
    output reg [4:0] WB_RegisterRd;

    initial begin
        WB_RegWrite = 1'b0;
        WB_MemToReg = 1'b0;
        WB_MemReadData = 32'b0;
        WB_ALUResult = 32'b0;
        WB_RegisterRd = 5'b0;
    end

    always @ (posedge clk) begin
        WB_RegWrite = MEM_RegWrite;
        WB_MemToReg = MEM_MemToReg;
        WB_MemReadData = MEM_ReadData;
        WB_ALUResult = MEM_ALUResult;
        WB_RegisterRd = MEM_RegisterRd;
    end
    
endmodule
