/*
 * Mark Mossberg
 * 11/12/14
 * EECE 3324 - Homework 6
 *
 * 32 bit register
 */

`timescale 1ns / 1ns

module reg32 (clk, in, out, enable, reset);

input enable, reset, clk;
input [31:0] in;
output reg [31:0] out;

always @(posedge clk)
begin
    if (reset)
        out <= 0;
    else begin
        out <= in;
    end
end

endmodule
