module register_4bit
(
   input  [3:0] d,
	 input clk,
	 output [3:0] dOut,
   output  clkOut   
);
    reg [3:0] q;
             // Assignment on clock
    always @(posedge clk)
        q <= d;

    // LEDs
    assign dOut = q;
    assign clkOut = clk;
endmodule
