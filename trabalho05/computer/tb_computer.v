`include "computer.v"

module tb_computer;
    // Definições dos sinais
    reg reset;                   // Sinal de reset
    reg clk;                     // Clock

    // Instância do computador
    computer utt (.reset(reset));

    // Gerador de clock
    always
        #1 clk = ~clk;

    // Como os sinais irão variar durante a simulação
    initial begin
        $display("Testando o módulo Computer");
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_computer);
        // Inicializando os sinais
        reset = 0;
        clk = 0;

        // Resetando o computador
        reset = 1;
        #2;
        reset = 0;
        $finish;
    end

endmodule