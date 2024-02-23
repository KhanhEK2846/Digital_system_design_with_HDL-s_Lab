module Mux_2to1_1bit (m,s,x,y);
input s,x,y;
output m;
	assign m = (s & y) | (~s & x);
endmodule