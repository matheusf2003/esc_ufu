`include "alu.v"

module tb_alu;

    // inputs
    reg [15:0] in_x;
    reg [15:0] in_y;
    reg in_zx;
    reg in_nx;
    reg in_zy;
    reg in_ny;
    reg in_f;
    reg in_no;

    // outputs
    wire [15:0] out_out;
    wire out_zr;
    wire out_ng;
    
    // Instancia da UUT (Unit Under Test)
    alu uut (.x(in_x), .y(in_y), .zx(in_zx), .nx(in_nx), .zy(in_zy), .ny(in_ny), .f(in_f), .no(in_no), .out(out_out), .zr(out_zr), .ng(out_ng));

    // Como os sinais irao variar durante a simulacao
    initial begin
        $display("Testbench para alu");
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_alu);

        # 0 in_x = $random; in_y = $random; in_zx = 0; in_nx = 0; in_zy = 0; in_ny = 0; in_f = 0; in_no = 0;    // x&y
        # 10 in_zx = 0; in_nx = 1; in_zy = 0; in_ny = 1; in_f = 0; in_no = 1;   // x|y
        # 10 in_zx = 0; in_nx = 0; in_zy = 0; in_ny = 0; in_f = 1; in_no = 0;   // x+y
        # 10 in_zx = 0; in_nx = 1; in_zy = 0; in_ny = 0; in_f = 1; in_no = 1;   // x-y
        # 10 in_zx = 0; in_nx = 0; in_zy = 0; in_ny = 1; in_f = 1; in_no = 1;   // y-x
        # 10 in_zx = 0; in_nx = 0; in_zy = 1; in_ny = 1; in_f = 0; in_no = 1;   // !x
        # 10 in_zx = 0; in_nx = 0; in_zy = 1; in_ny = 1; in_f = 1; in_no = 1;   // -x
        # 10 in_zx = 1; in_nx = 1; in_zy = 0; in_ny = 0; in_f = 0; in_no = 0;   // y

        # 10 $finish;
    end

    // Monitora os sinais
    initial begin
        $monitor("t=%03d: \tx=%d,y=%d,zx=%d,nx=%d,zy=%d,ny=%d,f=%d,no=%d,out=%d,zr=%d,ng=%d \n",$time,in_x,in_y,in_zx,in_nx,in_zy,in_ny,in_f,in_no,out_out,out_zr,out_ng);
    end

endmodule
    