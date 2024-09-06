`include "bit.v"

module tb_bit;

    // inputs
    reg in;
    reg load;
    
    // outputs
    wire out;

    // Instancia da UUT (Unit Under Test)
    bit uut (.in(in), .load(load), .out(out));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("Testbench para bit");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_bit);

        # 0 in = 0; load = 1;

        for (integer i = 0; i < 20; i = i + 1) begin
            in = (i % 2);

            # 2 load = $random;
        end

        # 5 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tin=%d,load=%d,out=%d \n",$time,in,load,out);
    end

endmodule