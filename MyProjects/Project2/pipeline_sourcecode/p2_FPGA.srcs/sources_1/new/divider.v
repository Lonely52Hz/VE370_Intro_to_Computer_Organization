module divider (clk, /*res,*/ clk_500);
  input clk/*, res*/;
  output clk_500;
  
  wire [17: 0] D, Q;
  wire and_o;
  
  assign D = 18'b0;
  assign and_o = Q[17]&Q[16]&Q[11]&Q[10]&Q[8]&Q[5]&Q[4]&Q[3]&Q[2]&Q[1]&Q[0];
  
  counter_N_bit #18 counter_18bit (clk, /*res,*/ and_o, D, Q); 
  DFF dff (clk, and_o, /*res,*/ clk_500);
endmodule