`timescale 1ns / 1ps

module Register(clk, regwrite, readreg1, readreg2, writereg, writedata, readdata1, readdata2);
    input clk, regwrite;
    input [4:0] readreg1, readreg2, writereg;
    input [31:0] writedata;
    output [31:0] readdata1, readdata2;
    reg [31:0] regs [0:31];
    integer i;

    initial begin
        for(i = 0 ; i < 32; i = i + 1) begin
            regs[i] = 32'b0;
        end
    end
	
    always @(posedge clk) begin
        if (regwrite) begin
             regs[writereg] = writedata;
        end
    end
    
    assign readdata1 = regs[readreg1];
    assign readdata2 = regs[readreg2];
    
endmodule
