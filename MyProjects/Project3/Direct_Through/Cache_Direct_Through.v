`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 21:46:40
// Design Name: 
// Module Name: Cache_Direct_Through
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


module Cache_Direct_Through(ReadOrWrite, Addr, WriteData, ReadData, HitOrMiss);
    input ReadOrWrite;
    input [9:0] Addr;
    input [31:0] WriteData;
    output reg [31:0] ReadData;
    output wire HitOrMiss;

    reg HitOrMiss_Temp;
    wire [127:0] Mem_ReadData;
    reg [127:0] Mem_WriteData;

    wire [3:0] CPU_Tag;
    wire [1:0] CPU_BlockIdx, CPU_WordOffSet, CPU_ByteOffSet;

    reg [132:0] cache [0:3];

    
    assign CPU_Tag = Addr[9:6];
    assign CPU_BlockIdx = Addr[5:4];
    assign CPU_WordOffSet = Addr[3:2];
    assign CPU_ByteOffSet = Addr[1:0];

    integer i;

    initial begin // initialize the cache
        for (i = 0; i < 4; i = i + 1) begin
            cache[i] = 133'b0;
        end
    end

    Memory mem(ReadOrWrite, Addr, Mem_WriteData, Mem_ReadData);

    assign HitOrMiss = (cache[CPU_BlockIdx][132] == 1'b1) && (cache[CPU_BlockIdx][131:128] == CPU_Tag);

    always @ (ReadOrWrite or Addr or WriteData) begin
        HitOrMiss_Temp = (cache[CPU_BlockIdx][132] == 1'b1) && (cache[CPU_BlockIdx][131:128] == CPU_Tag);
        if (HitOrMiss_Temp) begin // hit
            if (ReadOrWrite) begin // hit and write
                case (CPU_WordOffSet)
                2'b00: begin
                    case (CPU_ByteOffSet)
                    2'b00: cache[CPU_BlockIdx][127:120] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][119:112] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][111:104] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][103:96] = WriteData[7:0];
                    endcase
                end
                2'b01: begin
                    case (CPU_ByteOffSet)
                    2'b00: cache[CPU_BlockIdx][95:88] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][87:80] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][79:72] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][71:64] = WriteData[7:0];
                    endcase
                end
                2'b10: begin
                    case (CPU_ByteOffSet)
                    2'b00: cache[CPU_BlockIdx][63:56] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][55:48] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][47:40] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][39:32] = WriteData[7:0];
                    endcase
                end
                2'b11: begin
                    case (CPU_ByteOffSet)
                    2'b00: cache[CPU_BlockIdx][31:24] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][23:16] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][15:8] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][7:0] = WriteData[7:0];
                    endcase
                end
                endcase
                Mem_WriteData = cache[CPU_BlockIdx][127:0];
            end
            else begin // hit and read
                case (CPU_WordOffSet)
                2'b00: ReadData = cache[CPU_BlockIdx][127:96];
                2'b01: ReadData = cache[CPU_BlockIdx][95:64];
                2'b10: ReadData = cache[CPU_BlockIdx][63:32];
                2'b11: ReadData = cache[CPU_BlockIdx][31:0];
                endcase
            end
        end
        else begin // miss
            $display("Miss!");
            cache[CPU_BlockIdx][132] = 1'b1;
            cache[CPU_BlockIdx][131:128] = CPU_Tag[3:0];
            #1
            cache[CPU_BlockIdx][127:0] = Mem_ReadData; // read data to cache
            #1 // delay
            if (ReadOrWrite) begin // miss and write
                case (CPU_WordOffSet)
                2'b00: begin
                    case (CPU_ByteOffSet)
                    2'b00: cache[CPU_BlockIdx][127:120] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][119:112] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][111:104] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][103:96] = WriteData[7:0];
                    endcase
                end
                2'b01: begin
                    case (CPU_ByteOffSet)
                    2'b00: cache[CPU_BlockIdx][95:88] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][87:80] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][79:72] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][71:64] = WriteData[7:0];
                    endcase
                end
                2'b10: begin
                    case (CPU_ByteOffSet)
                    2'b00: cache[CPU_BlockIdx][63:56] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][55:48] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][47:40] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][39:32] = WriteData[7:0];
                    endcase
                end
                2'b11: begin
                    case (CPU_ByteOffSet)
                    2'b00: cache[CPU_BlockIdx][31:24] = WriteData[7:0];
                    2'b01: cache[CPU_BlockIdx][23:16] = WriteData[7:0];
                    2'b10: cache[CPU_BlockIdx][15:8] = WriteData[7:0];
                    2'b11: cache[CPU_BlockIdx][7:0] = WriteData[7:0];
                    endcase
                end
                endcase
                Mem_WriteData = cache[CPU_BlockIdx][127:0];
            end
            else begin // miss and read
                case (CPU_WordOffSet)
                2'b00: ReadData = cache[CPU_BlockIdx][127:96];
                2'b01: ReadData = cache[CPU_BlockIdx][95:64];
                2'b10: ReadData = cache[CPU_BlockIdx][63:32];
                2'b11: ReadData = cache[CPU_BlockIdx][31:0];
                endcase
            end 
        end
        
        if (ReadOrWrite) begin
            $display("Input: Read/Write = %B, Address = 10'b%B, WriteData = 0x%H", ReadOrWrite, Addr, WriteData[7:0]);
        end
        else begin
            $display("Input: Read/Write = %B, Address = 10'b%B", ReadOrWrite, Addr);
        end
        $display("Output: ReadData = 0x%H, Hit/Miss = %B", ReadData, HitOrMiss_Temp);
        $display("=======================================================================");
    end

endmodule
