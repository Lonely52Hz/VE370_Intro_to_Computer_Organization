`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 17:16:20
// Design Name: 
// Module Name: Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Memory(ReadOrWrite, Addr, WriteData, ReadData);
    input ReadOrWrite;
    input [9:0] Addr;
    input [127:0] WriteData;
    output [127:0] ReadData;
    integer i;
    reg [31:0] Memory [255:0];

    initial begin
             Memory[0]=32'b10101110001001010010010100110000;
        Memory[1]=32'b11111011111001000001111010100011;
        Memory[2]=32'b11100100111110011100010010010101;
        Memory[3]=32'b10100001100111010011001111010000;
        Memory[4]=32'b11010011000110100101001000010000;
        Memory[5]=32'b01010101001100011111101101100110;
        Memory[6]=32'b11110001001110001000001001011100;
        Memory[7]=32'b01110001011001011010001010001010;
        Memory[8]=32'b10100001111110010110110101011111;
        Memory[9]=32'b11100011001011111101110101010001;
        Memory[10]=32'b00110011101000110110010000100101;
        Memory[11]=32'b10111001100100100011011010000110;
        Memory[12]=32'b11100101101100111001110000011101;
        Memory[13]=32'b11011100100000010100011000101000;
        Memory[14]=32'b01010010101001001010101110111010;
        Memory[15]=32'b11101111011001101111111001010001;
        Memory[16]=32'b10101011111100000001101010010000;
        Memory[17]=32'b00011110011101001000011011100010;
        Memory[18]=32'b10101000100011000010001100111100;
        Memory[19]=32'b10010010100010010101011110000110;
        Memory[20]=32'b11011100111101101000010010010001;
        Memory[21]=32'b11001111000011000110110111010010;
        Memory[22]=32'b11001011010111101111100010100010;
        Memory[23]=32'b00011111011110110100111010011001;
        Memory[24]=32'b10100001111110111111111001111011;
        Memory[25]=32'b10101100000001111101101000110110;
        Memory[26]=32'b01100001100110011010000010110110;
        Memory[27]=32'b11100100110111101001101010110110;
        Memory[28]=32'b00011000011001101001101110001110;
        Memory[29]=32'b10000001101000111101111000101011;
        Memory[30]=32'b11110110001000101001110010110111;
        Memory[31]=32'b00000100111001110101101010100001;
        Memory[32]=32'b01001010100000100101001000100011;
        Memory[33]=32'b01000000111001100100100001000011;
        Memory[34]=32'b11011100110110100010111001101101;
        Memory[35]=32'b01110111001110110010100011111111;
        Memory[36]=32'b00111110100111101011010110001111;
        Memory[37]=32'b00101100101001100000110111100111;
        Memory[38]=32'b00011001100001111101010011001000;
        Memory[39]=32'b00001010000111010100100011101010;
        Memory[40]=32'b00010011001010111101111001011010;
        Memory[41]=32'b00101000110001111001101110000000;
        Memory[42]=32'b10010110010010101000110000111001;
        Memory[43]=32'b11010000010101100001000100000000;
        Memory[44]=32'b10000111011001000110010001101010;
        Memory[45]=32'b00001111000010000000011000011110;
        Memory[46]=32'b11010111000100000101001001011100;
        Memory[47]=32'b01010101010101110011101111101111;
        Memory[48]=32'b11100110101010000001100110011011;
        Memory[49]=32'b10010000110100000010010101010011;
        Memory[50]=32'b01000001011001011000001011101101;
        Memory[51]=32'b00010101011000011100111011110110;
        Memory[52]=32'b01110001100000010001000101100101;
        Memory[53]=32'b01011010101100101011001011010101;
        Memory[54]=32'b00110000101101001001001111011110;
        Memory[55]=32'b00101000011100011011100111010011;
        Memory[56]=32'b11100111111110010110000111100111;
        Memory[57]=32'b00110110010011000101100001011101;
        Memory[58]=32'b10001011100100100011100111010010;
        Memory[59]=32'b11010011111101010011001000001100;
        Memory[60]=32'b11100111110110001111111010000011;
        Memory[61]=32'b01010110010000001101111000111101;
        Memory[62]=32'b01110001000101011010011010101001;
        Memory[63]=32'b10111101010110110011010001111010;
        Memory[64]=32'b01101100101111001110011101110010;
        Memory[65]=32'b00000011001010010110011010000100;
        Memory[66]=32'b10011111001100010100010110110101;
        Memory[67]=32'b11100011011111010010100111011000;
        Memory[68]=32'b01001000000010111001101110000011;
        Memory[69]=32'b00111111101111100010101011111000;
        Memory[70]=32'b01101111001010010101000000100010;
        Memory[71]=32'b11001001100010000000110010010101;
        Memory[72]=32'b00001011001100000100000101110100;
        Memory[73]=32'b10000010100111001001001101111001;
        Memory[74]=32'b11110111001111001101100010101000;
        Memory[75]=32'b00100110111000011000000100000001;
        Memory[76]=32'b10101001111101011100101000000011;
        Memory[77]=32'b11011101001110011101011110010100;
        Memory[78]=32'b01110111000001000111011010000010;
        Memory[79]=32'b01111110000101101101101000011110;
        Memory[80]=32'b01000010010111110010000000001110;
        Memory[81]=32'b01100111110101111100101101100110;
        Memory[82]=32'b10010011111011010000000101010001;
        Memory[83]=32'b01110001000000000001001100011010;
        Memory[84]=32'b01010110011111100101101001011111;
        Memory[85]=32'b00000000010101100111100100001010;
        Memory[86]=32'b10101101110110110001100111100011;
        Memory[87]=32'b11101111100011000110000100000000;
        Memory[88]=32'b01011011000011110110010001111011;
        Memory[89]=32'b00000001010110010011010010001101;
        Memory[90]=32'b11111100110101001101001111100011;
        Memory[91]=32'b10111111001011101110011011100010;
        Memory[92]=32'b10000000100100001100010001010011;
        Memory[93]=32'b01111110101100110110110100111010;
        Memory[94]=32'b10110010010100001100100100011000;
        Memory[95]=32'b10110000100000001011001100010010;
        Memory[96]=32'b11101100101011101110000000110101;
        Memory[97]=32'b11000010101110000010010111101111;
        Memory[98]=32'b01111110011111000100000101110100;
        Memory[99]=32'b01000000110100010110001101110101;
        Memory[100]=32'b11011000001011101111011010001010;
        Memory[101]=32'b01100001000101110101100111010001;
        Memory[102]=32'b00010110001101011011111100111111;
        Memory[103]=32'b10011010010010001101100001110100;
        Memory[104]=32'b00010100110111010011010011110100;
        Memory[105]=32'b10001011011110110001101000010111;
        Memory[106]=32'b11000110110001110001010101101101;
        Memory[107]=32'b00000011001010010011001110001100;
        Memory[108]=32'b11110010100001001000110110011111;
        Memory[109]=32'b10000011000110111011100110001110;
        Memory[110]=32'b01010011000000101101011010110101;
        Memory[111]=32'b10101010110001110011111100011010;
        Memory[112]=32'b00111010101100011110011101000011;
        Memory[113]=32'b11110111011011001001011001011110;
        Memory[114]=32'b01110110001001101010010110101101;
        Memory[115]=32'b00111111110000001011100100101100;
        Memory[116]=32'b00010111101010111111101001011010;
        Memory[117]=32'b00100111000011011011010111111001;
        Memory[118]=32'b01111110110100111010000110010000;
        Memory[119]=32'b01100010011111010110001101010000;
        Memory[120]=32'b11100011110000000011011010111101;
        Memory[121]=32'b01001010111011101011000100011110;
        Memory[122]=32'b10001011001010010101100111011011;
        Memory[123]=32'b01101001110010111101001101110111;
        Memory[124]=32'b00001011010010011111111001101111;
        Memory[125]=32'b01110001000111011001011000111111;
        Memory[126]=32'b00010011001110100011001011001010;
        Memory[127]=32'b11101100011111011110111001111101;
        Memory[128]=32'b11000001101111111010011100000101;
        Memory[129]=32'b11111000101001111010011011100100;
        Memory[130]=32'b00101011001101010101110001001011;
        Memory[131]=32'b00001000111100101100000001001000;
        Memory[132]=32'b00111100010110011100011111010001;
        Memory[133]=32'b11010000111111010010001000001010;
        Memory[134]=32'b10111011011011110011101011000101;
        Memory[135]=32'b00010000011101001100000111010110;
        Memory[136]=32'b11010111111000000010001100101110;
        Memory[137]=32'b10101101010111110010100101101110;
        Memory[138]=32'b00101010010101010101101100001011;
        Memory[139]=32'b01011110100011101101011100110101;
        Memory[140]=32'b11001101110011110000100111101000;
        Memory[141]=32'b01011001110000100111001000001011;
        Memory[142]=32'b11110100000110100101000110111100;
        Memory[143]=32'b11010111011101001101110100110111;
        Memory[144]=32'b01000010100001010101010101100011;
        Memory[145]=32'b00100101010111101000000111100001;
        Memory[146]=32'b11011000101111011011111011011001;
        Memory[147]=32'b01010101100011111001001001101010;
        Memory[148]=32'b01011000000111001110101011101110;
        Memory[149]=32'b11110111010110000010111111011011;
        Memory[150]=32'b00111100101100100000001001101001;
        Memory[151]=32'b10110000101001000000111100110101;
        Memory[152]=32'b00101111101101010100100010101001;
        Memory[153]=32'b11110001100010001011110100110001;
        Memory[154]=32'b01111011010000001000010111011011;
        Memory[155]=32'b11100110101000001000001100001011;
        Memory[156]=32'b11000011011000011100010010011110;
        Memory[157]=32'b11000001110010011100101000111010;
        Memory[158]=32'b01110111110100000001111011111101;
        Memory[159]=32'b10110100110110101100001011101000;
        Memory[160]=32'b01111111011001100000001010000111;
        Memory[161]=32'b00001101111110100101001000011001;
        Memory[162]=32'b00110001001011000000100000111100;
        Memory[163]=32'b00100010001001011111110001001010;
        Memory[164]=32'b00001010110000111000111100011111;
        Memory[165]=32'b01111001111101000101010111101001;
        Memory[166]=32'b10000101111111111111111000000011;
        Memory[167]=32'b11100010000110011110100001010110;
        Memory[168]=32'b11110101010100100101111011101011;
        Memory[169]=32'b01010000010011110110010000000111;
        Memory[170]=32'b00001010000010001000011111001000;
        Memory[171]=32'b00000110100110101011100000111111;
        Memory[172]=32'b10111100110100100000011010010100;
        Memory[173]=32'b10111111011100101011010000111000;
        Memory[174]=32'b10100110000110101010000010110111;
        Memory[175]=32'b00001011110011111100010100001010;
        Memory[176]=32'b00111001011001101011001101010111;
        Memory[177]=32'b11111111000111100000101011010001;
        Memory[178]=32'b11101000110011110111000101101111;
        Memory[179]=32'b01101010011001010000011011101000;
        Memory[180]=32'b10100100000001110101100000010111;
        Memory[181]=32'b01001100110001001100101011101111;
        Memory[182]=32'b00001010101110100111100000001001;
        Memory[183]=32'b10011000001101101101110011001101;
        Memory[184]=32'b11010111111011101101101001111110;
        Memory[185]=32'b10111011010101010101100100101011;
        Memory[186]=32'b00010101101111111011111101010111;
        Memory[187]=32'b00000110110010000110000001000101;
        Memory[188]=32'b10111100000010011100011100101010;
        Memory[189]=32'b00010011011111101111011100001101;
        Memory[190]=32'b11111110000100010110101010100110;
        Memory[191]=32'b00011110011100001011000110000000;
        Memory[192]=32'b01100011011001100110101110010010;
        Memory[193]=32'b00011110001110110001110001001001;
        Memory[194]=32'b00010111110100001111100001001011;
        Memory[195]=32'b11000101100100100011011001010101;
        Memory[196]=32'b01110010000011110000110011001110;
        Memory[197]=32'b11100100110011111100110101101010;
        Memory[198]=32'b00100110000111100011001000010100;
        Memory[199]=32'b10010010110000011011101100011011;
        Memory[200]=32'b10001100010101111110101000010000;
        Memory[201]=32'b10101111011100011101101110101010;
        Memory[202]=32'b11111011001101111011110100111011;
        Memory[203]=32'b11010101100100100010001110101000;
        Memory[204]=32'b10000100101100010011001100100101;
        Memory[205]=32'b11101010111001100110101101001101;
        Memory[206]=32'b01011000100100011100001101101100;
        Memory[207]=32'b00100010110010101111001111110010;
        Memory[208]=32'b01000100101111000000001101110000;
        Memory[209]=32'b01110101010010011001110010001010;
        Memory[210]=32'b01011111010101000100101110010110;
        Memory[211]=32'b01011100010011010010011001100111;
        Memory[212]=32'b00010111111011000001011010011011;
        Memory[213]=32'b01101010111000001000100100001111;
        Memory[214]=32'b10010000001011000010101110001111;
        Memory[215]=32'b01001001011101010100000001010001;
        Memory[216]=32'b00010011010101110001101001100010;
        Memory[217]=32'b00001110110110111011000010111011;
        Memory[218]=32'b00001101111111011101110101101111;
        Memory[219]=32'b11000011101101100101000101110010;
        Memory[220]=32'b10000100100110110101110111000010;
        Memory[221]=32'b11011110101111110110110001010000;
        Memory[222]=32'b11001111011101100100010010010100;
        Memory[223]=32'b00000110010001100100101111010001;
        Memory[224]=32'b11000000111110011001110111101101;
        Memory[225]=32'b10001010011111101110101100111001;
        Memory[226]=32'b01111001001011111101100111111100;
        Memory[227]=32'b01110000010010001111000000011110;
        Memory[228]=32'b01110010000011111101101111100100;
        Memory[229]=32'b10010101011110010001110111110000;
        Memory[230]=32'b11100101110011101011001011111111;
        Memory[231]=32'b11101110100110111110100111000011;
        Memory[232]=32'b11011000010001011111001010100100;
        Memory[233]=32'b11001110011011000111100011010011;
        Memory[234]=32'b11010000111001010011101110011100;
        Memory[235]=32'b01101110110000110011000111100111;
        Memory[236]=32'b10011101001111100111010111011000;
        Memory[237]=32'b00110011111000010110000101011101;
        Memory[238]=32'b00001111010011011110001011101111;
        Memory[239]=32'b11110010101010010001001100000111;
        Memory[240]=32'b00000100000010110001111110111110;
        Memory[241]=32'b00010100100100100111001100111101;
        Memory[242]=32'b10000101111111011111011101011100;
        Memory[243]=32'b10110001010100111001011101101000;
        Memory[244]=32'b01111001001000111001100100010000;
        Memory[245]=32'b00001101010101001011011101010101;
        Memory[246]=32'b11011000100111010100011111000001;
        Memory[247]=32'b01011000000101100011000011101101;
        Memory[248]=32'b11100111100000101100010011100011;
        Memory[249]=32'b11100101011001111110111111110100;
        Memory[250]=32'b10101110011101000111100101010111;
        Memory[251]=32'b01110001000000001010011001100100;
        Memory[252]=32'b00110001110101011011000100100111;
        Memory[253]=32'b01001011111111001101010010100101;
        Memory[254]=32'b00100010110110000110011000111010;
        Memory[255]=32'b01010000000011001000000110011000;
    end

    assign ReadData = {Memory[{Addr[9:4], 2'b00}], Memory[{Addr[9:4], 2'b01}], Memory[{Addr[9:4], 2'b10}], Memory[{Addr[9:4], 2'b11}]};

    always @ (ReadOrWrite) begin
        if (ReadOrWrite) begin
            Memory[{Addr[9:4], 2'b00}] = WriteData[127:96];
            Memory[{Addr[9:4], 2'b01}] = WriteData[95:64];
            Memory[{Addr[9:4], 2'b10}] = WriteData[63:32];
            Memory[{Addr[9:4], 2'b11}] = WriteData[31:0];
        end
    end
endmodule
