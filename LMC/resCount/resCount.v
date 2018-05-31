module resCount (reset_count, counter, timer555, RAM_button, data_in, RAM_out);
   parameter ADDR_WIDTH = 4;
   parameter DATA_WIDTH = 8;
      
  input reset_count;
  output [ADDR_WIDTH-1:0] counter;
  input timer555;
  input RAM_button;
  input [DATA_WIDTH-1:0] data_in;
  output [DATA_WIDTH-1:0] RAM_out;
wire Counter_load;
assign Counter_load = RAM_out[7];
reg [ADDR_WIDTH-1:0] counter;
always @ (posedge timer555 or posedge reset_count)
  if (reset_count)
		counter <= 4'b0000;  
  else if (Counter_load) 
		counter <= RAM_out[3:0];  
  else
		counter <= counter + 4'b0001;
 wire [ADDR_WIDTH-1:0] adr;
    assign adr = counter;
reg [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0]; 
    always @(posedge RAM_button) 
        mem [adr] <= data_in;
assign RAM_out = mem[adr]; 
endmodule
