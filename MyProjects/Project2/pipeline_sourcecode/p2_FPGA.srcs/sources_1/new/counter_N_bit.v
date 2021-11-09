module counter_N_bit (clk, /*res,*/ load, D, Q); 
  parameter N = 3; 
  input clk, /*res,*/ load; 
  input [N-1:0] D; 
  output [N-1:0] Q; 
  
  reg [N-1:0] Q;

  always @  (/*posedge res or */posedge clk) 
  begin
    /*if (res == 1'b1) Q <= 0; 
    else*/ if (load == 1'b1) Q <= D; 
    else Q <= Q + 1; 
  end
endmodule 