//Decoder 7-segment giải mã 3 bit nhị phân 
module Decoder_7segment_3bit_Hello(L,c2,c1,c0);
input c2,c1,c0;
output [6:0]L;

	assign	L[6] = ~c2 & ~c1,
				L[5] = ~c2 | (~c1 & ~c0),
				L[4] = ~c2 | (~c1 & ~c0),
				L[3] = (~c2 & c1) | (~c1 & (c0 ^ c2)),
				L[2] = ~c1 & ~c0,
				L[1] = ~c1 & ~c0,
				L[0] = ~c1 & (c0 ^ c2);
endmodule
