`include "ram64.v"

module tb_ram64;

    // inputs
    reg [15:0] in_in;
    reg in_load;
    reg [5:0] in_address;

    // outputs
    wire [15:0] out_out;

    // Instancia da UUT (Unit Under Test)
    ram64 utt (.in(in_in), .address(in_address), .load(in_load), .out(out_out));

    initial begin
        $display("Testbench para ram64");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_ram64);

        # 0 in_in = $random; in_load = 1; in_address = $random;

        for (integer i = 0; i < 40; i = i + 1) begin
            in_in = $random;
            in_address = $random;

            # 4 in_load = $random;
        end

        # 5 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tin_in=%d,in_load=%d,in_address=%d,out_out=%d \n",$time,in_in,in_load,in_address,out_out);
    end
endmodule