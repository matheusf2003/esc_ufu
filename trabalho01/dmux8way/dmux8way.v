module dmux8way(input a, input sel_0, input sel_1, input sel_2,
output y0, output y1, output y2, output y3,
output y4, output y5, output y6, output y7);

  assign y0 = a & (!sel_0 & !sel_1 & !sel_2);
  assign y1 = a & (sel_0 & !sel_1 & !sel_2);
  assign y2 = a & (!sel_0 & sel_1 & !sel_2);
  assign y3 = a & (sel_0 & sel_1 & !sel_2);
  assign y4 = a & (!sel_0 & !sel_1 & sel_2);
  assign y5 = a & (sel_0 & !sel_1 & sel_2);
  assign y6 = a & (!sel_0 & sel_1 & sel_2);
  assign y7 = a & (sel_0 & sel_1 & sel_2);

endmodule
