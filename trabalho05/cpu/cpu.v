`include "../../trabalho02/alu/alu.v"
`include "../../trabalho03/PC/pc.v"
`include "../../trabalho01/mux16/mux16.v"
`include "../../trabalho03/register/register.v"

module cpu(input clk, input [15:0] inM, input [15:0] instruction, input reset,
            output [15:0] outM, output writeM, output [15:0] addressM ,output [15:0] pc);

    wire [15:0] A, D, outM;             // Registradores internos A, D e saída da ALU
    wire [15:0] muxA_out, muxAlu_out;   // Saída dos mux's

    wire zr_out, ng_out;                 // Saída da ALU
    reg jump;

    register ARegister(.in(muxA_out), .clk(clk), .load(instruction[5]), .out(A));
    register DRegister(.in(outM), .clk(clk), .load(instruction[4]), .out(D));

    // reg muxA_out = (instruction[15]) ? instruction : A;

    mux16 muxA(.a(instruction[15:0]), .b(outM), .sel(instruction[15]), .y(muxA_out));
    mux16 muxAlu(.a(A), .b(inM), .sel(instruction[12]), .y(muxAlu_out));

    alu ALU(.x(D), .y(muxAlu_out), .zx(instruction[11]), .nx(instruction[10]), .zy(instruction[9]), .ny(instruction[8]), .f(instruction[7]), .no(instruction[6]), .out(outM), .zr(zr_out), .ng(ng_out));

    assign addressM = A;
    assign writeM = instruction[15] & instruction[3];

    always @(*) begin
        case (instruction[2:0])
            3'b000: begin
                jump = 0;
            end
            3'b001: begin
                jump = (!ng_out & !zr_out);
            end
            3'b010: begin
                jump = zr_out;
            end
            3'b011: begin
                jump = !ng_out;
            end
            3'b100: begin
                jump = ng_out;
            end
            3'b101: begin
                jump = zr_out;
            end
            3'b110: begin
                jump = ng_out | zr_out;
            end
            3'b111: begin
                jump = 1;
            end
        endcase
    end

    pc PC(.in(A), .load(jump), .inc(!jump), .reset(reset), .out(pc), .clk(clk));

endmodule