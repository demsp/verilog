module my_dff 
 (
    input  clk,
    input d,	 
    output clk_led,   
	 output  q_led
);

   reg q;
       // Assignment on clock
    always @(posedge clk)
        q <= d;
       // LEDs
    assign  clk_led = clk;
    assign  q_led = q;
endmodule

module 4bitRAM_4out(
 input wire [1:0]addr,
  input  clk,
  input d,	 
  output clk_led,
  output d_led, 	 
 output [3:0]q_led
 // output reg [3:0]out
  
);
   reg [3:0]out;
always @*
begin
  case( addr )
   2'd0: out = { 3'b000, clk      };
   2'd1: out = { 2'b00, clk, 1'b0 };
   2'd2: out = { 1'b0, clk, 2'b00 };
   2'd3: out = {      clk, 3'b000 };
  endcase
end

my_dff trig0 (
.d(d),
.clk(out[0]),
.q_led(q_led[0])
);
my_dff trig1 (
.d(d),
.clk(out[1]),
.q_led(q_led[1])
);
my_dff trig2 (
.d(d),
.clk(out[2]),
.q_led(q_led[2])
);
my_dff trig3 (
.d(d),
.clk(out[3]),
.q_led(q_led[3])
);

assign  d_led = d;
assign  clk_led = clk;
endmodule
