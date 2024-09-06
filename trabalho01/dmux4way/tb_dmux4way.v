//
// Test bench para multiplexador de 2 entradas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "dmux4way.v"

module tb_dmux4way;
  
  // inputs
  reg in_a;
  reg in_sel_0;
  reg in_sel_1;
  // outputs
  wire out_y0;
  wire out_y1;
  wire out_y2;
  wire out_y3;

  // Instancia da UUT (Unit Under Test)
  dmux4way uut (.a(in_a), .sel_0(in_sel_0), .sel_1(in_sel_1), .y0(out_y0), .y1(out_y1), .y2(out_y2), .y3(out_y3));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para multiplexador de duas entradas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_dmux4way);

    # 0  in_a = 1; in_sel_1 = 0; in_sel_0 = 0;
    # 10 in_sel_1 = 0; in_sel_0 = 1;
    # 10 in_sel_1 = 1; in_sel_0 = 0;
    # 10 in_sel_1 = 1; in_sel_0 = 1;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d, sel_1=%d, sel_0=%d, y0=%d, y1=%d, y2=%d, y3=%d \n",$time,in_a,in_sel_1,in_sel_0,out_y0,out_y1,out_y2,out_y3);
  end

endmodule

