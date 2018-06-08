module register4
(
  input  [3:0] reg_data,
 input reg_button,
  output reg [3:0] q  
);
always @(posedge reg_button)
     	 q <= reg_data;
endmodule
module Cycle (A,Acc, reset_count, counter, timer555, RAM_button, data_in, RAM_out, RAM2_out);
   parameter ADDR_WIDTH = 4;
   parameter DATA_WIDTH = 8;
   
   input [3:0] A;
   input reset_count;
   
   output [ADDR_WIDTH-1:0] counter;
   input timer555;
	 input RAM_button;
   input [DATA_WIDTH-1:0] data_in;
   output [DATA_WIDTH-1:0] RAM_out;
   output [3:0] RAM2_out;
   output [3:0] Acc;
// Counter
wire Counter_load;
assign Counter_load = RAM_out[7];
reg [ADDR_WIDTH-1:0] counter;
always @ (posedge timer555 or posedge reset_count)
  if (reset_count)
		counter <= 4'b0000;  
  else if (Counter_load) 
		counter <= data_in[3:0];  
  else
		counter <= counter + 4'b0001;
// RAM_1
 wire [ADDR_WIDTH-1:0] adr1;
    assign adr1 = counter;
reg [DATA_WIDTH-1:0] mem1 [2**ADDR_WIDTH-1:0]; 
    always @(posedge RAM_button) 
        mem1 [adr1] <= data_in;
assign RAM_out = mem1[adr1]; 
// RAM_2
wire [3:0] adr2;
    assign adr2 = RAM_out[3:0];
reg [3:0] mem2 [2**ADDR_WIDTH-1:0]; 
    always @(posedge RAM_out[5]) 
        mem2 [adr2] <= Acc;
assign RAM2_out = mem2[adr2]; 

wire Acc_button;
assign Acc_button = RAM_out[6];
//Acc
register4 Acc_reg(
	.reg_data(data_in[3:0]),
	.reg_button(Acc_button),
	.q(Acc)
);
endmodule
