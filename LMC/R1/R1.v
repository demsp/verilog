module R1 #(parameter N = 2, M = 4)
(
    input timer555, 
    input RAM_button,
    //input [N-1:0] adr,
    input [M-1:0] data_in,
    output [M-1:0] RAM_out
);
    reg [1:0]counter; //объявляем счётчик
    always @(posedge timer555) //при поступлении тактового сигнала
        counter <= counter + 1;  // счетчик увеличивается на 1
 
    wire [N-1:0] adr;

    assign adr = counter; // подключаем счётчик на адресный вход ОЗУ
    reg [M-1:0] mem [2**N-1:0];

    always @(posedge RAM_button)
        mem [adr] <= data_in;

    assign RAM_out = mem[adr];
endmodule
