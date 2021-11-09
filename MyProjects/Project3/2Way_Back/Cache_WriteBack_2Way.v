`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/24 19:47:03
// Design Name: 
// Module Name: Cache_WriteBack_2Way
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


module Cache_WriteBack_2Way(ReadOrWrite, Addr, WriteData, ReadData, HitOrMiss);
    input ReadOrWrite;
    input [9:0] Addr;
    input [31:0] WriteData;
    output reg [31:0] ReadData;
    output wire HitOrMiss;
    
    integer i;
    reg HitOrMiss_Temp, Mem_ReadOrWrite;
    wire [127:0] Mem_ReadData;
    reg [127:0] Mem_WriteData;
    reg [9:0] Mem_Addr;

    wire [4:0] CPU_Tag;
    wire [1:0] CPU_WordOffSet, CPU_ByteOffSet;
    reg Valid [0:1];
    reg Reference [0:3];
    reg [4:0] Block_Tag [0:1];

    reg [134:0] cache [0:3];

    initial begin // initialize the cache
        for (i = 0; i < 4; i = i + 1) begin
            cache[i] = 135'b0;
            Reference[i] = 1'b0;
        end
        Mem_ReadOrWrite = 1'b0;
    end

    assign CPU_Tag = Addr[9:5];
    assign CPU_SetIdx = Addr[4];
    assign CPU_WordOffSet = Addr[3:2];
    assign CPU_ByteOffSet = Addr[1:0];

    assign HitOrMiss = ((Valid[0]) && (CPU_Tag == Block_Tag[0])) || ((Valid[1]) && (CPU_Tag == Block_Tag[1]));

    Memory mem(Mem_ReadOrWrite, Mem_Addr, Mem_WriteData, Mem_ReadData);

    always @ (ReadOrWrite or Addr or WriteData) begin
        if (CPU_SetIdx == 1'b0) begin
            Valid[0] = cache[0][134];
            Valid[1] = cache[1][134];
            Block_Tag[0] = cache[0][132:128];
            Block_Tag[1] = cache[1][132:128];
        end
        else begin
            Valid[0] = cache[2][134];
            Valid[1] = cache[3][134];
            Block_Tag[0] = cache[2][132:128];
            Block_Tag[1] = cache[3][132:128];
        end
        HitOrMiss_Temp = ((Valid[0] == 1'b1) && (CPU_Tag == Block_Tag[0])) || ((Valid[1] == 1'b1) && (CPU_Tag == Block_Tag[1]));
        if (HitOrMiss_Temp) begin // hit
            Mem_ReadOrWrite = 1'b0;
            if (CPU_SetIdx == 1'b0) begin // if it is the first set
                if ((Valid[0] == 1'b1) && (CPU_Tag == Block_Tag[0])) begin // if it is the first block
                    Reference[0] = 1'b1;
                    Reference[1] = 1'b0; // set LRU
                    if (ReadOrWrite) begin // hit and write first block
                        cache[0][133] = 1'b1; // dirty
                        case (CPU_WordOffSet)
                        2'b00: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[0][127:120] = WriteData[7:0];
                            2'b01: cache[0][119:112] = WriteData[7:0];
                            2'b10: cache[0][111:104] = WriteData[7:0];
                            2'b11: cache[0][103:96] = WriteData[7:0];
                            endcase
                        end
                        2'b01: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[0][95:88] = WriteData[7:0];
                            2'b01: cache[0][87:80] = WriteData[7:0];
                            2'b10: cache[0][79:72] = WriteData[7:0];
                            2'b11: cache[0][71:64] = WriteData[7:0];
                            endcase
                        end
                        2'b10: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[0][63:56] = WriteData[7:0];
                            2'b01: cache[0][55:48] = WriteData[7:0];
                            2'b10: cache[0][47:40] = WriteData[7:0];
                            2'b11: cache[0][39:32] = WriteData[7:0];
                            endcase
                        end
                        2'b11: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[0][31:24] = WriteData[7:0];
                            2'b01: cache[0][23:16] = WriteData[7:0];
                            2'b10: cache[0][15:8] = WriteData[7:0];
                            2'b11: cache[0][7:0] = WriteData[7:0];
                            endcase
                        end
                        endcase
                    end
                    else begin // hit and read first block
                        case (CPU_WordOffSet)
                        2'b00: ReadData = cache[0][127:96];
                        2'b01: ReadData = cache[0][95:64];
                        2'b10: ReadData = cache[0][63:32];
                        2'b11: ReadData = cache[0][31:0];
                        endcase
                    end
                end
                else if ((Valid[1] == 1'b1) && (CPU_Tag == Block_Tag[1])) begin // if it is the second block
                    Reference[1] = 1'b1;
                    Reference[0] = 1'b0; // set LRU
                    if (ReadOrWrite) begin // hit and write second block
                        cache[1][133] = 1'b1; // dirty
                        case (CPU_WordOffSet)
                        2'b00: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[1][127:120] = WriteData[7:0];
                            2'b01: cache[1][119:112] = WriteData[7:0];
                            2'b10: cache[1][111:104] = WriteData[7:0];
                            2'b11: cache[1][103:96] = WriteData[7:0];
                            endcase
                        end
                        2'b01: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[1][95:88] = WriteData[7:0];
                            2'b01: cache[1][87:80] = WriteData[7:0];
                            2'b10: cache[1][79:72] = WriteData[7:0];
                            2'b11: cache[1][71:64] = WriteData[7:0];
                            endcase
                        end
                        2'b10: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[1][63:56] = WriteData[7:0];
                            2'b01: cache[1][55:48] = WriteData[7:0];
                            2'b10: cache[1][47:40] = WriteData[7:0];
                            2'b11: cache[1][39:32] = WriteData[7:0];
                            endcase
                        end
                        2'b11: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[1][31:24] = WriteData[7:0];
                            2'b01: cache[1][23:16] = WriteData[7:0];
                            2'b10: cache[1][15:8] = WriteData[7:0];
                            2'b11: cache[1][7:0] = WriteData[7:0];
                            endcase
                        end
                        endcase
                    end
                    else begin // hit and read second block
                        case (CPU_WordOffSet)
                        2'b00: ReadData = cache[1][127:96];
                        2'b01: ReadData = cache[1][95:64];
                        2'b10: ReadData = cache[1][63:32];
                        2'b11: ReadData = cache[1][31:0];
                        endcase
                    end
                end
            end
            else if (CPU_SetIdx == 1'b1) begin // if it is the second set
                if ((Valid[0] == 1'b1) && (CPU_Tag == Block_Tag[0])) begin // if it is the first block
                    Reference[2] = 1'b1;
                    Reference[3] = 1'b0; // set LRU
                    if (ReadOrWrite) begin // hit and write first block
                        cache[2][133] = 1'b1; // dirty
                        case (CPU_WordOffSet)
                        2'b00: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[2][127:120] = WriteData[7:0];
                            2'b01: cache[2][119:112] = WriteData[7:0];
                            2'b10: cache[2][111:104] = WriteData[7:0];
                            2'b11: cache[2][103:96] = WriteData[7:0];
                            endcase
                        end
                        2'b01: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[2][95:88] = WriteData[7:0];
                            2'b01: cache[2][87:80] = WriteData[7:0];
                            2'b10: cache[2][79:72] = WriteData[7:0];
                            2'b11: cache[2][71:64] = WriteData[7:0];
                            endcase
                        end
                        2'b10: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[2][63:56] = WriteData[7:0];
                            2'b01: cache[2][55:48] = WriteData[7:0];
                            2'b10: cache[2][47:40] = WriteData[7:0];
                            2'b11: cache[2][39:32] = WriteData[7:0];
                            endcase
                        end
                        2'b11: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[2][31:24] = WriteData[7:0];
                            2'b01: cache[2][23:16] = WriteData[7:0];
                            2'b10: cache[2][15:8] = WriteData[7:0];
                            2'b11: cache[2][7:0] = WriteData[7:0];
                            endcase
                        end
                        endcase
                    end
                    else begin // hit and read first block
                        case (CPU_WordOffSet)
                        2'b00: ReadData = cache[2][127:96];
                        2'b01: ReadData = cache[2][95:64];
                        2'b10: ReadData = cache[2][63:32];
                        2'b11: ReadData = cache[2][31:0];
                        endcase
                    end
                end
                else if ((Valid[1] == 1'b1) && (CPU_Tag == Block_Tag[1])) begin // if it is the second block
                    Reference[3] = 1'b1;
                    Reference[2] = 1'b0; // set LRU
                    if (ReadOrWrite) begin // hit and write second block
                        cache[3][133] = 1'b1; // dirty
                        case (CPU_WordOffSet)
                        2'b00: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[3][127:120] = WriteData[7:0];
                            2'b01: cache[3][119:112] = WriteData[7:0];
                            2'b10: cache[3][111:104] = WriteData[7:0];
                            2'b11: cache[3][103:96] = WriteData[7:0];
                            endcase
                        end
                        2'b01: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[3][95:88] = WriteData[7:0];
                            2'b01: cache[3][87:80] = WriteData[7:0];
                            2'b10: cache[3][79:72] = WriteData[7:0];
                            2'b11: cache[3][71:64] = WriteData[7:0];
                            endcase
                        end
                        2'b10: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[3][63:56] = WriteData[7:0];
                            2'b01: cache[3][55:48] = WriteData[7:0];
                            2'b10: cache[3][47:40] = WriteData[7:0];
                            2'b11: cache[3][39:32] = WriteData[7:0];
                            endcase
                        end
                        2'b11: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[3][31:24] = WriteData[7:0];
                            2'b01: cache[3][23:16] = WriteData[7:0];
                            2'b10: cache[3][15:8] = WriteData[7:0];
                            2'b11: cache[3][7:0] = WriteData[7:0];
                            endcase
                        end
                        endcase
                    end
                    else begin // hit and read second block
                        case (CPU_WordOffSet)
                        2'b00: ReadData = cache[3][127:96];
                        2'b01: ReadData = cache[3][95:64];
                        2'b10: ReadData = cache[3][63:32];
                        2'b11: ReadData = cache[3][31:0];
                        endcase
                    end
                end
            end
        end
        else begin // miss
            $display("Miss!");
            if (CPU_SetIdx == 1'b0) begin // if it is the first set
                if ((Reference[0] == 1'b0 && Reference[1] == 1'b0) || (Reference[0] == 1'b0 && Reference[1] == 1'b1)) begin // repalce the first block
                    if (cache[0][133]) begin // if it is dirty, we need to write it back to main memory first
                        Mem_WriteData[127:0] = cache[0][127:0];
                        Mem_Addr = {cache[0][132:128], 5'b00000};
                        Mem_ReadOrWrite = 1'b1;
                    end
                    else begin
                        Mem_Addr = Addr;
                        Mem_ReadOrWrite = 1'b0; // if it is not dirty, we do not need to write it back
                    end
                    #1
                    Mem_Addr = Addr;
                    Mem_ReadOrWrite = 1'b0;
                    #1
                    cache[0][134] = 1'b1; // valid now
                    cache[0][133] = 1'b0; // not dirty
                    cache[0][132:128] = CPU_Tag; // tag
                    cache[0][127:0] = Mem_ReadData[127:0]; // load data
                    Reference[0] = 1'b1;
                    Reference[1] = 1'b0; // set LRU
                    if (ReadOrWrite) begin // hit and write first block
                        cache[0][133] = 1'b1; // dirty
                        case (CPU_WordOffSet)
                        2'b00: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[0][127:120] = WriteData[7:0];
                            2'b01: cache[0][119:112] = WriteData[7:0];
                            2'b10: cache[0][111:104] = WriteData[7:0];
                            2'b11: cache[0][103:96] = WriteData[7:0];
                            endcase
                        end
                        2'b01: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[0][95:88] = WriteData[7:0];
                            2'b01: cache[0][87:80] = WriteData[7:0];
                            2'b10: cache[0][79:72] = WriteData[7:0];
                            2'b11: cache[0][71:64] = WriteData[7:0];
                            endcase
                        end
                        2'b10: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[0][63:56] = WriteData[7:0];
                            2'b01: cache[0][55:48] = WriteData[7:0];
                            2'b10: cache[0][47:40] = WriteData[7:0];
                            2'b11: cache[0][39:32] = WriteData[7:0];
                            endcase
                        end
                        2'b11: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[0][31:24] = WriteData[7:0];
                            2'b01: cache[0][23:16] = WriteData[7:0];
                            2'b10: cache[0][15:8] = WriteData[7:0];
                            2'b11: cache[0][7:0] = WriteData[7:0];
                            endcase
                        end
                        endcase
                    end
                    else begin // hit and read first block
                        case (CPU_WordOffSet)
                        2'b00: ReadData = cache[0][127:96];
                        2'b01: ReadData = cache[0][95:64];
                        2'b10: ReadData = cache[0][63:32];
                        2'b11: ReadData = cache[0][31:0];
                        endcase
                    end
                end
                else if (Reference[0] == 1'b1 && Reference[1] == 1'b0) begin // replace the second cache
                    if (cache[1][133]) begin // if it is dirty, we need to write it back to main memory first
                        Mem_WriteData[127:0] = cache[1][127:0];
                        Mem_Addr = {cache[1][132:128], 5'b00000};
                        Mem_ReadOrWrite = 1'b1;
                    end
                    else begin
                        Mem_Addr = Addr;
                        Mem_ReadOrWrite = 1'b0; // if it is not dirty, we do not need to write it back
                    end
                    #1
                    Mem_Addr = Addr;
                    Mem_ReadOrWrite = 1'b0;
                    #1
                    cache[1][134] = 1'b1; // valid now
                    cache[1][133] = 1'b0; // not dirty
                    cache[1][132:128] = CPU_Tag; // tag
                    cache[1][127:0] = Mem_ReadData[127:0]; // load data
                    Reference[0] = 1'b0;
                    Reference[1] = 1'b1; // set LRU
                    if (ReadOrWrite) begin // hit and write second block
                        cache[1][133] = 1'b1; // dirty
                        case (CPU_WordOffSet)
                        2'b00: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[1][127:120] = WriteData[7:0];
                            2'b01: cache[1][119:112] = WriteData[7:0];
                            2'b10: cache[1][111:104] = WriteData[7:0];
                            2'b11: cache[1][103:96] = WriteData[7:0];
                            endcase
                        end
                        2'b01: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[1][95:88] = WriteData[7:0];
                            2'b01: cache[1][87:80] = WriteData[7:0];
                            2'b10: cache[1][79:72] = WriteData[7:0];
                            2'b11: cache[1][71:64] = WriteData[7:0];
                            endcase
                        end
                        2'b10: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[1][63:56] = WriteData[7:0];
                            2'b01: cache[1][55:48] = WriteData[7:0];
                            2'b10: cache[1][47:40] = WriteData[7:0];
                            2'b11: cache[1][39:32] = WriteData[7:0];
                            endcase
                        end
                        2'b11: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[1][31:24] = WriteData[7:0];
                            2'b01: cache[1][23:16] = WriteData[7:0];
                            2'b10: cache[1][15:8] = WriteData[7:0];
                            2'b11: cache[1][7:0] = WriteData[7:0];
                            endcase
                        end
                        endcase
                    end
                    else begin // hit and read second block
                        case (CPU_WordOffSet)
                        2'b00: ReadData = cache[1][127:96];
                        2'b01: ReadData = cache[1][95:64];
                        2'b10: ReadData = cache[1][63:32];
                        2'b11: ReadData = cache[1][31:0];
                        endcase
                    end
                end
            end
            else if (CPU_SetIdx == 1'b1) begin // if it is the second set
                if ((Reference[2] == 1'b0 && Reference[3] == 1'b0) || (Reference[2] == 1'b0 && Reference[3] == 1'b1)) begin // repalce the first block
                    if (cache[2][133]) begin // if it is dirty, we need to write it back to main memory first
                        Mem_WriteData[127:0] = cache[2][127:0];
                        Mem_Addr = {cache[2][132:128], 5'b00000};
                        Mem_ReadOrWrite = 1'b1;
                    end
                    else begin
                        Mem_Addr = Addr;
                        Mem_ReadOrWrite = 1'b0; // if it is not dirty, we do not need to write it back
                    end
                    #1
                    Mem_Addr = Addr;
                    Mem_ReadOrWrite = 1'b0;
                    #1
                    cache[2][134] = 1'b1; // valid now
                    cache[2][133] = 1'b0; // not dirty
                    cache[2][132:128] = CPU_Tag; // tag
                    cache[2][127:0] = Mem_ReadData[127:0]; // load data
                    Reference[2] = 1'b1;
                    Reference[3] = 1'b0; // set LRU
                    if (ReadOrWrite) begin // hit and write first block
                        cache[2][133] = 1'b1; // dirty
                        case (CPU_WordOffSet)
                        2'b00: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[2][127:120] = WriteData[7:0];
                            2'b01: cache[2][119:112] = WriteData[7:0];
                            2'b10: cache[2][111:104] = WriteData[7:0];
                            2'b11: cache[2][103:96] = WriteData[7:0];
                            endcase
                        end
                        2'b01: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[2][95:88] = WriteData[7:0];
                            2'b01: cache[2][87:80] = WriteData[7:0];
                            2'b10: cache[2][79:72] = WriteData[7:0];
                            2'b11: cache[2][71:64] = WriteData[7:0];
                            endcase
                        end
                        2'b10: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[2][63:56] = WriteData[7:0];
                            2'b01: cache[2][55:48] = WriteData[7:0];
                            2'b10: cache[2][47:40] = WriteData[7:0];
                            2'b11: cache[2][39:32] = WriteData[7:0];
                            endcase
                        end
                        2'b11: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[2][31:24] = WriteData[7:0];
                            2'b01: cache[2][23:16] = WriteData[7:0];
                            2'b10: cache[2][15:8] = WriteData[7:0];
                            2'b11: cache[2][7:0] = WriteData[7:0];
                            endcase
                        end
                        endcase
                    end
                    else begin // hit and read first block
                        case (CPU_WordOffSet)
                        2'b00: ReadData = cache[2][127:96];
                        2'b01: ReadData = cache[2][95:64];
                        2'b10: ReadData = cache[2][63:32];
                        2'b11: ReadData = cache[2][31:0];
                        endcase
                    end
                end
                else if (Reference[2] == 1'b1 && Reference[3] == 1'b0) begin // replace the second cache
                    if (cache[3][133]) begin // if it is dirty, we need to write it back to main memory first
                        Mem_WriteData[127:0] = cache[3][127:0];
                        Mem_Addr = {cache[3][132:128], 5'b00000};
                        Mem_ReadOrWrite = 1'b1;
                    end
                    else begin
                        Mem_Addr = Addr;
                        Mem_ReadOrWrite = 1'b0; // if it is not dirty, we do not need to write it back
                    end
                    #1
                    Mem_Addr = Addr;
                    Mem_ReadOrWrite = 1'b0;
                    #1
                    cache[3][134] = 1'b1; // valid now
                    cache[3][133] = 1'b0; // not dirty
                    cache[3][132:128] = CPU_Tag; // tag
                    cache[3][127:0] = Mem_ReadData[127:0]; // load data
                    Reference[2] = 1'b0;
                    Reference[3] = 1'b1; // set LRU
                    if (ReadOrWrite) begin // hit and write second block
                        cache[3][133] = 1'b1; // dirty
                        case (CPU_WordOffSet)
                        2'b00: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[3][127:120] = WriteData[7:0];
                            2'b01: cache[3][119:112] = WriteData[7:0];
                            2'b10: cache[3][111:104] = WriteData[7:0];
                            2'b11: cache[3][103:96] = WriteData[7:0];
                            endcase
                        end
                        2'b01: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[3][95:88] = WriteData[7:0];
                            2'b01: cache[3][87:80] = WriteData[7:0];
                            2'b10: cache[3][79:72] = WriteData[7:0];
                            2'b11: cache[3][71:64] = WriteData[7:0];
                            endcase
                        end
                        2'b10: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[3][63:56] = WriteData[7:0];
                            2'b01: cache[3][55:48] = WriteData[7:0];
                            2'b10: cache[3][47:40] = WriteData[7:0];
                            2'b11: cache[3][39:32] = WriteData[7:0];
                            endcase
                        end
                        2'b11: begin
                            case (CPU_ByteOffSet)
                            2'b00: cache[3][31:24] = WriteData[7:0];
                            2'b01: cache[3][23:16] = WriteData[7:0];
                            2'b10: cache[3][15:8] = WriteData[7:0];
                            2'b11: cache[3][7:0] = WriteData[7:0];
                            endcase
                        end
                        endcase
                    end
                    else begin // hit and read second block
                        case (CPU_WordOffSet)
                        2'b00: ReadData = cache[3][127:96];
                        2'b01: ReadData = cache[3][95:64];
                        2'b10: ReadData = cache[3][63:32];
                        2'b11: ReadData = cache[3][31:0];
                        endcase
                    end
                end
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
