`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 23:30:09
// Design Name: 
// Module Name: test
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


module test();
    reg read_write;
    reg [9:0] address;
    reg [31:0] write_data;
    wire [31:0] read_data;
    wire hit_miss;

    Cache_WriteBack_2Way uut(.ReadOrWrite(read_write), .Addr(address), .WriteData(write_data), .ReadData(read_data), .HitOrMiss(hit_miss));

    initial begin
        $display("=======================================================================");
	    #0 read_write = 0; address = 10'b0000000000; //should miss
	    #10 read_write = 1; address = 10'b0000000000; write_data = 8'b11111111; //should hit
	    #10 read_write = 0; address = 10'b0000000000; //should hit and read out 0xff
	
	    //here check main memory content, 
	    //the first byte should remain 0x00 if it is write-back, 
	    //should change to 0xff if it is write-through.
        #10
        $display("Check main memory: Memory[0] = 0x%H", uut.mem.Memory[0]);
        $display("                   Memory[1] = 0x%H", uut.mem.Memory[1]);
        $display("                   Memory[2] = 0x%H", uut.mem.Memory[2]);
        $display("                   Memory[3] = 0x%H", uut.mem.Memory[3]);
        $display("=======================================================================");

	    #10 read_write = 0; address = 10'b1000000000; //should miss
	    #10 read_write = 0; address = 10'b0000000000; //should hit for 2-way associative, should miss for directly mapped
	
	    #10 read_write = 0; address = 10'b1100000000; //should miss
	    #10 read_write = 0; address = 10'b1000000000; //should miss both for directly mapped and for 2-way associative (Least-Recently-Used policy)
	    
	
	    //here check main memory content, 
	    //the first byte should be 0xff
        #10
        $display("Check main memory: Memory[0] = 0x%H", uut.mem.Memory[0]);
        $display("                   Memory[1] = 0x%H", uut.mem.Memory[1]);
        $display("                   Memory[2] = 0x%H", uut.mem.Memory[2]);
        $display("                   Memory[3] = 0x%H", uut.mem.Memory[3]);
        $display("=======================================================================");

        #10 $stop;
    end
endmodule
