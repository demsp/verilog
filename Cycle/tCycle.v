module tRR0;
parameter ADDR_WIDTH = 4;
parameter DATA_WIDTH = 8;

reg [3:0] A;

reg reset_count; 
reg timer555, RAM_button;
wire [ADDR_WIDTH-1:0] counter;
reg [DATA_WIDTH-1:0] data_in;
wire [DATA_WIDTH-1:0] RAM_out;
wire [3:0] RAM2_out;
wire [3:0] Acc;

RR0 test_RR0(A, Acc, reset_count, counter, timer555, RAM_button, data_in, RAM_out, RAM2_out);

initial // Clock generator
  begin
    timer555 = 0;
    forever #20 timer555 = ~timer555;
  end
initial	
  begin
   	data_in[0] = 0;
	data_in[1] = 0;
	data_in[2] = 0;
	data_in[3] = 0;
	
	data_in[4] = 0;
	data_in[5] = 0;
	
	data_in[6] = 0; 
	data_in[7] = 0;
		
    RAM_button = 0;
	reset_count =1;
	
	#10 reset_count =0;	RAM_button = 1;
	#10 RAM_button = 0; 
	#10 RAM_button = 1;
	#10 RAM_button = 0;
	for (A = 0; A < 14; A=A+1)
	   begin 
	   #30 RAM_button = 1;
	   #10 RAM_button = 0;
	   end
	                                                    
	#20 data_in[6] = 1;                                 
	#20 RAM_button = 1;                                 
	#10 data_in[6] = 0; RAM_button = 0;                 
		
	#10 data_in[5] = 1; data_in[0] = 1;                 
	#20 RAM_button = 1;                                 
	#10 data_in[5] = 0; data_in[0] = 0; RAM_button = 0;	
	
	#50 data_in[5] = 1; data_in[1] = 1;                 
	#20 RAM_button = 1;                                 
	#10 data_in[5] = 0; data_in[1] = 0; RAM_button = 0;	
	
	#490 data_in[0] = 1;	                            
	#20 data_in[0] = 0;	                                

	
	#620 data_in[1] = 1;                                
  #20 data_in[1] = 0;                                 	
	
  end
endmodule 
