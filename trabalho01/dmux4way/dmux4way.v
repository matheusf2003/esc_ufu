module dmux4way(input a, input sel_0, input sel_1, output y0, output y1, output y2, output y3);

  assign y0 = a & (!sel_0 & !sel_1);
  assign y1 = a & (sel_0 & !sel_1);
  assign y2 = a & (!sel_0 & sel_1);
  assign y3 = a & (sel_0 & sel_1);

endmodule
