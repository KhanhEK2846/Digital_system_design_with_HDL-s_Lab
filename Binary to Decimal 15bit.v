module Comparator(z,v3,v2,v1,v0);
input v3,v2,v1,v0;
output z;
	assign z = (v3 & v2) | (v3 & v1);
endmodule

module Segment_decoder(L,a,b,c,d); //a=v3, b=v2, c=v1, d=v0
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

module CircuitA(o3,o2,o1,o0,v3,v2,v1,v0);
input v3,v2,v1,v0;
output o3,o2,o1,o0;
	assign	o3 = v3 & ~v2 & ~v1,
				o2 = (~v3 & v2) | (v2 & v1),
				o1 = (~v3 & v1) | (v3 & v2 & ~v1),
				o0 = v0;
endmodule

module BtD_15b(d1,d0,v3,v2,v1,v0);
input v3,v2,v1,v0;
output [6:0]d1;
output [6:0]d0;
wire z,o3,o2,o1,o0;

Comparator(z,v3,v2,v1,v0);
CircuitA(o3,o2,o1,o0,v3,v2,v1,v0);
Mux_2to1_1bit mx3(m3,z,v3,o3);
Mux_2to1_1bit mx2(m2,z,v2,o2);
Mux_2to1_1bit mx1(m1,z,v1,o1);
Mux_2to1_1bit mx0(m0,z,v0,o0);

Segment_decoder seg1(d1,0,0,0,z);
Segment_decoder seg0(d0,m3,m2,m1,m0);
endmodule