/*
 * Mark Mossberg
 * 11/13/14
 * EECE 3324 - Homework 6
 *
 * ALU Control testbench
 */

module alu_control (op, func, out);

input [1:0] op;
input [5:0] func;
output [3:0] out;
reg [3:0] out;

always @(op or func)
begin
    case (op)
        2'b00: out = 4'b0010; // lw, sw, addi
        2'b01: out = 4'b0110; // beq
        2'b10: // add, addi, slt
        begin
            case (func)
                6'b100000: out = 4'b0010; // add
                6'b101010: out = 4'b0111; // slt
            endcase
        end
        default:
            out = 0;
    endcase
end

endmodule
