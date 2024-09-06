`include "add16.v"

module tb_add16;

    // inputs
    reg [15:0] in_a;
    reg [15:0] in_b;

    // outputs
    wire [15:0] out_sum;

    // Instancia da UUT (Unit Under Test)
    add16 uut (.a(in_a), .b(in_b), .sum(out_sum));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("Testbench para add16");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_add16);

        # 0 in_a = $random; in_b = $random;
        # 10 in_a = $random; in_b = $random;
        # 10 in_a = $random; in_b = $random;
        # 10 in_a = $random; in_b = $random;

        # 10 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \ta=%d,b=%d,sum=%d \n",$time,in_a,in_b,out_sum);
    end

endmodule