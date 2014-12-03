/*
 * Mark Mossberg
 * 11/13/14
 * EECE 3324 - Homework 6
 *
 * 5 bit 2-to-1 multiplexer
 */

`timescale 1ns / 1ns

module mux_2x1_5 (input_a, input_b, sel, out);

input [4:0] input_a, input_b;
input sel;
output reg [4:0] out;

always @(sel or input_a or input_b )
begin
    if (sel)
        out <= input_b;
    else
        out <= input_a;
end

endmodule

