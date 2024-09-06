module dmux(input a, input sel, output y0, output y1);

  assign y0 = a & (!sel);
  assign y1 = a & sel;

endmodule

