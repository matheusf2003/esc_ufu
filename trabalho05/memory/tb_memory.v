`include "memory.v"

module tb_memory;
    // Definições dos sinais
    reg clk;                     // Clock
    reg reset;                   // Sinal de reset
    reg [15:0] inM;              // Valor de entrada M (memória)
    reg [15:0] address;          // Endereço da memória
    reg load;                    // Sinal para escrever em M
    wire [15:0] outM;            // Valor de saída M (memória)

    // Instância da memória
    memory utt (.clk(clk), .inM(inM), .address(address), .load(load), .outM(outM));

    // Gerador de clock
    always
        #1 clk = ~clk;  

    // Como os sinais irão variar durante a simulação
    initial begin
        $display("Testando o módulo Memory");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_memory);
        // Inicializando os sinais
        clk = 0;
        reset = 0;
        inM = 16'd0;
        address = 16'd0;
        load = 0;

        // Resetando a memória
        reset = 1;
        #2;
        reset = 0;

        // Teste 1: Carregar 12345 no endereço 12345
        address = 16'd12345;
        inM = 16'd12345;
        load = 1;
        #2;  // Espera 2 unidades de tempo (um ciclo de clock completo)
        load = 0;

        // Teste 2: Ler o valor do endereço 12345
        address = 16'd12345;
        load = 0;
        #2;

        // Teste 3: Carregar 23456 no endereço 23456
        address = 16'd23456;
        inM = 16'd23456;
        load = 1;
        #2;
        load = 0;

        // Teste 4: Ler o valor do endereço 23456
        address = 16'd23456;
        load = 0;
        #2;

        // Teste 5: Carregar 1000 no endereço 1000
        address = 16'd1000;
        inM = 16'd1000;
        load = 1;
        #2;
        load = 0;

        $finish;

    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tclk=%d,reset=%d,inM=%d,address=%d,load=%d,outM=%d\n",$time,clk,reset,inM,address,load,outM);
    end

endmodule
