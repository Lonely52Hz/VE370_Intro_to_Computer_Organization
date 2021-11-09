`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 20:25:20
// Design Name: 
// Module Name: EXMEM
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


module EXMEM(clk,
             EX_RegWrite, EX_MemToReg, EX_MemRead, EX_MemWrite, EX_ALUResult, EX_RegReadData2, EX_FinalReg,
             MEM_RegWrite, MEM_MemToReg, MEM_MemRead, MEM_MemWrite, MEM_ALUResult, MEM_RegReadData2, MEM_FinalReg);

    input clk, EX_RegWrite, EX_MemToReg, EX_MemRead, EX_MemWrite;
    input [4:0] EX_FinalReg;
    input [31:0] EX_ALUResult, EX_RegReadData2;
    output reg MEM_RegWrite, MEM_MemToReg, MEM_MemRead, MEM_MemWrite;
    output reg [4:0] MEM_FinalReg;
    output reg [31:0] MEM_ALUResult, MEM_RegReadData2;

    initial begin
        MEM_RegWrite = 1'b0;
        MEM_MemToReg = 1'b0;
        MEM_MemRead = 1'b0;
        MEM_MemWrite = 1'b0;
        MEM_ALUResult = 32'b0;
        MEM_RegReadData2 = 32'b0;
        MEM_FinalReg = 5'b0;
    end

    always @ (posedge clk) begin
        MEM_RegWrite = EX_RegWrite;
        MEM_MemToReg = EX_MemToReg;
        MEM_MemRead = EX_MemRead;
        MEM_MemWrite = EX_MemWrite;
        MEM_ALUResult = EX_ALUResult;
        MEM_RegReadData2 = EX_RegReadData2;
        MEM_FinalReg = EX_FinalReg;
    end

endmodule
