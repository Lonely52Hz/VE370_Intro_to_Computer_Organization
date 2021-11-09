`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/24 11:28:42
// Design Name: 
// Module Name: MainMemory
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


module MainMemory(
    output reg [127:0]read_data,
    input read_write,
    input [9:0]address,
    input [127:0]write_data
    );
    // read_data: the data read out from the Main Memory to Cache, 0 means read, 1 means write
    // read_write: signal telling whether the Cache wants to read or write data
    // address: the address of reading or writing given by Cache
    // write_data: the data will be written into Main Memory given by Cache
    
    reg [31:0]mem[0:255];
    // register storing the data of main memory
    
    integer i;
    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            mem[i] = i+1;
        end
    end
    
    always @(read_write or address or write_data) begin
        if (read_write == 1'b0) begin  // read data from Main Memory
            if (address[3:2] == 2'b00) begin  // if the address point to the first word of a block
                read_data = {mem[address[9:2]], mem[address[9:2]+1], mem[address[9:2]+2], mem[address[9:2]+3]};
            end
            else if (address[3:2] == 2'b01) begin  // if the address point to the second word of a block
                read_data = {mem[address[9:2]-1], mem[address[9:2]], mem[address[9:2]+1], mem[address[9:2]+2]};
            end
            else if (address[3:2] == 2'b10) begin  // if the address point to the third word of a block
                read_data = {mem[address[9:2]-2], mem[address[9:2]-1], mem[address[9:2]], mem[address[9:2]+1]};
            end
            else begin  // if the address point to the forth word of a block
                read_data = {mem[address[9:2]-3], mem[address[9:2]-2], mem[address[9:2]-1], mem[address[9:2]]};
            end
        end
        else begin  // write data into Main Memory
            if (address[3:2] == 1'b00) begin  // if the address point to the first word of a block
                mem[address[9:2]] = write_data[127:96];
            end
            else if (address[3:2] == 2'b01) begin  // if the address point to the second word of a block
                mem[address[9:2]] = write_data[95:64];
            end
            else if (address[3:2] == 2'b10) begin  // if the address point to the third word of a block
                mem[address[9:2]] = write_data[63:32];
            end
            else begin  // if the address point to the forth word of a block
                mem[address[9:2]] = write_data[31:0];
            end
        end
    end
endmodule
