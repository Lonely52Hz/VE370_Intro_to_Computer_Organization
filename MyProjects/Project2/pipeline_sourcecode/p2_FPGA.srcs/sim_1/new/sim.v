`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 21:38:45
// Design Name: 
// Module Name: sim
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


module sim();
    integer t;
    reg clk;

    pipeline uut(.clk(clk));

    initial begin
        t = 0;
        clk = 0;
    end

    always #10 begin
        $display("==========================================================");
        $display("Time = %d, CLK = %d, PC = 0x%H", t, clk, uut.PCout);
        //$display("Instruction: %H",uut.ID_Instruction);
        //$display("IDEX_MemRead: %H",uut.EX_MemRead);
        //$display("IDEX_RegWrite: %H",uut.EX_RegWrite);
        //$display("IDEX_Rt: %D",uut.EX_Rt);
        //$display("IDEX_Rd: %D",uut.EX_Rd);
        //$display("IFID_Rs: %D",uut.ID_Rs);
        //$display("IFID_Rt: %D",uut.ID_Rt);
        $display("[$s0] = 0x%H, [$s1] = 0x%H, [$s2] = 0x%H", uut.regsiter.regs[16], uut.regsiter.regs[17], uut.regsiter.regs[18]);
        $display("[$s3] = 0x%H, [$s4] = 0x%H, [$s5] = 0x%H", uut.regsiter.regs[19], uut.regsiter.regs[20], uut.regsiter.regs[21]);
        $display("[$s6] = 0x%H, [$s7] = 0x%H, [$t0] = 0x%H", uut.regsiter.regs[22], uut.regsiter.regs[23], uut.regsiter.regs[8]);
        $display("[$t1] = 0x%H, [$t2] = 0x%H, [$t3] = 0x%H", uut.regsiter.regs[9], uut.regsiter.regs[10], uut.regsiter.regs[11]);
        $display("[$t4] = 0x%H, [$t5] = 0x%H, [$t6] = 0x%H", uut.regsiter.regs[12], uut.regsiter.regs[13], uut.regsiter.regs[14]);
        $display("[$t7] = 0x%H, [$t8] = 0x%H, [$t9] = 0x%H", uut.regsiter.regs[15], uut.regsiter.regs[24], uut.regsiter.regs[25]);
        clk = ~clk;
        t = t + 10;
    end
    always #1000 $stop;
endmodule
