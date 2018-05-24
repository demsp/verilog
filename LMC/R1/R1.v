module R1 (timer555, RAM_button, data_in, RAM_out, counter);
   parameter ADDR_WIDTH = 2;
   parameter DATA_WIDTH = 4;
   
   input timer555;
   input RAM_button;
   input [DATA_WIDTH-1:0] data_in;
   output [DATA_WIDTH-1:0] RAM_out;
   output reg [1:0] counter;
// Counter
always @(posedge timer555) 
  counter <= counter + 1; 
// RAM 
 wire [ADDR_WIDTH-1:0] adr;
 assign adr = counter; 
reg [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0];
  always @(posedge RAM_button)
     mem [adr] <= data_in;
assign RAM_out = mem[adr];
endmodule
