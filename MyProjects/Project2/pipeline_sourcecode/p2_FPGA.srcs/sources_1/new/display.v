module display (clk, sw_clk, sw5, sw4, sw3, sw2, sw1, sw0, sw_sel, AN0, AN1, AN2, AN3, CA, CB, CC, CD, CE, CF, CG);
  input clk, sw_clk, sw5, sw4, sw3, sw2, sw1, sw0, sw_sel;
  output AN0, AN1, AN2, AN3, CA, CB, CC, CD, CE, CF, CG;
  
  reg CA, CB, CC, CD, CE, CF, CG;
  reg [31:0] DisplayData;
  
  wire clk_500;
  wire [3:0] Anode;
  wire [4:0] ReadRegEx;
  wire [6:0] Cathode0, Cathode1, Cathode2, Cathode3, Cathode4, Cathode5, Cathode6, Cathode7;
  wire [31:0] ReadDataEx, PCout;
  
  assign AN3 = ~Anode[3];
  assign AN2 = ~Anode[2];
  assign AN1 = ~Anode[1];
  assign AN0 = ~Anode[0];
  
  assign ReadRegEx[0] = sw0;
  assign ReadRegEx[1] = sw1;
  assign ReadRegEx[2] = sw2;
  assign ReadRegEx[3] = sw3;
  assign ReadRegEx[4] = sw4;
  
  divider divider_to_500hz (clk, clk_500);
  ring_counter_4bit ring (clk_500, Anode);
  pipeline pcpu (sw_clk, ReadRegEx, PCout, ReadDataEx);
  SSD ssd0 (DisplayData[3:0], Cathode0);
  SSD ssd1 (DisplayData[7:4], Cathode1);
  SSD ssd2 (DisplayData[11:8], Cathode2);
  SSD ssd3 (DisplayData[15:12], Cathode3);
  SSD ssd4 (DisplayData[19:16], Cathode4);
  SSD ssd5 (DisplayData[23:20], Cathode5);
  SSD ssd6 (DisplayData[27:24], Cathode6);
  SSD ssd7 (DisplayData[31:28], Cathode7);
  
  always @ (sw5) begin
    case (sw5)
      1'b0: DisplayData <= ReadDataEx;
      1'b1: DisplayData <= PCout;
    endcase
  end
  
  always @ (AN0 or AN1 or AN2 or AN3 or sw_clk or sw5 or sw4 or sw3 or sw2 or sw1 or sw0 or sw_sel) begin
    if (sw_sel == 0) begin
      if (AN3 == 0) begin
        //AN0 = 1;
        CA = Cathode3[6];
        CB = Cathode3[5];
        CC = Cathode3[4];
        CD = Cathode3[3];
        CE = Cathode3[2];
        CF = Cathode3[1];
        CG = Cathode3[0];
      end
      else if (AN2 == 0) begin
        //AN0 = 1;
        CA = Cathode2[6];
        CB = Cathode2[5];
        CC = Cathode2[4];
        CD = Cathode2[3];
        CE = Cathode2[2];
        CF = Cathode2[1];
        CG = Cathode2[0];
      end
      else if (AN1 == 0) begin
        //AN0 = 1;
        CA = Cathode1[6];
        CB = Cathode1[5];
        CC = Cathode1[4];
        CD = Cathode1[3];
        CE = Cathode1[2];
        CF = Cathode1[1];
        CG = Cathode1[0];
      end
      else begin
        //AN0 = 0;
        CA = Cathode0[6];
        CB = Cathode0[5];
        CC = Cathode0[4];
        CD = Cathode0[3];
        CE = Cathode0[2];
        CF = Cathode0[1];
        CG = Cathode0[0];
      end
    end
    else if (sw_sel == 1) begin
      if (AN3 == 0) begin
        //AN0 = 1;
        CA = Cathode7[6];
        CB = Cathode7[5];
        CC = Cathode7[4];
        CD = Cathode7[3];
        CE = Cathode7[2];
        CF = Cathode7[1];
        CG = Cathode7[0];
      end
      else if (AN2 == 0) begin
        //AN0 = 1;
        CA = Cathode6[6];
        CB = Cathode6[5];
        CC = Cathode6[4];
        CD = Cathode6[3];
        CE = Cathode6[2];
        CF = Cathode6[1];
        CG = Cathode6[0];
      end
      else if (AN1 == 0) begin
        //AN0 = 1;
        CA = Cathode5[6];
        CB = Cathode5[5];
        CC = Cathode5[4];
        CD = Cathode5[3];
        CE = Cathode5[2];
        CF = Cathode5[1];
        CG = Cathode5[0];
      end
      else begin
        //AN0 = 0;
        CA = Cathode4[6];
        CB = Cathode4[5];
        CC = Cathode4[4];
        CD = Cathode4[3];
        CE = Cathode4[2];
        CF = Cathode4[1];
        CG = Cathode4[0];
      end
    end
  end
endmodule