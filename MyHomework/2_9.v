module ALU(ainvert, bnegate, operation, a, b, result, zero, overflow)
    input [31:0] a, b;
    input ainvert, bnegate;
    input [1:0] operation;
    output [31:0] result;
    output zero, overflow;
    wire [32:0] sum;
    wire t;
    reg [31:0] result, ta, tb;
    always @ (ainvert or a)
    begin
        if (ainvert == 1) ta = ~a;
        else ta = a;
    end
    always @ (bnegate or b)
    begin
        if(bnegate == 1) tb = ~b + 1;
        else tb = b;
    end
    assign sum = ta + tb;
    always @ (ainvert or bnegate or operation or a or b)
    begin
        case (operation)
        2'b00: result = ta & tb;
        2'b01: result = ta | tb;
        2'b10: result = sum[31:0];
        2'b11:
        begin
            if (sum[31] == 0) result = 32'b0;
            else result = {31'b0, 1'b1};
        end
        endcase
    end
    assign t = (result == 32'b0);
    assign overflow = sum[32];
    assign zero = t;
endmodule