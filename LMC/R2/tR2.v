module tR2;
parameter N = 2;
parameter M = 4;
   reg timer555, Counter_load, RAM_button;
   wire [1:0] counter;
   reg [M-1:0] data_in;
   wire [M-1:0] RAM_out;

R2 test_R2(counter, timer555, Counter_load, RAM_button, data_in, RAM_out);
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
	RAM_button = 0;
#5 data_in[0]=0; data_in[1]=0; Counter_load=1; RAM_button=0;
#5 data_in[0]=1; data_in[1]=0; Counter_load=0; RAM_button=1; 
#5 data_in[0]=0; data_in[1]=0; Counter_load=0; RAM_button=0;
	
#5 data_in[0]=1; data_in[1]=0; Counter_load=1; RAM_button=0;
#5 data_in[0]=0; data_in[1]=1; Counter_load=0; RAM_button=1;
#5 data_in[0]=0; data_in[1]=0; Counter_load=0; RAM_button=0;

#5 data_in[0]=0; data_in[1]=1; Counter_load=1; RAM_button=0; 
#5 data_in[2]=1; data_in[0]=0; data_in[1]=0; Counter_load=0; RAM_button=1;
#5 data_in[2]=0; data_in[0]=0; data_in[1]=0; Counter_load=0; RAM_button=0;
  
#5 data_in[0]=1; data_in[1]=1; Counter_load=1; RAM_button=0;
#5 data_in[3]=1; data_in[0]=0; data_in[1]=0; Counter_load=0; RAM_button=1; 
#5 data_in[3]=0; data_in[0]=0; data_in[1]=0; Counter_load=0; RAM_button=0; 
end
endmodule    
