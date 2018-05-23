module R2 (counter, timer555, Counter_load, RAM_button, data_in, RAM_out);
   parameter N = 2;
   parameter M = 4;
   input timer555, Counter_load;
   output [1:0] counter;
   // input [N-1:0] adr; 
   input RAM_button;
   input [M-1:0] data_in;
   output [M-1:0] RAM_out;
reg [1:0] counter;
always @ (posedge timer555 or posedge Counter_load)
  if (Counter_load)
       counter <= data_in[1:0];  
  else
     counter <= counter + 2'b01;
 wire [N-1:0] adr;
    assign adr = counter;
reg [M-1:0] mem [2**N-1:0]; 
    always @(posedge RAM_button) 
        mem [adr] <= data_in;
assign RAM_out = mem[adr]; 
endmodule
