module datamemory (rdata, addr, wdata, memwrite, memread);
    input [31:0] addr, wdata;
    input memwrite, memread;
    output [31:0] rdata;

    reg [31:0] rdata;
    reg [31:0] mem[*****:0];

    always @ (addr, wdata, memwrite, memread)
    begin
        if (memwrite == 1) mem[addr] = wdata;
        else if (memread == 1) rdata = mem[addr];
    end
endmodule