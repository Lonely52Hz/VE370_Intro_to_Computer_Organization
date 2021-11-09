`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 17:47:35
// Design Name: 
// Module Name: Forwarding
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


module Forwarding(IFID_Rt,IFID_Rs,IFID_Op,IDEX_Rs,IDEX_Rt,EXMEM_Rd,EXMEM_RegWrite,EXMEM_MemWrite,
                  MEMWB_Rd,MEMWB_MemRead,MEMWB_RegWrite,Mux5c,Mux7c,Mux10c,Mux11c,Mux12c,IDEX_MemWrite);
                    
        input   [5:0]   IFID_Op;
        input   [4:0]   IFID_Rt,IFID_Rs;       
        input   [4:0]   IDEX_Rs,IDEX_Rt;
        input   [4:0]   EXMEM_Rd,MEMWB_Rd;
        input           EXMEM_RegWrite,EXMEM_MemWrite,IDEX_MemWrite,
                        MEMWB_MemRead,MEMWB_RegWrite;
                        
        output  [1:0]   Mux5c,Mux7c,Mux10c,Mux11c;
        output     Mux12c;
        
        reg     [1:0]    Mux5c,Mux7c,Mux10c,Mux11c;
        reg        Mux12c;
        
		initial begin
			Mux5c = 2'b00;
			Mux7c = 2'b00;
			Mux10c = 2'b00;
			Mux11c = 2'b00;
			Mux12c = 1'b0;
		end

        always @(*)
    begin
		//Data Hazard
		if (EXMEM_RegWrite == 1 && EXMEM_Rd != 0 && EXMEM_Rd == IDEX_Rs)
			Mux10c = 2'b10;
		else if (MEMWB_RegWrite == 1 && MEMWB_Rd != 0 && MEMWB_Rd == IDEX_Rs)
			Mux10c = 2'b01;
		else
			Mux10c = 2'b00;
		
		if (EXMEM_RegWrite == 1 && EXMEM_Rd != 0 && EXMEM_Rd == IDEX_Rt)
			Mux11c = 2'b10;
		else if (MEMWB_RegWrite == 1 && MEMWB_Rd != 0 && MEMWB_Rd == IDEX_Rt)
			Mux11c = 2'b01;
		else
			Mux11c = 2'b00;

		//Control Hazard
		if ((IFID_Op == 6'b000100 || IFID_Op == 6'b000101) && EXMEM_RegWrite == 1 && EXMEM_Rd != 0 && EXMEM_Rd == IFID_Rs)
			Mux5c = 2'b10;
		else if ((IFID_Op == 6'b000100 || IFID_Op == 6'b000101) && MEMWB_RegWrite == 1 && MEMWB_Rd != 0 && MEMWB_Rd == IFID_Rs && MEMWB_MemRead == 1)
			Mux5c = 2'b01;
		else
			Mux5c = 2'b00;

		if ((IFID_Op == 6'b000100 || IFID_Op == 6'b000101) && EXMEM_RegWrite == 1 && EXMEM_Rd != 0 && EXMEM_Rd == IFID_Rt)
			Mux7c = 2'b10;
		else if ((IFID_Op == 6'b000100 || IFID_Op == 6'b000101) && MEMWB_RegWrite == 1 && MEMWB_Rd != 0 && MEMWB_Rd == IFID_Rt && MEMWB_MemRead == 1)
			Mux7c = 2'b01;
		else
			Mux7c = 2'b00;
			
		//Memory Hazard
        if (EXMEM_MemWrite == 1 && MEMWB_MemRead == 1 && MEMWB_Rd == EXMEM_Rd && MEMWB_Rd != 0)
            Mux12c = 1'b1;
		else
			Mux12c = 1'b0;
    end
endmodule
