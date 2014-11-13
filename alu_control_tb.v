/*
 * Mark Mossberg
 * 11/13/14
 * EECE 3324 - Homework 6
 *
 * ALU Control testbench
 */

`timescale 1ns / 1ns

module alu_control_tb;

reg addi;
reg [1:0] op;
reg [5:0] func;
wire [3:0] out;

reg clk;

alu_control aluctrl (op, func, addi, out);

/* Clock */
always
    #10 clk = ~clk;

/* Display alu control unit state */
always @(posedge clk)
    $display("%t:\top\t%b\n\tfunc\t%b\n\taddi\t%b\n\tout\t%b\n", $time, op,
             func, addi, out);

/* Testbench */
initial begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    op = 0;
    func = 0;
    addi = 0;

    @(negedge clk)
    op = 2;
    func = 6'b100000;

    @(negedge clk)
    op = 2;
    addi = 1;

    @(negedge clk)
    addi = 0;
    op = 2;
    func = 6'b101010;

    @(negedge clk)
    op = 1;

    @(negedge clk)
    op = 0;

    @(negedge clk)
    op = 0;
    func = 0;

    #40 $finish;
end

endmodule
