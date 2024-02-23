
module Tri_state(input_x, enable, output_x);
input input_x;
input enable;
output output_x;
assign output_x = enable? input_x : 'bz;
endmodule

