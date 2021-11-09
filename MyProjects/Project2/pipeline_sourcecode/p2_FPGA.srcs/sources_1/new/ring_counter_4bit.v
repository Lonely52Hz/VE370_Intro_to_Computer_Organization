module ring_counter_4bit (clk, /*res,*/ Q);
  input clk/*, res*/;
  output [3: 0] Q;
  
  wire load;
  wire [1: 0] D, Out;
  
  assign load = 0;
  assign D = 2'b0;
  counter_N_bit #2 counter_2bit (clk, /*res,*/ load, D, Out);
  decoder_2to4 decoder (/*res,*/ Out[0], Out[1], Q[0], Q[1], Q[2], Q[3]);
endmodule