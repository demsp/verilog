module register4bit
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

module RAM4bit(
 input  [3:0] d,
 input  clk,
 input addr,
 //output [3:0] dOutR0,
 //output [3:0] dOutR1,
 output [3:0] muxOut,
 
 output clkOut  
); 
/*
wire [3:0] out;
assign out[0] = ~addr[1] & ~addr[0] & clk;
assign out[1] = ~addr[1] &  addr[0] & clk;
assign out[2] =  addr[1] & ~addr[0] & clk;
assign out[3] =  addr[1] &  addr[0] & clk; 
*/
wire [3:0] dOutR0;
wire [3:0] dOutR1;
/////
wire [1:0] demuxOut;
assign demuxOut[0] = ~addr & clk;
assign demuxOut[1] =  addr & clk;

register4bit R0 (
.d(d),
.clk(demuxOut[0]),
.dOut(dOutR0)
);

register4bit R1 (
.d(d),
.clk(demuxOut[1]),
.dOut(dOutR1)
);

assign muxOut = addr ? dOutR1 : dOutR0;

assign  clkOut = clk;
endmodule


