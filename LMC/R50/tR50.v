module tR50;
   parameter ADDR_WIDTH = 2;
   parameter DATA_WIDTH = 8;
   
   reg reset_count; 
   reg timer555, RAM_button;
   wire [ADDR_WIDTH-1:0] counter;
   reg [DATA_WIDTH-1:0] data_in;
   wire [DATA_WIDTH-1:0] RAM_out;
   
   wire mux_switch_out;
   wire [3:0] mux_out;
   wire [3:0] Acc_out;
R50 test_R50(reset_count, counter, timer555, RAM_button, data_in, RAM_out, mux_switch_out, mux_out,Acc_out);
initial // Clock generator
  begin
    timer555 = 0;
    forever #20 timer555 = ~timer555;
  end
initial	
  begin
   	data_in[0] = 1;
	data_in[1] = 0;
	data_in[2] = 1;
	data_in[3] = 0;
	data_in[4] = 0;
	data_in[5] = 1;
	data_in[6] = 1;
	data_in[7] = 0;
	RAM_button = 0;
	reset_count =1;  
	#5 RAM_button = 1; reset_count = 0; 
	#5  data_in[0] = 0;data_in[2] = 0; data_in[5] = 0; data_in[6] = 0; RAM_button = 0;
	#15 data_in[1] = 1; data_in[3] = 1; data_in[5] = 1;data_in[6] = 1;
	#5  RAM_button = 1; 
	#5  data_in[1] = 0; data_in[3] = 0; data_in[5] = 0; data_in[6] = 0; RAM_button = 0; 
  end
endmodule    
