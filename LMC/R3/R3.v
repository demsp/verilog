module R3 (MUX_switch, Acc_button, Acc, counter, timer555, 
            Counter_load, RAM_button, data_in, RAM_out);
   parameter ADDR_WIDTH = 2;
   parameter DATA_WIDTH = 4;
   
   input MUX_switch;
   input Acc_button; 
   output [3:0] Acc;
   
   input timer555, Counter_load;
   output [1:0] counter;
   // input [N-1:0] adr; 
   input RAM_button;
   input [DATA_WIDTH-1:0] data_in;
   output [DATA_WIDTH-1:0] RAM_out;
// Counter
reg [1:0] counter;
always @ (posedge timer555 or posedge Counter_load)
  if (Counter_load)
       counter <= data_in[1:0];  
  else
     counter <= counter + 2'b01;
// RAM 
 wire [ADDR_WIDTH-1:0] adr;
    assign adr = counter;
reg [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0]; 
    always @(posedge RAM_button) 
        mem [adr] <= Acc;
assign RAM_out = mem[adr];
// sum 
wire [3:0] sum;
assign sum =  Acc + RAM_out;
// MUX2
reg [3:0] MUX2; 
always @*
MUX2 = MUX_switch ? sum : data_in;
//Acc
register4 Acc_reg(
	.reg_data(MUX2),
	.reg_button(Acc_button),
	.q(Acc)
);
endmodule
