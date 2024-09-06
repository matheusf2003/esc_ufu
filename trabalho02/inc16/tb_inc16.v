`include "inc16.v"

module tb_inc16;

    // inputs
    reg [15:0] in_a;
    
    // outputs
    wire [15:0] out_b;

    // Instancia da UUT (Unit Under Test)
    inc16 uut (.in(in_a), .out(out_b));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("Testbench para inc16");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_inc16);

        # 0 in_a = $random;
        # 10 in_a = $random;
        # 10 in_a = $random;
        # 10 in_a = $random;

        # 10 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \ta=%d,b=%d \n",$time,in_a,out_b);
    end

endmodule