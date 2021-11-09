`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 10:47:19
// Design Name: 
// Module Name: IDEX
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


module IDEX(clk, flush, 
            ID_RegWrite, ID_MemToReg, ID_MemWrite, ID_MemRead, ID_ALUOp, ID_RegDst, ID_ALUSrc,
            EX_RegWrite, EX_MemToReg, EX_MemWrite, EX_MemRead, EX_ALUOp, EX_RegDst, EX_ALUSrc,
            ID_RegReadData1, ID_RegReadData2, ID_Extend, ID_Rs, ID_Rd, ID_Rt,
            EX_RegReadData1, EX_RegReadData2, EX_Extend, EX_Rs, EX_Rd, EX_Rt);

    input clk, flush, ID_RegWrite, ID_MemToReg, ID_MemWrite, ID_MemRead, ID_RegDst, ID_ALUSrc;
    input [1:0] ID_ALUOp;
    input [4:0] ID_Rs, ID_Rd, ID_Rt;
    input [31:0] ID_RegReadData1, ID_RegReadData2, ID_Extend;
    output reg EX_RegWrite, EX_MemToReg, EX_MemWrite, EX_MemRead, EX_RegDst, EX_ALUSrc;
    output reg [1:0] EX_ALUOp;
    output reg [4:0] EX_Rs, EX_Rd, EX_Rt;
    output reg [31:0] EX_RegReadData1, EX_RegReadData2, EX_Extend;

    initial begin
        EX_RegWrite = 1'b0;
        EX_MemToReg = 1'b0;
        EX_MemWrite = 1'b0;
        EX_MemRead = 1'b0;
        EX_ALUOp = 2'b0;
        EX_RegDst = 1'b0;
        EX_ALUSrc = 1'b0;
        EX_Rs = 5'b0;
        EX_Rd = 5'b0;
        EX_Rt = 5'b0;
        EX_RegReadData1 = 32'b0;
        EX_RegReadData2 = 32'b0;
        EX_Extend = 32'b0;
    end

    always @ (posedge clk) begin
        if (flush) begin
            EX_RegWrite = 1'b0;
            EX_MemToReg = 1'b0;
            EX_MemWrite = 1'b0;
            EX_MemRead = 1'b0;
            EX_ALUOp = 2'b0;
            EX_RegDst = 1'b0;
            EX_ALUSrc = 1'b0;
        end
        else begin
            EX_RegWrite = ID_RegWrite;
            EX_MemToReg = ID_MemToReg;
            EX_MemWrite = ID_MemWrite;
            EX_MemRead = ID_MemRead;
            EX_ALUOp = ID_ALUOp;
            EX_RegDst = ID_RegDst;
            EX_ALUSrc = ID_ALUSrc;
            EX_Rs = ID_Rs;
            EX_Rd = ID_Rd;
            EX_Rt = ID_Rt;
            EX_RegReadData1 = ID_RegReadData1;
            EX_RegReadData2 = ID_RegReadData2;
            EX_Extend = ID_Extend;
        end
    end


endmodule
