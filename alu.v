/*
 * Mark Mossberg
 * 12/5/2014
 * EECE 3324
 *
 * alu.v -- alu module
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
        5'b0111: // slt
            begin
                if (input_a[31] == input_b[31])
                    /* if MSBs are same, do normal comparison on data bits */
                    result <= input_a[30:0] < input_b[30:0];
                else
                    /* if MSBs are different, and input_a's MSB is set, it is less */
                    result <= input_a[31];
            end
        default: result <= 0;
    endcase
end

endmodule
