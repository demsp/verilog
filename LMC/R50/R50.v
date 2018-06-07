module register4
(
  input  [3:0] reg_data,
  input reg_button,
  output reg [3:0] q  
);
always @(negedge reg_button) //posedge->negedge
     	 q <= reg_data;
endmodule

module R50 (reset_count, counter, timer555,RAM_button, data_in, RAM_out, mux_switch_out, mux_out,Acc_out);
   parameter ADDR_WIDTH = 2;
   parameter DATA_WIDTH = 8;
      
  input reset_count;
  output [ADDR_WIDTH-1:0] counter;
  input timer555;
  input RAM_button;
  input [DATA_WIDTH-1:0] data_in;
  output [DATA_WIDTH-1:0] RAM_out;
  output [3:0] Acc_out;
  
  output mux_switch_out;
  output [3:0] mux_out;
wire Counter_load;
assign Counter_load = RAM_out[7];
//Counter
reg [ADDR_WIDTH-1:0] counter;
always @ (posedge timer555 or posedge reset_count)
  if (reset_count)
		counter <= 2'b00;  
  else if (Counter_load) 
		counter <= RAM_out[1:0];  
  else
		counter <= counter + 2'b01;

wire [ADDR_WIDTH-1:0] adr;
 assign adr = counter;
//RAM
reg [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0]; 
    always @(posedge RAM_button) 
        mem [adr] <= data_in;
assign RAM_out = mem[adr]; 
// MUX2
wire MUX_switch;
assign MUX_switch = RAM_out[5];
reg [3:0] MUX2; 
always @*
	MUX2 = MUX_switch ? RAM_out[3:0] : data_in[3:0];
assign mux_out = MUX2;
assign mux_switch_out = MUX_switch;

wire Acc_button;
assign Acc_button = RAM_out[6];
//Acc
register4 Acc_reg(
	.reg_data(mux_out),
	.reg_button(Acc_button & timer555),
	.q(Acc_out)
);
endmodule
