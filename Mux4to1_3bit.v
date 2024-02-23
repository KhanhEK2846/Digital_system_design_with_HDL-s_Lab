module Mux4to1_3bit(x,y,z,w,c,o);
input [2:0]x,y,z,w;
input [1:0]c;
output [2:0]o;
	assign	o =	(c == 2'b00)?x:
			(c == 2'b01)?y:
			(c == 2'b10)?z:
			(c == 2'b11)?w:
			1'bx;
endmodule
