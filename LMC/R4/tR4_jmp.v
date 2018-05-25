module tR4_jmp;
parameter ADDR_WIDTH = 2;
parameter DATA_WIDTH = 4;

   reg JMP, Z_JMP, PZ_JMP;
   wire Z_flag, PZ_flag;
   
   reg Output_button;
   wire [3:0] data_out;

   reg [1:0] MUX_switch;
   reg Acc_button; 
   wire [3:0] Acc;

   reg timer555, RAM_button;
   wire [1:0] counter;
   reg [DATA_WIDTH-1:0] data_in;
   wire [DATA_WIDTH-1:0] RAM_out;

R4 test_R4(JMP, Z_JMP, PZ_JMP, Z_flag, PZ_flag, Output_button, data_out, MUX_switch, Acc_button, 
           Acc, counter, timer555, RAM_button, data_in, RAM_out);
initial 
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
  JMP = 0; Z_JMP = 0; PZ_JMP = 0;
	Acc_button = 0;
	RAM_button = 0;
	Output_button = 0;
	
	MUX_switch[0] = 0;
	MUX_switch[1] = 0;
  #5 JMP = 1;
	#5 data_in[0]=0; data_in[1]=1; JMP = 0;
  #5 Acc_button = 1;  
	#5 data_in[0]=1; data_in[1]=1; Acc_button = 1;  
	#5 data_in[0]=1; data_in[1]=1; Acc_button = 0;  
	#5 Z_JMP = 1;
	#5 PZ_JMP = 1; Z_JMP = 0;
	#5 PZ_JMP = 0; 
  end
endmodule    
