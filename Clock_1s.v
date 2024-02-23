module Clock_1s(Clk_1Hz,Clk_50Mhz);
parameter N = 25;
input Clk_50Mhz;
output reg Clk_1Hz;
reg [N:0]T ;

always@(posedge Clk_50Mhz)
begin
T <= T +1;
if(T == 26'd49999999)
  begin
  Clk_1Hz <= 1'b1;
  T <= 26'h0;
  end
else
  Clk_1Hz <= 1'b0; 
end
endmodule
