module register4
(
  input  [3:0] reg_data,
  input reg_button,
  output reg [3:0] q  
);
always @(posedge reg_button)
     	 q <= reg_data;
endmodule

module R4 (JMP, Z_JMP, PZ_JMP, Z_flag, PZ_flag, Output_button, data_out, MUX_switch, Acc_button, 
           Acc, counter, timer555, RAM_button, data_in, RAM_out);
   parameter ADDR_WIDTH = 2;
   parameter DATA_WIDTH = 4;
   
   input JMP, Z_JMP, PZ_JMP;
   output Z_flag, PZ_flag;
   
   input Output_button;
   output [3:0] data_out;
   
   input [1:0] MUX_switch;
   input Acc_button; 
   output [3:0] Acc;
   
   input timer555; 
   output [1:0] counter;
   // input [N-1:0] adr; 
   input RAM_button;
   input [DATA_WIDTH-1:0] data_in;
   output [DATA_WIDTH-1:0] RAM_out;
// flags
wire Z,PZ;
assign Z = Z_flag & Z_JMP;
assign PZ = PZ_flag & PZ_JMP;   
// Counter
reg [1:0] counter;
always @ (posedge timer555 or posedge JMP or posedge Z or posedge PZ)
  if (JMP|Z|PZ)
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
//subtract
wire [3:0] subtract;
assign subtract =  Acc - RAM_out;
// MUX4
reg [3:0] MUX4; 
always @*
MUX4 = MUX_switch[1] ? (MUX_switch[0] ? RAM_out : subtract)
: (MUX_switch[0] ? sum : data_in);
//Acc
register4 Acc_reg(
	.reg_data(MUX4),
	.reg_button(Acc_button),
	.q(Acc)
);
//data_out
register4 Output_reg(
.reg_data(Acc),
.reg_button(Output_button),
.q(data_out)
);
   assign Z_flag =  ~(|Acc);
   assign PZ_flag =  ~Acc[3];
endmodule
