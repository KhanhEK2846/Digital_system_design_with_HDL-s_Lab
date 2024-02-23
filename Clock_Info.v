module Clock_Info(H,M,S,Clk,Clr);
input Clr,Clk;
output reg [5:0]H;
output reg [5:0]M;
output reg [5:0]S;

/*
initial
begin
	H = 5'd23;
	M = 6'd59;
	S = 6'd58;
end
*/
always@(posedge Clk or posedge Clr)
begin
if(Clr)
	begin
	H <= 6'b0;
	M <= 6'b0;
	S <= 6'b0;
	end
else
	begin
	S = S + 1;
	if(S == 6'd60)
	begin
		S = 6'b0;
		M = M +1;
	end
	if (M == 6'd60)
	begin
		M = 6'b0;
		H = H +1;
	end
	if(H == 6'd24)
		H = 6'b0;

	end
end
endmodule
