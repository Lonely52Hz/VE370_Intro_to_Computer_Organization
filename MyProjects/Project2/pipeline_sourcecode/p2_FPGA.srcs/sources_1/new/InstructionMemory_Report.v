`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 16:34:07
// Design Name: 
// Module Name: InstructionMemory_Report
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


module InstructionMemory_Report(address, instruction);
    input [31:0] address;
    output [31:0] instruction;
    reg [31:0] memory [0:20];

    initial begin
        memory[0]=32'b00100000000010000000000000100000; //addi $t0, $zero, 0x20 (LOOP3)
        memory[1]=32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
        memory[2]=32'b00000001000010011000000000100100; //and $s0, $t0, $t1
        memory[3]=32'b00000001000010011000000000100101; //or $s0, $t0, $t1
        memory[4]=32'b10101100000100000000000000000100; //sw $s0, 4($zero)
        memory[5]=32'b10001100000100010000000000000100; //lw $s1, 4($zero)
        memory[6]=32'b00000001001010000101100000100000; //add $t3, $t1, $t0
        memory[7]=32'b00000001001010000101100000100010; //sub $t3, $t1, $t0
        memory[8]=32'b00110001000010110000000000110111; //andi $t3, $t0, 0x37
        memory[9]=32'b00000001000010010101100000101010; //slt $t3, $t0, $t1
        memory[10]=32'b00010001000010000000000000000100; //beq $t0, $t0, LOOP1
        memory[11]=32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
        memory[12]=32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
        memory[13]=32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
        memory[14]=32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
        memory[15]=32'b00010101000010010000000000000100; //bne $t0, $t1, LOOP2 (LOOP1)
        memory[16]=32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
        memory[17]=32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
        memory[18]=32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
        memory[19]=32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
        memory[20]=32'b00001000000000000000000000000000; //j LOOP3 (LOOP2)  
    end

    assign instruction = memory[address >> 2];
        
endmodule
