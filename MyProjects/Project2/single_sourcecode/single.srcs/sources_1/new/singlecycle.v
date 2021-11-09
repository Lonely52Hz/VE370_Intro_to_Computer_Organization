`timescale 1ns / 1ps

module singlecycle(clk);
    input clk;
    wire [31:0] instruction, pcin, pcout, pc4, jumpaddr, branchaddr, tempaddr,
                regreaddata1, regreaddata2, writedata, extend, ALUsec, ALUresult, memreaddata;
    wire [4:0] writereg;
    wire [3:0] ALUcontrol;
    wire [1:0] ALUop;
    wire regwrite, ALUSrc, branch, jump, beq, bne, regdst, memtoreg, memread, memwrite, ALUzero;

    PC pc (
        clk, pcin, pcout
    );

    assign pc4 = pcout + 4;

    InstructionMemory im (
        pcout, instruction
    );

    assign branchaddr = pc4 + (extend << 2);
    assign branch = (ALUzero & beq) | (~ALUzero & bne);
    MUX2_1 temppc(pc4, branchaddr, tempaddr, branch);
    assign jumpaddr = {pc4[31:28], instruction[25:0], 2'b0};
    MUX2_1 finalpc(tempaddr, jumpaddr, pcin, jump);

    Control  control(
        instruction[31:26],
        regdst, jump,
        beq, bne,
        memread, memwrite,
        memtoreg, ALUSrc,
        regwrite, ALUop
    );

    assign writereg = (regdst) ? instruction[15:11] : instruction[20:16];

    Register regs(
        clk, regwrite,
        instruction[25:21], instruction[20:16],
        writereg, writedata,
        regreaddata1, regreaddata2
    );

    SignExtend signextend(
        instruction[15:0], extend
    );

    ALUcontrol alucon(
        ALUop, instruction[5:0], ALUcontrol
    );

    MUX2_1 ALUMUX(regreaddata2, extend, ALUsec, ALUSrc);

    ALU alu(
        ALUcontrol,
        regreaddata1, ALUsec,
        ALUzero, ALUresult
    );

    MUX2_1 daALU(ALUresult, memreaddata, writedata, memtoreg);

    DataMemory dm(
        clk, ALUresult,
        memread, memwrite,
        regreaddata2, memreaddata
    );

endmodule
