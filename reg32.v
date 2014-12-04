/*
 * Mark Mossberg
 * 11/12/14
 * EECE 3324 - Homework 6
 *
 * 32 bit register
 */

//`timescale 1ns / 1ns

module reg32 (clk, in, enable, reset, out);

input enable, reset, clk;
input [31:0] in;
output reg [31:0] out;

always @(posedge clk or posedge reset)
begin
    if (reset)
        //out <= 32'h3000;
        out <= 12288;
    else if (enable)
        out <= in;
    
end

endmodule
