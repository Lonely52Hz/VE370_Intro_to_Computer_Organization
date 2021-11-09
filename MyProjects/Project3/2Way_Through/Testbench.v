`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/24 16:41:37
// Design Name: 
// Module Name: Testbench
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


module Testbench;
    reg read_write;
    reg [9:0]address;
    reg [31:0]write_data;
    wire hit_miss;
    wire [31:0]read_data;
    
    Cache write_through_2_way_associative (read_data, hit_miss, read_write, address, write_data);

    
    // read_write: 0 for read, 1 for write
    // Address: 10 bits byte address
    // write_data: 32 bits value (8 bits are enough for this project demo)
    // keep track of the output of your (cache+memory) block, which are read_data and hit_miss
    // also please find a way to show the content of the main memory 

    initial begin
	   #0 read_write = 0; address = 10'b0000000000; //should miss
	   #10 read_write = 1; address = 10'b0000000000; write_data = 8'b11111111; //should hit
	   #10 read_write = 0; address = 10'b0000000000; //should hit and read out 0xff
	
	   //here check main memory content, 
	   //the first byte should remain 0x00 if it is write-back, 
	   //should change to 0xff if it is write-through.
	   #10 $display("==================================================");
	       $display("Main memory content = 0x%H", write_through_2_way_associative.zhenggangyyds.mem[0]);
	
	   #10 read_write = 0; address = 10'b1000000000; //should miss
	   #10 read_write = 0; address = 10'b0000000000; //should hit for 2-way associative, should miss for directly mapped
	
	   #10 read_write = 0; address = 10'b1100000000; //should miss
	   #10 read_write = 0; address = 10'b1000000000; //should miss both for directly mapped and for 2-way associative (Least-Recently-Used policy)
	  
	   //here check main memory content, 
	   //the first byte should be 0xff
	   #10 $display("==================================================");
	       $display("Main memory content = 0x%H", write_through_2_way_associative.zhenggangyyds.mem[0]);
	       $display("==================================================");
    end


endmodule
