module tR51;
   parameter ADDR_WIDTH = 3;
   parameter DATA_WIDTH = 8;
   
   reg reset_count; 
   reg timer555, RAM1_button;
   wire [ADDR_WIDTH-1:0] counter;
   reg [DATA_WIDTH-1:0] data_in;
   wire [DATA_WIDTH-1:0] RAM1_out;
   wire [3:0] RAM2_out;
   
   wire mux_switch_out;
   wire [3:0] mux_out;
   wire [3:0] Acc_out;
R51 test_R51(reset_count, counter, timer555, RAM1_button, data_in, 
             RAM1_out, RAM2_out, mux_switch_out, mux_out,Acc_out);
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
  data_in[6] = 1;
  data_in[7] = 0;
  RAM1_button = 0;
  reset_count =1;  
  #5 RAM1_button = 1; reset_count = 0;  
  #5 RAM1_button = 0; data_in[6] = 0;
  //10ns
  #10 data_in[4] = 1; 
  #5 RAM1_button = 1;
  #5 data_in[4] = 0; RAM1_button = 0;
  //30ns
  #30 data_in[6] = 1; 
  #5 RAM1_button = 1; 
  #5 data_in[6] = 0; RAM1_button = 0;
  //70ns
  #30  data_in[4] = 1;     data_in[0] = 1; 
  #5 RAM1_button = 1;
  #5 data_in[4] = 0; data_in[0] = 0; RAM1_button = 0;
  //110ns
  #30 data_in[6] = 1; //100
  #5 RAM1_button = 1;
  #5  RAM1_button = 0; data_in[6] = 0;
  //150ns
  #30 data_in[5] = 1; data_in[6] = 1;
  #5 RAM1_button = 1;
  #5  RAM1_button = 0; data_in[5] = 0; data_in[6] = 0;
  //190ns
  #30 data_in[5] = 1; data_in[6] = 1; data_in[0] = 1;
  #5 RAM1_button = 1;
  #5 RAM1_button = 0; data_in[0] = 0; data_in[5] = 0; data_in[6] = 0;
  //300ns
  #70 data_in[2] = 1;
  #80 data_in[2] = 0; data_in[3] = 1;
  #40 data_in[3] = 0;
  end
endmodule    
