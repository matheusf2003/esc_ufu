`include "register.v"

module tb_register;

    // inputs
    reg [15:0] in;
    reg load;
    
    // outputs
    wire [15:0] out;

    // Instancia da UUT (Unit Under Test)
    register uut (.in(in), .load(load), .out(out));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("Testbench para register");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_register);

        # 0 in = $random; load = 1;

        for (integer i = 0; i < 10; i = i + 1) begin
            in = $random;

            # 4 load = $random;
        end

        # 5 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tin=%d,load=%d,out=%d \n",$time,in,load,out);
    end

endmodule