//Tri state logic
module Tri_state(input_x, enable, output_x);
input input_x;
input enable;
output output_x;
	assign	output_x = enable? input_x : 'bz;
endmodule

//D-latch
module D_latch(D,Clk,Qa,Qb);
input D,Clk;
output Qa,Qb;
wire S,R,S_g,R_g;
	assign	R = ~D,
		S = D,
		S_g = ~(S & Clk),
		R_g = ~(R & Clk),
		Qa = ~(S_g & Qb),
		Qb = ~(R_g & Qa);
endmodule

//D-ff
module D_ff(D,Clk,Qa,Qb);
input D,Clk;
output Qa,Qb;
wire Cm,Qm;
	assign	Cm = ~Clk;
D_latch D1(D,Cm,Qm);
D_latch D0(Qm,Clk,Qa,Qb);
endmodule

//Mux_2to1
module Mux_2to1_1bit (m,s,x,y);
input s,x,y;
output m;
	assign m = (s & y) | (~s & x);
endmodule

//RFC
module RFC(Oa,Ob,I,Clk,W,Ra,Rb);
input I,Clk,W,Ra,Rb;
output Oa,Ob;
wire d,q;

Mux_2to1_1bit(d,W,q,I);
D_ff(d,Clk,q);
Tri_state ta(q,Ra,Oa);
Tri_state tb(q,Rb,Ob);

endmodule


