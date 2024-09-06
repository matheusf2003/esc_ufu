//
// Test bench para multiplexador de 2 entradas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "dmux8way.v"

module tb_dmux8way;
  
  // inputs
  reg in_a;
  reg in_sel_0;
  reg in_sel_1;
  reg in_sel_2;
  // outputs
  wire out_y0;
  wire out_y1;
  wire out_y2;
  wire out_y3;
  wire out_y4;
  wire out_y5;
  wire out_y6;
  wire out_y7;

  // Instancia da UUT (Unit Under Test)
  dmux8way uut (.a(in_a), .sel_0(in_sel_0), .sel_1(in_sel_1), .sel_2(in_sel_2),
   .y0(out_y0), .y1(out_y1), .y2(out_y2), .y3(out_y3),
   .y4(out_y4), .y5(out_y5), .y6(out_y6), .y7(out_y7));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para multiplexador de duas entradas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_dmux8way);

    # 0  in_a = 1; in_sel_2 = 0; in_sel_1 = 0; in_sel_0 = 0;
    # 10 in_sel_2 = 0; in_sel_1 = 0; in_sel_0 = 1;
    # 10 in_sel_2 = 0; in_sel_1 = 1; in_sel_0 = 0;
    # 10 in_sel_2 = 0; in_sel_1 = 1; in_sel_0 = 1;
    # 10 in_sel_2 = 1; in_sel_1 = 0; in_sel_0 = 0;
    # 10 in_sel_2 = 1; in_sel_1 = 0; in_sel_0 = 1;
    # 10 in_sel_2 = 1; in_sel_1 = 1; in_sel_0 = 0;
    # 10 in_sel_2 = 1; in_sel_1 = 1; in_sel_0 = 1;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d, sel_2=%d, sel_1=%d, sel_0=%d, y0=%d, y1=%d, y2=%d, y3=%d, \
    y4=%d, y5=%d, y6=%d, y7=%d\n",$time,in_a,in_sel_2,in_sel_1,in_sel_0,
    out_y0,out_y1,out_y2,out_y3,out_y4,out_y5,out_y6,out_y7);
  end

endmodule

