//
// Test bench para multiplexador de 2 entradas
//
// Dicas:
// https://www.referencedesigner.com/tutorials/verilog/verilog_62.php

// modulos usados
`include "dmux.v"

module tb_dmux;
  
  // inputs
  reg in_a;
  reg in_sel;
  // outputs
  wire out_y0;
  wire out_y1;

  // Instancia da UUT (Unit Under Test)
  dmux uut (.a(in_a), .sel(in_sel), .y0(out_y0), .y1(out_y1));

  // Como os sinais irao variar durante a simulacao
  initial begin
    $display("Testbench para multiplexador de duas entradas");
    $dumpfile("signals.vcd");
    $dumpvars(0,tb_dmux);

    # 0 in_a = 0; in_sel = 0;
    # 10 in_a = 0; in_sel = 1;
    # 10 in_a = 1; in_sel = 0;
    # 10 in_a = 1; in_sel = 1;

    # 10 $finish;
  end

  // Monitora os sinais
  initial begin
    $monitor("t=%03d: \ta=%d,sel=%d,y0=%d,y1=%d \n",$time,in_a,in_sel,out_y0,out_y1);
  end

endmodule

