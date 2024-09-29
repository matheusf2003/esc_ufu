`include "../cpu/cpu.v"
`include "../memory/memory.v"

module computer(input reset, input clk);
    wire [15:0] outM, addressM, pc;
    wire writeM;
    wire [15:0] inM;
    wire [15:0] instruction;
    reg [15:0] ROM32k [0:32767];



    cpu CPU(.clk(clk), .inM(inM), .instruction(ROM32k[pc]), .reset(reset), .outM(outM), .writeM(writeM), .addressM(addressM), .pc(pc));
    memory Memory(.clk(clk), .inM(outM), .address(addressM), .load(writeM), .outM(inM));
    initial begin
        $readmemh("Add.hack", ROM32k);
    end


endmodule