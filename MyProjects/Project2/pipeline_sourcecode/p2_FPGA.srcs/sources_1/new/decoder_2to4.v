module decoder_2to4 (/*res,*/ w0, w1, y0, y1, y2, y3);
  input /*res,*/ w0, w1;
  output y0, y1, y2, y3;
  
  reg y0, y1, y2, y3;
  
  always @ (w0, w1)
  begin
    /*if (res == 1)
    begin
      y0 = 1;
      y1 = 1;
      y2 = 0;
      y3 = 0;
    end
    else*/ if ((w0 == 0)&(w1 == 0))
    begin
      y0 = 1;
      y1 = 0;
      y2 = 0;
      y3 = 0;
    end
    else if ((w0 == 1)&(w1 == 0))
    begin
      y0 = 0;
      y1 = 1;
      y2 = 0;
      y3 = 0;
    end
    else if ((w0 == 0)&(w1 == 1))
    begin
      y0 = 0;
      y1 = 0;
      y2 = 1;
      y3 = 0;
    end
    else if ((w0 == 1)&(w1 == 1))
    begin
      y0 = 0;
      y1 = 0;
      y2 = 0;
      y3 = 1;
    end
  end
endmodule