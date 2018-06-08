module register4
(
  input  [3:0] reg_data,
  input reg_button,
  output reg [3:0] q  
);
always @(negedge reg_button) 
     	 q <= reg_data;
endmodule

module R51 (reset_count, counter, timer555, RAM1_button, data_in, 
            RAM1_out, RAM2_out, mux_switch_out, mux_out,Acc_out);
   parameter ADDR_WIDTH = 3;
   parameter DATA_WIDTH = 8;
      
  input reset_count;
  output [ADDR_WIDTH-1:0] counter;
  input timer555;
  input RAM1_button;
  input [DATA_WIDTH-1:0] data_in;
  output [DATA_WIDTH-1:0] RAM1_out;
  output [3:0] RAM2_out;
  output [3:0] Acc_out;
  
  output mux_switch_out;
  output [3:0] mux_out;
wire Counter_load;
assign Counter_load = RAM1_out[7];
//Counter
reg [ADDR_WIDTH-1:0] counter;
always @ (posedge timer555 or posedge reset_count)
  if (reset_count)
		counter <= 2'b00;  
  else if (Counter_load) 
		counter <= RAM1_out[1:0];  
  else
		counter <= counter + 2'b01;

wire [ADDR_WIDTH-1:0] adr1;
 assign adr1 = counter;
//RAM1
reg [DATA_WIDTH-1:0] mem1 [2**ADDR_WIDTH-1:0]; 
    always @(posedge RAM1_button ) 
        mem1 [adr1] <= data_in;
assign RAM1_out = mem1[adr1]; 

wire [ADDR_WIDTH-1:0] adr2;
 assign adr2 = RAM1_out[3:0];
wire RAM2_button;
 assign RAM2_button = RAM1_out[4];
//RAM2
reg [3:0] mem2 [2**ADDR_WIDTH-1:0]; 
   	always @(posedge RAM2_button)
        mem2 [adr2] <= Acc_out;
assign RAM2_out = mem2[adr2]; 
// MUX2
wire MUX_switch;
 assign MUX_switch = RAM1_out[5];
reg [3:0] MUX2; 
always @*
 MUX2 = MUX_switch ? RAM2_out : data_in[3:0];
assign mux_out = MUX2;
assign mux_switch_out = MUX_switch;

wire Acc_button;
 assign Acc_button = RAM1_out[6];
//Acc
register4 Acc_reg(
  .reg_data(mux_out),
	.reg_button(Acc_button & timer555),
	.q(Acc_out)
);
endmodule
