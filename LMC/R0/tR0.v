module tR0; 
   reg clk; 
   reg [1:0] adr;
   reg [3:0] data_in;
   wire [3:0] RAM_out;
R0 test_R0 (clk, adr, data_in,RAM_out); 
initial 
   begin
    clk = 0;
	adr[0] = 0;    
	adr[1] = 0;    
	data_in[0] = 0;
	data_in[1] = 0;
	data_in[2] = 0;
	data_in[3] = 0;
	#5 data_in[0] = 1;
	#5 clk = 1;
	#5 adr[0] = 1;  data_in[0] = 0; data_in[1] = 1;  clk = 0;  
	#5 clk = 1;
	#5 adr[0] = 0; adr[1] = 1;  data_in[1] = 0; data_in[2] = 1;  clk = 0;  
	#5 clk = 1;
	#5 adr[0] = 1; adr[1] = 1;  data_in[2] = 0; data_in[3] = 1;  clk = 0;  
   #5 clk = 1;
   #5 adr[0] = 0; adr[1] = 0; data_in[3] = 0;  clk = 0;  
	#5 adr[0] = 1; adr[1] = 0;
	#5 adr[0] = 0; adr[1] = 1;
	#5 adr[0] = 1; adr[1] = 1;
	#5 adr[0] = 0; adr[1] = 0;
	#5 adr[0] = 1; adr[1] = 0;
	#5 adr[0] = 0; adr[1] = 1;
	#5 adr[0] = 1; adr[1] = 1;
	#5 adr[0] = 0; adr[1] = 0;
	#5 adr[0] = 1; adr[1] = 0;
	#5 adr[0] = 0; adr[1] = 1;
	#5 adr[0] = 1; adr[1] = 1;
end
endmodule 
