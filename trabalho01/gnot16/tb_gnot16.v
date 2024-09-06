`include "gnot16.v"

module tb_gnot16;

    //inputs
    reg [15:0] in_a;

    // outputs
    wire [15:0] out_y;

    // Instancia da UUT (Unit Under Test)
    gnot16 uut (.a(in_a), .y(out_y));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("Testbench para gate NOT");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_gnot16);

        # 0 in_a = $random;
        # 10 in_a = $random;

        # 10 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \ta=%d,y=%d \n",$time,in_a,out_y);
    end

endmodule
