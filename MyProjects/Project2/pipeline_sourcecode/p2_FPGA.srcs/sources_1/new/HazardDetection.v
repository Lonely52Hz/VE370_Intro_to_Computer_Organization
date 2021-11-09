`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 17:51:08
// Design Name: 
// Module Name: HazardDetection
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


module HazardDetection(IFID_Rs,IFID_Rt,IFID_Op,IDEX_Rd,IDEX_Rt,EXMEM_Rd,IDEX_MemRead,IDEX_RegWrite,EXMEM_MemRead,IF_PCsel,
                       PC_Write,IFID_Write,IFID_Flush,IDEX_Flush);
                       
    input   [4:0]   IFID_Rs,IFID_Rt,IDEX_Rd,IDEX_Rt,EXMEM_Rd;
    input   [5:0]   IFID_Op;
    input           IDEX_MemRead,IDEX_RegWrite,EXMEM_MemRead,IF_PCsel;
    
    output          PC_Write,IFID_Write,IFID_Flush,IDEX_Flush;
    reg            PC_Write,IFID_Write,IDEX_Flush;
    
    initial begin
        PC_Write = 1;
        IFID_Write = 1;
		IDEX_Flush = 0;
    end

    always @ (*) begin
		if (  //the bne, beq, load-use case should all be solved!!!
		    (IDEX_MemRead == 1 && (IDEX_Rd == IFID_Rs || IDEX_Rd == IFID_Rt) && IDEX_Rd != 0) ||  //load-use Hazard
		    ((IFID_Op[5:0] == 6'b000100 || IFID_Op == 6'b000101) && (EXMEM_MemRead == 1 && (EXMEM_Rd == IFID_Rs || EXMEM_Rd == IFID_Rt) && EXMEM_Rd != 0)) || //load-nop-branch structure
		    ((IFID_Op[5:0] == 6'b000100 || IFID_Op == 6'b000101) && (IDEX_RegWrite == 1 && (IDEX_Rd == IFID_Rs || IDEX_Rd == IFID_Rt) && IDEX_Rd != 0))     //load-branch 0r Rtype-branch
		    )
		begin
			IDEX_Flush = 1;
			PC_Write = 0;
            IFID_Write = 0;
		end
        else begin
            PC_Write = 1;
            IFID_Write = 1;
		    IDEX_Flush = 0;
        end
    end

    assign IFID_Flush = IF_PCsel && IFID_Write;

endmodule
