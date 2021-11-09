`timescale 1ns / 1ps

module MUX2_1(in1, in2, out, sel);
    input [31:0] in1, in2;
    input sel;
    output reg [31:0] out;

    always @ (*) begin
        if (sel) begin
            out = in2;
        end
        else begin
            out = in1;
        end
    end
    
endmodule
