module Counter(q_out,up_down,enable,reset_n,clock);
output reg [3:0] q_out;
input up_down,enable,reset_n,clock;
always@(posedge clock or negedge reset_n)
begin
	if(!reset_n)
		q_out <= 4'b0;
	else
	begin
		if(enable)
		begin
			if(up_down)
				q_out <= q_out - 1;
			else
				q_out <= q_out + 1;
		end
	end
end


endmodule
