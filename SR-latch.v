//SR-latch
module SR_latch(R,S,Q,Qn);
input R,S;
output Q,Qn;
	assign	Q = ~(R | Qn),
				Qn = ~(S | Q);
endmodule
