`timescale 1ns / 1ps

module SignExtend(in, out);
    input [15:0] in;
    output [31:0] out;

    assign out[15:0] = in[15:0];
    assign out[31:16] = (in[15]) ? 16'b1111111111111111 : 16'b0;

endmodule
