`include "gand16.v"

module tb_gand16;

    //inputs
    reg [15:0] in_a;
    reg [15:0] in_b;

    // outputs
    wire [15:0] out_y;

    // Instancia da UUT (Unit Under Test)
    gand16 uut (.a(in_a), .b(in_b), .y(out_y));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("Testbench para gate NOT");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_gand16);

        # 0 in_a = $random; in_b = $random;
        # 10 in_a = $random; in_b = $random;
        # 10 in_a = $random; in_b = $random;
        # 10 in_a = $random; in_b = $random;

        # 10 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \ta=%d, \tb=%d, y=%d \n",$time,in_a,in_b,out_y);
    end

endmodule

