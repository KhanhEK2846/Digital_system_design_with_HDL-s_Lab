module Sub_1bit(R,O,A,B,I);
input A,B,I;
output R,O;
	assign	R = A ^ B ^ I,
				O = ((~A) & B) | ((~(A ^ B)) & I);
endmodule
