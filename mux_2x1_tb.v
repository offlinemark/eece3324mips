/*
 * Mark Mossberg
 * 11/12/14
 * EECE 3324 - Homework 6
 *
 * 32 bit 2-to-1 multiplexer testbench
 */

`timescale 1 ns / 1ns

module mux_2x1_tb;

reg [31:0] input_a, input_b;
reg sel;
wire [31:0] out; 

mux_2x1 mux (input_a, input_b, sel, out);

initial begin
    input_a = 0;
    input_b = 0;
    sel = 0;
    $display("Output Q: %b", out);

    #10
    input_a = 1;
    input_b = 0;
    sel = 0;
    $display("Output Q: %b", out);

    #10
    input_a = 0;
    input_b = 0;
    sel = 0;
    $display("Output Q: %b", out);

    #10
    input_a = 0;
    input_b = 1;
    sel = 1;
    $display("Output Q: %b", out);
end

endmodule
