module ram512(input [15:0] in, input [8:0] address, input load, output reg [15:0] out);
    reg [15:0] ram [511:0];

    always @ (*) begin
        if (load) begin
            ram[address] <= in;
        end
        out = ram[address];
    end

endmodule