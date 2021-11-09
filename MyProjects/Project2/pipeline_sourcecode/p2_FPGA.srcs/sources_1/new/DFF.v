module DFF (clk, D, /*res,*/ Q);
  input clk, D/*, res*/;
  output Q;
  
  reg Q;
  
  always @ (posedge clk /*or posedge res*/)
  begin
    /*if (res == 1) Q <= 0;
    else*/ Q <= D;
  end
endmodule