`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 10:22:52
// Design Name: 
// Module Name: Cache
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

// This is a write through 2-way set associative cache
module Cache(
    output reg [31:0]cache_read_data,
    output reg hit_miss,
    input cache_read_write,
    input [9:0]cache_address,
    input [31:0]cache_write_data
    );
    reg [127:0]main_memory_write_data;
    wire [9:0]main_memory_address;
    reg main_memory_read_write;
    wire [127:0]main_memory_read_data;
    // cache_read_data: Read Data output from Cache to CPU
    // hit_miss: signal telling CPU whether there is a hit or miss, 1 for hit, 0 for miss
    // main_memory_read_write: signal telling Main Memory whether Cache is going to read data from it or write data into it, 0 means read, 1 means write
    // main_memory_address: the address of reading or writing given by Cache to Main Memory
    // main_memory_write_data: the data will be written into Main Memory given by Cache
    // cache_read_write: signal telling Cache whether CPU is going to read data or write data, 0 means read, 1 means write
    // cache_address: the address of reading or writing given by CPU to Cache
    // cache_write_data: the data will be written into Cache given by CPU
    // main_memory_read_data: Read Data output from Main Memory to Cache
    
    reg [269:0]cacheReg[0:1];
    // 2 sets in total, each set includes 2 blocks, each block includes 4 words
    // block1 Usage: bit 269, 1 means recently accessed, 0 means recently not acccessed
    // block1 Valid: bit 268
    // block1 Tag: bit 267 to 263
    // block1 Data: bit 262 to 135
    // block2 Usage: bit 134
    // block2 Valid: bit 133
    // block2 Tag: bit 132 to 128
    // block2 Data: bit 127 to 0 

    reg [269:0]set;
    // register used to read the data of one set
    
    reg [134:0]block;
    // register used to read the data of one block
    
    reg [31:0]word;
    // register used to read the data of one word
    
    MainMemory zhenggangyyds (main_memory_read_data, main_memory_read_write, main_memory_address, main_memory_write_data);
    
    assign main_memory_address = cache_address;

    initial begin
        cacheReg[0] = 270'b0;
        cacheReg[1] = 270'b0;
        cache_read_data = 32'b0;
        hit_miss = 1'b0;
        main_memory_read_write = 1'b0;
        main_memory_write_data = 128'b0;
        set = 270'b0;
        block = 135'b0;
        word = 32'b0;
        // Initial the cache to be empty
    end

    always @(cache_read_write or cache_address or cache_write_data) begin
        if (cache_address[4] == 1'b0) begin  // if set index is 0
            set = cacheReg[0]; // read the data stored in set 0
        end
        else begin  // if set index is 1
            set = cacheReg[1]; // read the data stored in set 1
        end
        hit_miss = (set[268] == 1'b1 & cache_address[9:5] == set[267:263]) | (set[133] == 1'b1 & cache_address[9:5] == set[132:128])? 1 : 0;
        if (hit_miss == 1'b1) begin  // if hit
            main_memory_read_write = 1'b0;
            if (cache_address[9:5] == set[267:263]) block = set[269:135];  // if CPU wants to access block1
            else block = set[134:0];  // if CPU wants to access block2
        end
        else begin  // if miss
            main_memory_read_write = 1'b0;
            #1 if (set[268] == 1'b0 || (set[268] == 1'b1 && set[269] == 1'b0)) begin  // if block1 miss, delay here for the Main Memory to initialize
                set = {{1'b1}, {1'b1}, cache_address[9:5], main_memory_read_data, {1'b0}, set[133:0]};  // replace the data in block1 with data from Main Memory and change the Usage bit of block2 to 0
                block = set[269:135];
            end
            else if (set[133] == 1'b0 || (set[133] == 1'b1 && set[134] == 1'b0)) begin  // if block2 miss
                set = {{1'b0}, set[268:135], {1'b1}, {1'b1}, cache_address[9:5], main_memory_read_data};  // replace the data in block2 with data from Main Memory and change the Usage bit of block 1 to 0
                block = set[134:0];
            end
        end
        case (cache_address[3:2])
            2'b00: word = block[127:96];  // if CPU wants to access the first word
            2'b01: word = block[95:64];   // if CPU wants to access the second word
            2'b10: word = block[63:32];   // if CPU wants to access the third word
            2'b11: word = block[31:0];    // if CPU wants to access the forth word
        endcase
        if (cache_read_write == 1'b0) begin  // if CPU wants to read data from cache
            if (cache_address[1:0] == 2'b00) begin  // lb instruction, reading the first byte of the word
                cache_read_data = {{24{word[31]}}, word[31:24]};  // doing signed extension here
            end
            else if (cache_address[1:0] == 2'b01) begin  // lb instruction, reading the second byte of the word
                cache_read_data = {{24{word[23]}}, word[23:16]};  // doing signed extension here
            end
            else if (cache_address[1:0] == 2'b10) begin  // lb instruction, reading the third byte of the word
                cache_read_data = {{24{word[15]}}, word[15:8]};  // doing signed extension here
            end
            else begin  // lb instruction, reading the forth byte of the word
                cache_read_data = {{24{word[7]}}, word[7:0]};  // doing signed extension here
            end
            
            block = {{1'b1}, block[133:0]};
        end
        else begin  // if CPU wants to write data into cache
            cache_read_data = 32'b0;  // set the read data from Cache to CPU to 0 when doing writing operation
            case (cache_address[1:0])
                2'b00: word = {cache_write_data[7:0], word[23:0]};  // if writing the first byte
                2'b01: word = {word[31:24], cache_write_data[7:0], word[15:0]};  // if writing the second byte
                2'b10: word = {word[31:16], cache_write_data[7:0], word[7:0]};  // if writing the third byte
                2'b11: word = {word[31:8], cache_write_data[7:0]};  // if writing the forth byte
            endcase
            case (cache_address[3:2])
                2'b00: main_memory_write_data = {word[31:0], block[95:0]};                  // if CPU access the first word
                2'b01: main_memory_write_data = {block[127:96], word[31:0], block[63:0]};   // if CPU access the second word
                2'b10: main_memory_write_data = {block[127:64], word[31:0], block[31:0]};   // if CPU access the third word
                2'b11: main_memory_write_data = {block[127:32], word[31:0]};                // if CPU access the forth word
            endcase
            main_memory_read_write = 1'b1;  // write data into Main Memory
            
            block = {{1'b1}, block[133:128], main_memory_write_data[127:0]};
        end
        // after finishing the operation, restore the data in Cache
        if (cache_address[9:5] == set[267:263]) set = {block[134:0], {1'b0}, set[133:0]};  // if block1 is accessed, set the Usage bit of block2 to 0
        else set = {{1'b0}, set[268:135], block[134:0]};  // if block2 is accessed, set the Usage bit of block1 to 0
        if (cache_address[4] == 1'b0) cacheReg[0] = set[269:0];  // if the set with index 0 is accessed
        else cacheReg[1] = set[269:0];  // if the set with index 1 is accessed
        
        $display("==================================================");
		$display("read_write= %B; address=10'b%B; write_data=0x%H",cache_read_write, cache_address, cache_write_data);
	    if(cache_read_write == 1'b0) begin
		    $display("read_data_to_cpu: 0x%H", cache_read_data);
	    end
		$display("hit_miss: %B",hit_miss);
    end

endmodule
