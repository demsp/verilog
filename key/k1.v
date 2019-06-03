module counter11
(
input clk,
input reset_n
);

and myand(out, in0, in1, in2, in3);

reg [3:0] counter; //объявляем счётчик
always @(posedge clk or negedge reset_n) //при поступлении тактового сигнала
if (!reset_n)
     counter <= 0;
else
     counter <= counter + 1;  // счетчик увеличивается на 1

// AND from 3 to 1
wire AND_3_1;
assign myAND = counter[0] & counter[1] & counter[3];

// dff with reset 
reg q;    
    // Assignment on clock
    always @(posedge clk or negedge reset_n)
 if (!reset_n)
   q <= 0;
else    
   q <= myAND;

//NOR from 3 to 1
// NOR_3_1 пропускает всё время, пока триггкр q пуст 
wire NOR_3_1;
assign myNOR = clk & q & reset_n;
endmodule



 
