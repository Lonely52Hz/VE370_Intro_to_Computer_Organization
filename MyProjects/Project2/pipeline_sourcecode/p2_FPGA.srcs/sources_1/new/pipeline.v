`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/31 20:37:41
// Design Name: 
// Module Name: pipeline
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


module pipeline(clk, ReadRegEx, PCout, ReadDataEx);
    input clk;
    input [4:0] ReadRegEx;
    output [31:0] PCout, ReadDataEx;

    wire [31:0] IF_PCIn, IF_PCOut, IF_PC4, IF_PCTemp, IF_Instruction,
                ID_PC4, ID_BAddr, ID_JAddr, ID_Extend, ID_Instruction, ID_RegReadData1Temp, 
                ID_RegReadData2Temp, ID_RegReadData1, ID_RegReadData2,
                EX_RegReadData1, EX_RegReadData2, EX_ALUInUpper, EX_ALUInLowerTemp,
                EX_ALUInLower, EX_Extend, EX_ALUResult,
                MEM_RegReadData, MEM_ALUResult, MEM_WriteData, MEM_ReadData,
                WB_WriteBack, WB_MemReadData, WB_ALUResult;

    wire [4:0] ID_Rs, ID_Rt, ID_Rd,
               EX_Rs, EX_Rt, EX_Rd, EX_FinalReg,
               MEM_Register,
               WB_Register;

    wire [3:0] EX_ALUControl;

    wire [1:0] FW_Comparator1, FW_Comparator2, FW_ALU1, FW_ALU2,
               ID_ALUOp,
               EX_ALUOp;

    wire FW_MemSel,
         PC_Write, IFID_Write, IFID_Flush, IDEX_Flush,
         IF_PCsel,
         ID_Branch, ID_Beq, ID_Bne, ID_Jump, ID_RegWrite, ID_MemToReg,
         ID_MemWrite, ID_MemRead, ID_RegDst, ID_ALUSrc, ID_Comparator,
         EX_RegWrite, EX_MemWrite, EX_MemRead, EX_MemToReg, EX_RegDst, EX_ALUSrc, EX_Zero,
         MEM_RegWrite, MEM_MemToReg, MEM_MemRead, MEM_MemWrite,
         WB_RegWrite, WB_MemToReg, WB_MemRead;

    //IF
    assign IF_PC4 = IF_PCOut + 4;
    assign IF_PCTemp = (ID_Branch) ? ID_BAddr : ID_JAddr;
    assign IF_PCIn = (IF_PCsel) ? IF_PCTemp : IF_PC4;
    assign PCout = IF_PCOut;


    //ID
    assign ID_Rs = ID_Instruction[25:21];
    assign ID_Rt = ID_Instruction[20:16];
    assign ID_Rd = ID_Instruction[15:11];
    assign ID_Comparator = (ID_RegReadData1 == ID_RegReadData2) ? 1'b1 : 1'b0;
    assign ID_JAddr = {ID_PC4[31:28], ID_Instruction[25:0], 2'b0};
    assign ID_BAddr = ID_PC4 + (ID_Extend << 2);

    //EX
    assign EX_FinalReg = (EX_RegDst) ? EX_Rd : EX_Rt;
    assign EX_ALUInLower = (EX_ALUSrc) ? EX_Extend : EX_ALUInLowerTemp;

    //MEM
    assign MEM_WriteData = (FW_MemSel) ? WB_WriteBack : MEM_RegReadData;

    //WB
    assign WB_WriteBack = (WB_MemToReg) ? WB_MemReadData : WB_ALUResult;

    //IF
    PC pc(
        clk, PC_Write,
        IF_PCIn, IF_PCOut
    );
    
    InstructionMemory_Bonus im(
        IF_PCOut, IF_Instruction
    );

    //IFID
    IFID ifid(
        .clk(clk), .write(IFID_Write), .flush(IFID_Flush),
        .IF_PC4(IF_PC4), .ID_PC4(ID_PC4),
        .IF_Instruction(IF_Instruction), .ID_Instruction(ID_Instruction)
    );

    //ID
    Control ctrl(
        .opcode(ID_Instruction[31:26]), .regdst(ID_RegDst), .comparator(ID_Comparator),
        .beq(ID_Beq), .bne(ID_Bne), .jump(ID_Jump), .branch(ID_Branch),
        .memread(ID_MemRead), .memwrite(ID_MemWrite),
        .memtoreg(ID_MemToReg), .ALUSrc(ID_ALUSrc),
        .regwrite(ID_RegWrite), .ALUop(ID_ALUOp),
        .IF_PCsel(IF_PCsel)
    );

    Register regsiter(
        clk, WB_RegWrite,
        ID_Rs, ID_Rt,
        WB_Register, WB_WriteBack,
        ID_RegReadData1Temp, ID_RegReadData2Temp,
        ReadRegEx, ReadDataEx
    );
    
    SignExtend signextend(
        ID_Instruction[15:0], ID_Extend
    );

    MUX3 comparatorupper(
        .sel(FW_Comparator1),
        .in1(ID_RegReadData1Temp), .in2(WB_WriteBack), .in3(MEM_ALUResult),
        .out(ID_RegReadData1)
    );

    MUX3 comparatorlower(
        .sel(FW_Comparator2),
        .in1(ID_RegReadData2Temp), .in2(WB_WriteBack), .in3(MEM_ALUResult),
        .out(ID_RegReadData2)
    );
    
    //IDEX
    IDEX idex(
        .clk(clk), .flush(IDEX_Flush),
        .ID_MemToReg(ID_MemToReg), .EX_MemToReg(EX_MemToReg),
        .ID_RegWrite(ID_RegWrite), .EX_RegWrite(EX_RegWrite),
        .ID_MemRead(ID_MemRead), .EX_MemRead(EX_MemRead),
        .ID_MemWrite(ID_MemWrite), .EX_MemWrite(EX_MemWrite),
        .ID_ALUOp(ID_ALUOp), .EX_ALUOp(EX_ALUOp),
        .ID_RegDst(ID_RegDst), .EX_RegDst(EX_RegDst),
        .ID_ALUSrc(ID_ALUSrc), .EX_ALUSrc(EX_ALUSrc),
        .ID_RegReadData1(ID_RegReadData1Temp), .EX_RegReadData1(EX_RegReadData1),
        .ID_RegReadData2(ID_RegReadData2Temp), .EX_RegReadData2(EX_RegReadData2),
        .ID_Extend(ID_Extend), .EX_Extend(EX_Extend),
        .ID_Rs(ID_Rs), .EX_Rs(EX_Rs),
        .ID_Rd(ID_Rd), .EX_Rd(EX_Rd),
        .ID_Rt(ID_Rt), .EX_Rt(EX_Rt)
    );

    //EX
    MUX3 upperalu(
        .sel(FW_ALU1),
        .in1(EX_RegReadData1), .in2(WB_WriteBack), .in3(MEM_ALUResult),
        .out(EX_ALUInUpper)
    );

    MUX3 loweralu(
        .sel(FW_ALU2),
        .in1(EX_RegReadData2), .in2(WB_WriteBack), .in3(MEM_ALUResult),
        .out(EX_ALUInLowerTemp)
    );

    ALUControl alucontrol(
        EX_ALUOp, EX_Extend[5:0], EX_ALUControl
    );

    ALU alu(
        .control(EX_ALUControl),
        .in1(EX_ALUInUpper), .in2(EX_ALUInLower),
        .result(EX_ALUResult), .zero(EX_Zero)
    );

    //EXMEM
    EXMEM exmem(
        .clk(clk),
        .EX_MemToReg(EX_MemToReg), .MEM_MemToReg(MEM_MemToReg),
        .EX_RegWrite(EX_RegWrite), .MEM_RegWrite(MEM_RegWrite),
        .EX_MemRead(EX_MemRead), .MEM_MemRead(MEM_MemRead),
        .EX_MemWrite(EX_MemWrite), .MEM_MemWrite(MEM_MemWrite),
        .EX_ALUResult(EX_ALUResult), .MEM_ALUResult(MEM_ALUResult),
        .EX_RegReadData2(EX_ALUInLowerTemp), .MEM_RegReadData2(MEM_RegReadData),
        .EX_FinalReg(EX_FinalReg), .MEM_FinalReg(MEM_Register)
    );

    //MEM
    DataMemory dm(
        .clk(clk),
        .memread(MEM_MemRead), .memwrite(MEM_MemWrite),
        .address(MEM_ALUResult), .writedata(MEM_WriteData),
        .readdata(MEM_ReadData)
    );

    //MEMWB
    MEMWB memwb(
        .clk(clk),
        .MEM_RegWrite(MEM_RegWrite), .WB_RegWrite(WB_RegWrite),
        .MEM_MemToReg(MEM_MemToReg), .WB_MemToReg(WB_MemToReg),
        .MEM_ReadData(MEM_ReadData), .WB_MemReadData(WB_MemReadData),
        .MEM_ALUResult(MEM_ALUResult), .WB_ALUResult(WB_ALUResult),
        .MEM_RegisterRd(MEM_Register), .WB_RegisterRd(WB_Register)
    );

    //WB

    //forwarding
    Forwarding forwarding(
        .IFID_Rt(ID_Rt), .IFID_Rs(ID_Rs),
        .IFID_Op(ID_Instruction[31:26]),
        .IDEX_Rs(EX_Rs), .IDEX_Rt(EX_Rt),
        .EXMEM_Rd(MEM_Register), .EXMEM_RegWrite(MEM_RegWrite),
        .EXMEM_MemWrite(MEM_MemWrite),
        .MEMWB_Rd(WB_Register), .MEMWB_MemRead(WB_MemRead),
        .MEMWB_RegWrite(WB_RegWrite),
        .Mux5c(FW_Comparator1), .Mux7c(FW_Comparator2),
        .Mux10c(FW_ALU1), .Mux11c(FW_ALU2),
        .Mux12c(FW_MemSel), .IDEX_MemWrite(EX_MemWrite)
    );

    //hazard
    HazardDetection hd(
        .IFID_Rs(ID_Rs), .IFID_Rt(ID_Rt),
        .IFID_Op(ID_Instruction[31:26]),
        .IDEX_Rd(EX_FinalReg), .IDEX_Rt(EX_Rt),
        .EXMEM_Rd(MEM_Register), .IDEX_MemRead(EX_MemRead),
        .IDEX_RegWrite(EX_RegWrite), .EXMEM_MemRead(MEM_MemRead),
        .IF_PCsel(IF_PCsel), .PC_Write(PC_Write), .IFID_Write(IFID_Write),
        .IFID_Flush(IFID_Flush), .IDEX_Flush(IDEX_Flush)
    );

endmodule
