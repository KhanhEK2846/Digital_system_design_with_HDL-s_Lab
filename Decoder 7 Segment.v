module Segment_decoder(L,a,b,c,d); 
input a,b,c,d;
output [6:0]L;
	assign	L[0] = (~b & ~d) | c | (b & d) | a,
				L[1] = ~b | (~c & ~ d) | (c & d),
				L[2] = ~c | b | d,
				L[3] = (~b & ~d) | (~b & c) | (b & ~c & d) + (c & ~d) | a,
				L[4] = (~b & ~d) | (c & ~d),
				L[5] = (~c & ~d) | (b & ~c) | (b & ~d) | a,
				L[6] = (~b & c) | (b & ~c) | a | (b & ~d);
endmodule