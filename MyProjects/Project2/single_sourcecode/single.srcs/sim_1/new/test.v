`timescale 1ns / 1ps

module test();
    reg clk;
    integer t;
    singlecycle uut(.clk(clk));

    initial begin
        clk = 0;
        t = 0;
    end

    always #10 begin
        $display("==========================================================");
        $display("Time: %d, CLK = %d, PC = 0x%H", t, clk, uut.pcout);
        $display("[$s0] = 0x%H, [$s1] = 0x%H, [$s2] = 0x%H", uut.regs.regs[16], uut.regs.regs[17], uut.regs.regs[18]);
        $display("[$s3] = 0x%H, [$s4] = 0x%H, [$s5] = 0x%H", uut.regs.regs[19], uut.regs.regs[20], uut.regs.regs[21]);
        $display("[$s6] = 0x%H, [$s7] = 0x%H, [$t0] = 0x%H", uut.regs.regs[22], uut.regs.regs[23], uut.regs.regs[8]);
        $display("[$t1] = 0x%H, [$t2] = 0x%H, [$t3] = 0x%H", uut.regs.regs[9], uut.regs.regs[10], uut.regs.regs[11]);
        $display("[$t4] = 0x%H, [$t5] = 0x%H, [$t6] = 0x%H", uut.regs.regs[12], uut.regs.regs[13], uut.regs.regs[14]);
        $display("[$t7] = 0x%H, [$t8] = 0x%H, [$t9] = 0x%H", uut.regs.regs[15], uut.regs.regs[24], uut.regs.regs[25]);
        clk = ~clk;
        t = t + 10;
    end
    always #1000 $stop;
endmodule
