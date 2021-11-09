`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2020 11:34:17 PM
// Design Name: 
// Module Name: cache_writeback
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


module cache_writeback(ReadOrWrite, Addr, WriteData, ReadData, HitOrMiss);
    input ReadOrWrite;
    input [9:0] Addr;
    input [7:0] WriteData;
    output reg [31:0] ReadData;

    output wire HitOrMiss;
    reg HitOrMiss_temp;
    assign HitOrMiss = HitOrMiss_temp;   
    reg ReadOrWrite_temp;
    wire [127:0] Mem_ReadData;
    reg [127:0] Mem_WriteData;
    reg [9:0] Mem_Addr;
    
    reg [3:0] Tag_temp;
    wire [3:0] CPU_Tag;
    assign CPU_Tag = Addr[9:6];

    wire [1:0] CPU_BlockIdx;
    assign CPU_BlockIdx = Addr[5:4];

    wire [1:0] CPU_WordIdx;
    assign CPU_WordIdx = Addr[3:2];

    wire [1:0] CPU_ByteIdx;
    assign CPU_ByteIdx = Addr[1:0];

    reg [133:0] cache [0:3];
    
    wire valid,dirty;
    assign valid = cache[CPU_BlockIdx][133];
    assign dirty = cache[CPU_BlockIdx][132];
    
    integer i;

    Memory mem(ReadOrWrite_temp, Mem_Addr, Mem_WriteData, Mem_ReadData);   
    initial begin // initialize the cache
        ReadOrWrite_temp = 1'b0;
        Mem_WriteData = 128'b0;
        for (i = 0; i < 4; i = i + 1) begin
            cache[i] = 134'b0;
        end
    end

    always @ (ReadOrWrite or Addr or WriteData)begin 
    HitOrMiss_temp = (cache[CPU_BlockIdx][133]) & (Tag_temp == CPU_Tag);

    Tag_temp = cache[CPU_BlockIdx][131:128];//Tag_temp pf cache

        #0.1;
        if (~HitOrMiss_temp) begin// miss
            $display("Miss!");
            if (dirty) begin
                Mem_Addr = {Tag_temp,Addr[5:0]}; // Addr to wb
                Mem_WriteData = cache[CPU_BlockIdx][127:0];// Data to wb
            #0.1;
                ReadOrWrite_temp = 1'b1;
            #0.1; 
                ReadOrWrite_temp = 1'b0;
            end

            #0.1;
                Mem_Addr = Addr; 
            #0.1;
                Tag_temp = CPU_Tag;
                cache[CPU_BlockIdx][127:0] = Mem_ReadData;
            #0.1;
                cache[CPU_BlockIdx][133] = 1'b1;
                cache[CPU_BlockIdx][132] = 1'b0;//set back to 0;
            
        end 
            else begin// hit
           
            if (ReadOrWrite == 1'b1) begin
                cache[CPU_BlockIdx][132] = 1'b1;
                if (CPU_ByteIdx == 2'b00) begin
                    case(CPU_WordIdx)
                    2'b00: cache[CPU_BlockIdx][127:120] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][119:112] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][111:104] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][103:96] = WriteData[7:0];
                endcase
                end

                if (CPU_ByteIdx == 2'b01) begin
                    case(CPU_WordIdx)
                    2'b00: cache[CPU_BlockIdx][95:88] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][87:80] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][79:72] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][71:64] = WriteData[7:0];
                endcase
                end

                if (CPU_ByteIdx == 2'b10) begin
                    case(CPU_WordIdx)
                    2'b00: cache[CPU_BlockIdx][63:56] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][55:48] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][47:40] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][39:32] = WriteData[7:0];
                endcase
                end

                if (CPU_ByteIdx == 2'b11) begin
                    case(CPU_WordIdx)
                    2'b00: cache[CPU_BlockIdx][31:24] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][23:16] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][15:8] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][7:0] = WriteData[7:0];
                endcase
                end
            end

        end

        if (ReadOrWrite == 1'b0) begin
            case (CPU_WordIdx)
                2'b00: ReadData = cache[CPU_BlockIdx][127:96];
                2'b01: ReadData  = cache[CPU_BlockIdx][95:64];
                2'b10: ReadData  = cache[CPU_BlockIdx][63:32];
                2'b11: ReadData = cache[CPU_BlockIdx][31:0];
            endcase
        end

        
        if (ReadOrWrite) begin
            $display("Input: Read/Write = %B, Address = 10'b%B, WriteData = 0x%H", ReadOrWrite, Addr, WriteData[7:0]);
        end
        else begin
            $display("Input: Read/Write = %B, Address = 10'b%B", ReadOrWrite, Addr);
        end
        $display("Output: ReadData = 0x%H, Hit/Miss = %B", ReadData, HitOrMiss_temp);
        $display("=======================================================================");
    end
    
 
    

endmodule
