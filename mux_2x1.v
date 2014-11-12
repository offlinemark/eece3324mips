/*
 * Mark Mossberg
 * 11/13/14
 * EECE 3324 - Homework 6
 *
 * 32 bit 2-to-1 multiplexer
 */

`timescale 1ns / 1ns

module mux_2x1 (a, b, sel, out);

input [31:0] a, b;
input sel;
output reg [31:0] out;

always @(sel or a or b )
begin
    if (sel)
        out <= b;
    else
        out <= a;
end

endmodule

