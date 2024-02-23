module D_ff(q,d,clk,reset);
output q;
input d,clk,reset;
reg q;
always@(negedge clk)
if(reset)
	q <= 1'b0;
else
	q <= d;
endmodule
