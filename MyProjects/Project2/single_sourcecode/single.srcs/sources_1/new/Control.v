`timescale 1ns / 1ps

module Control(opcode, regdst, jump, beq, bne, memread, memwrite, memtoreg, ALUSrc, regwrite, ALUop);
    input [5:0] opcode;
    output reg regdst, jump, beq, bne, memread, memtoreg, memwrite, ALUSrc, regwrite;
    output reg [1:0] ALUop;

    initial begin
        regdst = 1'b0;
        jump = 1'b0;
        beq = 1'b0;
        bne = 1'b0;
        memread = 1'b0;
        memtoreg = 1'b0;
        memwrite = 1'b0;
        ALUSrc = 1'b0;
        regwrite = 1'b0;
        ALUop = 2'b00;
    end

    always @ (opcode) begin
        case (opcode)
            6'b100011: begin // lw
                regdst = 1'b0;
                jump = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                memread = 1'b1;
                memtoreg = 1'b1;
                memwrite = 1'b0;
                ALUSrc = 1'b1;
                regwrite = 1'b1;
                ALUop = 2'b00;
            end
            6'b101011: begin // sw
                regdst = 1'b0;
                jump = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                memwrite = 1'b1;
                ALUSrc = 1'b1;
                regwrite = 1'b0;
                ALUop = 2'b00;
            end
            6'b000000: begin // add, sub, and, or, slt
                regdst = 1'b1;
                jump = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                memwrite = 1'b0;
                ALUSrc = 1'b0;
                regwrite = 1'b1;
                ALUop = 2'b10;
            end
            6'b001000: begin // addi
                regdst = 1'b0;
                jump = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                memwrite = 1'b0;
                ALUSrc = 1'b1;
                regwrite = 1'b1;
                ALUop = 2'b00;
            end
            6'b001100: begin // andi
                regdst = 1'b0;
                jump = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                memwrite = 1'b0;
                ALUSrc = 1'b1;
                regwrite = 1'b1;
                ALUop = 2'b11;
            end
            6'b000100: begin // beq
                regdst = 1'b1;
                jump = 1'b0;
                beq = 1'b1;
                bne = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                memwrite = 1'b0;
                ALUSrc = 1'b0;
                regwrite = 1'b0;
                ALUop = 2'b01;
            end
            6'b000101: begin // bne
                regdst = 1'b1;
                jump = 1'b0;
                beq = 1'b0;
                bne = 1'b1;
                memread = 1'b0;
                memtoreg = 1'b0;
                memwrite = 1'b0;
                ALUSrc = 1'b0;
                regwrite = 1'b0;
                ALUop = 2'b01;
            end
            6'b000010: begin // j-type
                regdst = 1'b1;
                jump = 1'b1;
                beq = 1'b0;
                bne = 1'b0;
                memread = 1'b0;
                memtoreg = 1'b0;
                memwrite = 1'b0;
                ALUSrc = 1'b0;
                regwrite = 1'b0;
                ALUop = 2'b00;
            end
        endcase
    end

endmodule
