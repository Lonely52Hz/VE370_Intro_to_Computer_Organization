`timescale 1ns / 1ps

module DataMemory(clk, address, memread, memwrite, writedata, readdata);
    input clk;
    input [31:0] address;
    input memread, memwrite;
    input [31:0] writedata;
    output reg [31:0] readdata;
    reg [31:0] memory [0:31];
    integer i;
    
    initial begin
        for(i = 0; i < 32; i = i + 1)
            memory[i] = 32'b0;
    end

    always @ (posedge clk) begin
        if (memwrite) begin
             memory[address >> 2] = writedata;
        end
    end

    always @ (*) begin
        if (memread) begin
            readdata = memory[address >> 2];
        end 
        else begin
            readdata = 32'b0;
        end
    end
endmodule
