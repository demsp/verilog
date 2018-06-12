module tR52;
   parameter ADDR_WIDTH = 4;
   parameter DATA_WIDTH = 12;
   
  reg reset_count;
  reg timer555;
  reg RAM1_button;
  reg [DATA_WIDTH-1:0] data_in;
  
  wire [ADDR_WIDTH-1:0] counter;
  wire [1:0]mux_switch_out;
  wire [3:0] mux_out;
  wire [3:0] Acc_out;
  wire [3:0] data_out;
  wire [DATA_WIDTH-1:0] RAM1_out;
  wire [3:0] RAM2_out;
  wire Z_flag, PZ_flag;
  wire Acc_dff;
  
R52 test_R52(Z_flag, PZ_flag, reset_count, counter, timer555, RAM1_button, data_in,
    RAM1_out, RAM2_out, mux_switch_out, mux_out,Acc_out, data_out, Acc_dff);
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
  data_in[8] = 0;
  data_in[9] = 0;
  data_in[10] = 1;
  data_in[11] = 0;
  RAM1_button = 0;
  reset_count =1;  
  #5 RAM1_button = 1; reset_count = 0;  //загружаем 1-ое число в Асс
  #5 RAM1_button = 0; data_in[10] = 0; data_in[0] = 0;
  //10ns
  #10 data_in[11] = 1; //сохраняем 1-ое число в ячейке 0
  #5 RAM1_button = 1;
  #5 data_in[11] = 0; RAM1_button = 0;
  //30ns
  #30 data_in[10] = 1;  //загружаем 2-ое число в Асс
  #5 RAM1_button = 1; 
  #5 RAM1_button = 0; data_in[10] = 0;  
  //70ns
  #30 data_in[11] = 1;data_in[0] = 1;  //сохраняем 2-ое число в ячейке 0
  #5 RAM1_button = 1;
  #5 data_in[11] = 0;data_in[0] = 0; RAM1_button = 0;
  //110ns
  #30 data_in[8]=1; data_in[10] = 1;  //вычитаем 1-ое число из Асс 
  #5 RAM1_button = 1; 
  #5 RAM1_button = 0;  data_in[8]=0; data_in[10] = 0;  
  //150ns
  #30 data_in[4]=1;   data_in[3]=1;  //Если Acc>=0, переходим на ячейку 8 
  #5 RAM1_button = 1; 
  #5 RAM1_button = 0;  data_in[4]=0; data_in[3]=0; 
  //190ns
  #30 data_in[7] = 1; data_in[8] = 1;   data_in[10] = 1;  //загружаем 1-ое число
  #5 RAM1_button = 1; 
  #5 RAM1_button = 0; data_in[7] = 0; data_in[8] = 0; data_in[10] = 0;  
  //230ns
  #30 data_in[6] = 1; data_in[3]=1; data_in[0]=1;  //безусловный переход в ячейку 9 
  #5 RAM1_button = 1; 
  #5 RAM1_button = 0; data_in[6] = 0;  data_in[3]=0; data_in[0]=0;  
  //270ns
  #30 data_in[9] = 1; //выводим число в data_out
  #5 RAM1_button = 1; 
  #5 RAM1_button = 0; data_in[9] = 0;  
  //310ns
  #30 data_in[6] = 1; data_in[3]=1; data_in[0]=0;  // 340 ns - безусловный переход в ячейку 8
  #5 RAM1_button = 1; 
  #5 RAM1_button = 0; data_in[6] = 0;  data_in[3]=0; data_in[0]=0;  
  //350ns
  #30 data_in[7] = 1; data_in[8] = 1;   data_in[10] = 1;  data_in[0] = 1; //загружаем 2-ое число
  #5 RAM1_button = 1; 
  #5 RAM1_button = 0; data_in[7] = 0; data_in[8] = 0; data_in[10] = 0;  data_in[0] = 0;
  //390ns  
  #75 RAM1_button = 1;
  #5 RAM1_button = 0;
  //470ns
  #230 data_in[2]=1;  data_in[0]=0; //первое число
  //700ns
  #80 data_in[2]=0; data_in[0]=1; // второе число
    
  end
endmodule    

