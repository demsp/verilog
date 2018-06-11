module register4
(
  input  [3:0] reg_data,
  input reg_button,
  output reg [3:0] q  
);
always @(posedge reg_button) 
     	 q <= reg_data;
endmodule

module R52 (Z_flag, PZ_flag, reset_count, counter, timer555, 
   RAM1_button, data_in, RAM1_out, RAM2_out, mux_switch_out, mux_out,Acc_out, data_out, Acc_latch);
  parameter ADDR_WIDTH = 4;
  parameter DATA_WIDTH = 12;
      
  input reset_count;
  input timer555;
  input RAM1_button;
  input [DATA_WIDTH-1:0] data_in;
  
  output [ADDR_WIDTH-1:0] counter;
  output [1:0] mux_switch_out;
  output [3:0] mux_out;
  output [3:0] Acc_out;
  output [3:0] data_out;
  output [DATA_WIDTH-1:0] RAM1_out;
  output [3:0] RAM2_out;
  output Z_flag, PZ_flag;
  output Acc_latch;
 
wire JMP_button, Z_JMP_button,PZ_JMP_button;
  assign JMP_button = RAM1_out[6];
  assign Z_JMP_button = RAM1_out[5];
  assign PZ_JMP_button = RAM1_out[4];   
  
wire Z_JMP,PZ_JMP;
 assign Z_JMP = Z_flag & Z_JMP_button;
 assign PZ_JMP = PZ_flag & PZ_JMP_button;   
 
//Counter
reg [ADDR_WIDTH-1:0] counter;
 always @ (posedge timer555 or posedge reset_count)
  if (reset_count)
		counter <= 4'b0000;  
  else if (JMP_button|Z_JMP|PZ_JMP)
		counter <= RAM1_out[3:0];  
  else
		counter <= counter + 4'b0001;

wire [ADDR_WIDTH-1:0] adr1;
 assign adr1 = counter;
//RAM1
reg [DATA_WIDTH-1:0] mem1 [2**ADDR_WIDTH-1:0]; 
    always @(posedge RAM1_button ) 
        mem1 [adr1] <= data_in;
 assign RAM1_out = mem1[adr1]; 
//RAM2_adr
wire [ADDR_WIDTH-1:0] adr2;
   assign adr2 = RAM1_out[2:0];
//RAM2_button
wire RAM2_button;
   assign RAM2_button = RAM1_out[11];
//RAM2	
reg [3:0] mem2 [2**ADDR_WIDTH-1:0]; 
    always @(posedge RAM2_button) 
	     mem2 [adr2] <= Acc_out;
 assign RAM2_out = mem2[adr2]; 		  
// sum 
wire [3:0] sum;
 assign sum =  Acc_out + RAM2_out;
//subtract
wire [3:0] subtract;
 assign subtract =  Acc_out - RAM2_out;
// MUX4
wire [1:0] mux_switch;
 assign mux_switch[0] = RAM1_out[7];
 assign mux_switch[1] = RAM1_out[8];
reg [3:0] MUX4; 
always @*
MUX4 = mux_switch[1] ? (mux_switch[0] ? RAM2_out : subtract)
: (mux_switch[0] ? sum : data_in[3:0]);

 assign mux_out = MUX4;
 assign mux_switch_out[0] = mux_switch[0];
 assign mux_switch_out[1] = mux_switch[1];
//Acc_button
wire Acc_button;
 assign Acc_button = RAM1_out[10];
// Acc_latch
reg Acc_latch;
always @(negedge timer555)
   Acc_latch <= Acc_button;  
//Acc
register4 Acc_reg(
	.reg_data(mux_out),
//.reg_button(Acc_button & timer555),
	.reg_button(Acc_latch), 
	.q(Acc_out)
);
//data_out
wire Output_button;
 assign Output_button = RAM1_out[9];
register4 Output_reg(
	.reg_data(Acc_out),
	.reg_button(Output_button),
	.q(data_out)
);
// flags
 assign Z_flag =  ~(|Acc_out);
 assign PZ_flag =  ~Acc_out[3];
endmodule
