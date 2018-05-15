module demux2to4 (
  input wire signal,
  input wire [1:0]addr,
  output wire [3:0]out,
  output wire led_clk 
   );

assign out[0] = ~addr[1] & ~addr[0]  & signal;
assign out[1] =  ~addr[1] & addr[0]  & signal;
assign out[2] =  addr[1] & ~addr[0]  & signal;
assign out[3] =  addr[1] & addr[0]  & signal; 

assign led_clk = signal; 
endmodule
