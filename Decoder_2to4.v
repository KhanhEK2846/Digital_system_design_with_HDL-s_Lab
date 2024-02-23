module Decoder2_4(I,En,Y);
input [1:0]I;
input En;
output [3:0]Y;
	assign	Y[0] = ~I[0] & ~I[1] & En,
		Y[1] = I[0] & ~I[1] & En,
		Y[2] = ~I[0] & I[1] & En,
		Y[3] = I[0] & I[1] & En;			
endmodule
