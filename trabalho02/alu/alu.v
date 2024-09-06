module alu(input [15:0] x, input [15:0] y,
           input zx, input nx, input zy, input ny,
           input f, input no, output reg [15:0] out, output reg zr, output reg ng);
    reg [15:0] x_temp;
    reg [15:0] y_temp;

    always @(*) begin
        x_temp = x;
        y_temp = y;

        if (zx) begin
            x_temp = 16'b0;
        end
        if (nx) begin
            x_temp = ~x_temp;
        end
        if (zy) begin
            y_temp = 16'b0;
        end
        if (ny) begin
            y_temp = ~y_temp;
        end
        if (f) begin
            out = x_temp + y_temp;
        end
        else begin
            out = x_temp & y_temp;
        end
        if (no) begin
            out = ~out;
        end

        // Atribuindo valores a zr e ng
        zr = (out == 16'b0) ? 1 : 0; // zr é 1 se out for zero
        ng = out[15]; // ng é o bit mais significativo de out (indicando sinal negativo)
    end
endmodule