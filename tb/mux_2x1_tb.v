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

reg clk;

mux_2x1 mux (input_a, input_b, sel, out);

/* Clock */
always
    #10 clk = ~clk;

/* Display mux state */
always @(input_a or input_b or sel)
    $display("%t:\tsel\t%b\n\tinput_a\t%b\n\tinput_b\t%b\n\tout\t%b\n",
             $time, sel, input_a, input_b, out);

/* Testbench */
initial begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    input_a = 0;
    input_b = 0;
    sel = 0;

    @(posedge clk)
    input_a = 1;
    input_b = 0;
    sel = 0;

    @(posedge clk)
    input_a = 0;
    input_b = 0;
    sel = 0;

    @(posedge clk)
    input_a = 0;
    input_b = 1;
    sel = 1;

    @(posedge clk)
    input_a = 0;
    input_b = 0;
    sel = 0;

    $finish;
end

endmodule
