module ram4k(input [15:0] in, input [11:0] address, input load, output reg [15:0] out);
    reg [15:0] ram [4095:0];

    always @ (*) begin
        if (load) begin
            ram[address] <= in;
        end
        out = ram[address];
    end

endmodule