
//or

module HW3_PM(
   input [3:0] I, 
   input Sel,
   output reg [3:0] A, 
   output reg [3:0] B
   );

always@(*) 
begin
   if(~Sel) begin 
      A = I;
      B = 0; 
   end else begin 
      A = 0; 
      B = I; 
   end
end

endmodule

///or

module HW3_PM(
   input [3:0] I, 
   input Sel,
   output wire [3:0] A, 
   output wire [3:0] B
   );

assign A = ~sel&I;
assign B =  sel&I; 

endmodule
///or

module HW3_PM(
   input [3:0] I, 
   input Sel,
   output reg [3:0] A, 
   output reg [3:0] B
   );

always@(*)
begin
   case(Sel)
   0: begin
         A = I;
         B = 0;
      end
   1: begin
         A = 0;
         B = I;
      end
   endcase
end

endmodule
///or

module HW3_PM(input [3:0] I,input Sel,output wire [3:0] A, output wire [3:0] B);

and selA[3:0] (A, ~sel, I);
and selB[3:0] (B,  sel, I);

endmodule
