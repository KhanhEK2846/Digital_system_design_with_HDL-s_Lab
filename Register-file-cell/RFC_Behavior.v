module RFC(Oa,Ob,I,Wi,Ra,Rb,Clk);
input I,Wi,Ra,Rb,Clk;
output reg Oa, Ob;
reg D;

always@(posedge Clk)
begin
	if(Wi)
		D <= I;
end	

always@(*)
begin
	if(Ra)
		Oa <= D;
	else
		Oa <= 1'bz;
	if(Rb)
		Ob <= D;
	else
		Ob <= 1'bz;
end
endmodule
