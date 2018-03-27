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

module test_key(
  input  clk,
  input d,	 
  output clk_led,
  output d_led, 	 
	 output [3:0]q_led
  
);

my_dff trig0 (
.d(d),
.clk(clk),
.q_led(q_led[0])
);
my_dff trig1 (
.d(d),
.clk(clk),
.q_led(q_led[1])
);
my_dff trig2 (
.d(d),
.clk(clk),
.q_led(q_led[2])
);
my_dff trig3 (
.d(d),
.clk(clk),
.q_led(q_led[3])
);

assign  d_led = d;
assign  clk_led = clk;
endmodule
