module R0 #(parameter N = 2, M = 4)
(
    input clk, //тактовый сигнал
    input [N-1:0] adr, //адрес
    input [M-1:0] data_in, //порт ввода данных
    output [M-1:0] RAM_out //порт вывода данных
);
    reg [M-1:0] mem [2**N-1:0]; //объявляем массив mem
 
    always @(posedge clk) //при поступлении тактового сигнала clk 
        mem [adr] <= data_in; //загружаем данные в ОЗУ из data_in 
    
    assign RAM_out = mem[adr]; //назначаем RAM_out портом вывода данных
endmodule
