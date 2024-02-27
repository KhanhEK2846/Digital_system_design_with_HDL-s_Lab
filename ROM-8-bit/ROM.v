module ROM(data,clock,cs,re_en,addr);
output reg [7:0] data;
input clock,cs,re_en;
input [6:0]addr;
reg [7:0] tmp [6:0];

initial
begin
	tmp [7'b1] = 8'd150;
	tmp [7'b10] = 8'd119;
end

always@(posedge clock)
begin
	if(cs && re_en)
		data <= tmp[addr];
	else
		data <= 8'bz;
end

endmodule
