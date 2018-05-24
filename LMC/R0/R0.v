module R0 #(parameter ADDR_WIDTH = 2, DATA_WIDTH = 4)
(
    input clk, //тактовый сигнал
    input [ADDR_WIDTH-1:0] adr, 
    input [DATA_WIDTH-1:0] data_in, 
    output [DATA_WIDTH-1:0] RAM_out 
);
    reg [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0]; 
 
    always @(posedge clk)
        mem [adr] <= data_in;
    
    assign RAM_out = mem[adr]; 
endmodule
