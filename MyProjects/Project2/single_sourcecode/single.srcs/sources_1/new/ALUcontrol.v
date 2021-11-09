`timescale 1ns / 1ps

module ALUcontrol(ALUop, funcode, control);
    input [1:0] ALUop;
    input [5:0] funcode;
    output reg [3:0] control;

    always @(ALUop or funcode) begin
        case (ALUop)
            2'b00:  control = 4'b0010;
            2'b01: control = 4'b0110;
            2'b10:
                case (funcode) 
                    6'b100000: control = 4'b0010;
                    6'b100010: control = 4'b0110;
                    6'b100100: control = 4'b0000;
                    6'b100101: control = 4'b0001;
                    6'b101010: control = 4'b0111;
                endcase
            2'b11: control = 4'b0000;
        endcase
    end

endmodule
