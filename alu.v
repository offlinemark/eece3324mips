/*
 * Mark Mossberg
 * 11/13/14
 * EECE 3324 - Homework 6
 *
 * ALU
 */

module alu (control, input1, input2, result, zero);

input [3:0] control;
input [31:0] input1, input2;
output zero;
output reg [31:0] result;

assign zero = (result == 0);

always @(control or input1 or input2)
begin
    case (control)
        4'b0010: result <= input1 + input2;
        4'b0110: result <= input1 - input2;
        4'b0111: result <= ((input1 < input2) ? 1 : 0);
        default: result <= 0;
    endcase
end


endmodule
