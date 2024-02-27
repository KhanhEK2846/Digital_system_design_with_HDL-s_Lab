module RAM(clock, cs, wr_e, oe, addr, data);
input clock, cs, wr_e, oe;
input [6:0]addr;
inout reg [7:0]data;
reg [7:0]mem[6:0];

always@(posedge clock)
begin
	if(cs && !oe && wr_e)
		mem[addr] <= data;
end


always@(*)
begin
	if(cs && oe && !wr_e)
		data <= mem[addr];
	else
		data <= 8'bz;	
		
end

endmodule
