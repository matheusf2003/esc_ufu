module mux(input a, input b, input sel, output y);

  assign y = a*!sel + b*sel;

endmodule

