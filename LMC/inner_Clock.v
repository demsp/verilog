module inner_Clock ( output reg LED);
ALTUFM_OSC osc( .oscena(1'b1), .osc(clk));
   reg signal;
   reg [24:0] osc_counter; 
   reg [24:0] const_data = 25'b10110111000110110000000; 
initial
   begin
      signal = 1'b0;
     osc_counter = 25'b0;
   end
//досчитываем до 6 000 000 и обнуляем счетчик osc_counter
always @(posedge clk)
   begin  
      osc_counter <= osc_counter+ 1'b1;
      if(osc_counter == const_data)
         begin
            signal <= ~signal;
           osc_counter <= 25'b0;
        end
LED = signal; // LED мигает примерно 1 раз в сеунду.
end
endmodule
