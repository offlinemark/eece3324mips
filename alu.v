/*
 * Mark Mossberg
 * 11/13/14
 * EECE 3324 - Homework 6
 *
 * ALU
 */

module alu (control, input_a, input_b, result, zero);

input [3:0] control;
input [31:0] input_a, input_b;
output zero;
output reg [31:0] result;

assign zero = (result == 0);

always @(control or input_a or input_b)
begin
    case (control)
        4'b0010: result <= input_a + input_b;
        4'b0110: result <= input_a - input_b;
        5'b0111: result <= input_a < input_b;
        default: result <= 0;
    endcase
end


endmodule
