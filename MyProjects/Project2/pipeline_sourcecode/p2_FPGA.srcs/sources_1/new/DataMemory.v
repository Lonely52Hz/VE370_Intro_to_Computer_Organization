`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 20:48:28
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(clk, address, memread, memwrite, writedata, readdata);
    input clk;
    input [31:0] address;
    input memread, memwrite;
    input [31:0] writedata;
    output reg [31:0] readdata;
    reg [31:0] memory [0:31];
    integer i;
    
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            memory[i] = 32'b0;
        end
    end

    always @ (posedge clk) begin
        if (memwrite == 1'b1) begin
             memory[address >> 2] = writedata;
        end
    end

    always @ (*) begin
        if (memread == 1'b1) begin
            readdata = memory[address >> 2];
        end
        else begin
            readdata = 32'b0;
        end
    end

endmodule
