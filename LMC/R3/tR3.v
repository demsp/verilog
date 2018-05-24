module tR3;
parameter ADDR_WIDTH = 2;
parameter DATA_WIDTH = 4;

reg MUX_switch;
reg Acc_button; 
wire [3:0] Acc;

reg timer555, Counter_load, RAM_button;
wire [1:0] counter;
reg [DATA_WIDTH-1:0] data_in;
wire [DATA_WIDTH-1:0] RAM_out;

R3 test_R3(MUX_switch, Acc_button, Acc, counter, timer555, Counter_load, RAM_button, data_in, RAM_out);
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
   Counter_load = 0;
   Acc_button = 0;
   RAM_button = 0;
   MUX_switch = 0;
   #5 Counter_load = 1;
   #5 data_in[0]=0; data_in[1]=1; Counter_load = 0;
   #5 Acc_button = 1;  
   #5 RAM_button = 1;  
   #5 data_in[0]=0; data_in[1] = 0; Acc_button = 0; RAM_button = 0; 
   #5 data_in[0]=1; data_in[1]=1;
   #15 Acc_button = 1;
   #5 RAM_button = 1;
   #5 Acc_button = 0;
   #5 data_in[0]=0; data_in[1] = 0; RAM_button = 0;
   #10 Acc_button = 1;
   #10 Acc_button = 0;
   #60 MUX_switch = 1; 
   #10 Acc_button = 1;
   #10 Acc_button = 0;
   #30 Acc_button = 1;
   #10 Acc_button = 0;
   #30 RAM_button = 1;
   #10 RAM_button = 0;
  end
endmodule    
