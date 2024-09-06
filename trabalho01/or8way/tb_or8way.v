`include "or8way.v"

module tb_or8way;

    //inputs
    reg in_a;
    reg in_b;
    reg in_c;
    reg in_d;
    reg in_e;
    reg in_f;
    reg in_g;
    reg in_h;

    // outputs
    wire out_y;

    integer i;

    // Instancia da UUT (Unit Under Test)
    or8way uut (.a(in_a), .b(in_b), .c(in_c), .d(in_d), .e(in_e), .f(in_f), .g(in_g), .h(in_h), .y(out_y));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("Testbench para gate AND");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_or8way);

        // Itera por todas as combinações de 8 entradas
        // Sequência de entrada para cobrir a tabela verdade
        
        for (i = 0; i < 256; i = i + 1) begin
            in_a = i[7];
            in_b = i[6];
            in_c = i[5];
            in_d = i[4];
            in_e = i[3];
            in_f = i[2];
            in_g = i[1];
            in_h = i[0];
            #1; // Aguarda um ciclo antes de mudar as entradas novamente
        end

        #1 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \ta=%d,b=%d,y=%d \n",$time,in_a,in_b,out_y);
    end

endmodule
