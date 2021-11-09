`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 22:43:10
// Design Name: 
// Module Name: Register
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


module Register(clk, regwrite, readreg1, readreg2, writereg, writedata, 
                readdata1, readdata2, readregextra, readdataextra);

    input clk, regwrite;
    input [4:0] readreg1, readreg2, writereg, readregextra;
    input [31:0] writedata;
    output [31:0] readdata1,readdata2, readdataextra;
    reg [31:0] regs [0:31];
    integer i;

    initial begin
        for(i = 0 ; i < 32; i = i + 1) begin
            regs[i] = 32'b0;
        end
    end

    always @ (negedge clk) begin
        if (regwrite) begin
            regs[writereg] = writedata;
        end
    end

    assign readdata1 = regs[readreg1];
    assign readdata2 = regs[readreg2];
    assign readdataextra = regs[readregextra];

endmodule
