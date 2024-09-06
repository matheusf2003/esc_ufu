`include "pc.v"

module tb_pc;

    // inputs
    reg [15:0] in_in;
    reg in_load;
    reg in_inc;
    reg in_reset;
    reg in_clk;

    // outputs
    wire [15:0] out_out;

    // Instancia da UUT (Unit Under Test)
    pc utt (.in(in_in), .load(in_load), .inc(in_inc), .reset(in_reset), .out(out_out), .clk(in_clk));

    initial begin
        $display("Testbench para pc");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_pc);

        # 0 in_in = $random; in_load = 0; in_inc = 0; in_reset = 0; in_clk = 0;

        for (integer i = 0; i < 40; i = i + 1) begin
            # 2 in_in = $random; in_inc = $random; in_load = !in_inc; in_clk = 1;
            # 2 in_clk = 0;
        end

        # 5 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tin_in=%d,in_load=%d,in_inc=%d,in_reset=%d,out_out=%d \n",$time,in_in,in_load,in_inc,in_reset,out_out);
    end

endmodule