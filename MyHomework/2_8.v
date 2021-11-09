module datamemory (rdata, addr, wdata, memwrite, memread);
    input [31:0] addr, wdata;
    input memwrite, memread;
    output [31:0] rdata;

endmodule