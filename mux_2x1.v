/*
 * Mark Mossberg
 * 12/5/2014
 * EECE 3324
 *
 * mux_2x1.v -- 32 bit 2-to-1 multiplexer
 */

module mux_2x1 (input_a, input_b, sel, out);

input [31:0] input_a, input_b;
input sel;
output reg [31:0] out;

always @(sel or input_a or input_b )
begin
    if (sel)
        out <= input_b;
    else
        out <= input_a;
end

endmodule
