`timescale 1 ns / 1 ps 

module start(
  rst, clk, ce, en, rdy, ap_start);

input rst, clk, ce, en, rdy; 
output ap_start;            

reg state;

always @(posedge clk) begin
  if (rst) state <= 0;
  else case (state)
    0: if (en==1)  state <= 1;
    1: if (rdy==1) state <= 0;
  endcase
end

assign ap_start = state;




endmodule
