//4-x'разрядный регистр
module d_trig_verilog

(
    input  [4:0] key,  
    output [4:0] led   
);

    wire clk;
    wire d1 = ~ key [1];
	 wire d2 = ~ key [2];
	 wire d3 = ~ key [3];
	 wire d4 = ~ key [4];

    global g (.in (~ key [0]), .out (clk));
        
    reg q1;
	 reg q2;
	 reg q3;
	 reg q4;
    
      always @(posedge clk)
	   q1 <= d1;
		always @(posedge clk)
		q2 <= d2;
		always @(posedge clk)
		q3 <= d3;
		always @(posedge clk)
		q4 <= d4;
    assign led [0] = clk;
    assign led [1] = q1;
	 assign led [2] = q2;
	 assign led [3] = q3;
	 assign led [4] = q4;

endmodule
