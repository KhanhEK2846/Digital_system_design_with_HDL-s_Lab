 `timescale 1ns/1ns
 
 module Counter_Testbench();
  reg  up_down,enable,reset_n,clock;
  wire [3:0] q_out;
  
  Counter C1 (.q_out(q_out),
                      .up_down(up_down),
                      .enable(enable),
                      .reset_n(reset_n),
                      .clock(clock));
  initial
  begin
    clock = 1'b0;    
    reset_n = 1'b0;
    enable = 1'b0;
    up_down = 1'b0;
    
    #5 enable = 1'b1;
    reset_n = 1'b1;
    #1000 $finish;

  end
  
  always
  begin
    #10 clock <= ~clock;
    
  end
  
  always
  begin
    #100 up_down <= ~up_down;
  end
  
endmodule
