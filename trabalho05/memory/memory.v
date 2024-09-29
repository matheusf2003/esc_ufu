module memory (input clk, input [15:0] inM, input [15:0] address, input load, output [15:0] outM);

    reg [15:0] mem[0:32767];

    always @ (posedge clk) begin
        if (load) begin
            mem[address] <= inM;
        end
    end

    assign outM = mem[address];

endmodule
