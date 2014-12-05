/*
 * Mark Mossberg
 * 11/13/14
 * EECE 3324 - Homework 6
 *
 * ALU testbench
 */

`timescale 1ns / 1ns

module alu_tb;

reg [3:0] control;
reg [31:0] input1, input2;
wire zero;
wire [31:0] result;

reg clk;

alu a (control, input1, input2, result, zero);

/* Clock */
always
    #10 clk = ~clk;

/* Display alu control unit state */
always @(posedge clk)
    $display("%t:\tcontrol\t%b\n\tinput1\t%b\n\tinput2\t%b\n\tresult\t%b\n\tzero\t%b\n",
             $time, control, input1, input2, result, zero);

/* Testbench */
initial begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    control = 0;
    input1 = 0;
    input2 = 0;

    @(negedge clk)
    input1 = 1;
    input2 = 1;
    control = 2; // add

    @(negedge clk)
    control = 6; // beq

    @(negedge clk)
    input1 = 4;
    control = 2;

    @(negedge clk)
    control = 6;

    @(negedge clk)
    control = 7; // slt

    @(negedge clk)
    input1 = 1;
    input2 = 4;

    @(negedge clk)
    input1 = 4;
    input2 = 1;

    @(negedge clk)
    input1 = 32'h80000004;
    input2 = 1;

    @(negedge clk)
    input1 = 1;
    input2 = 32'h80000004;

    @(negedge clk)
    input1 = 32'h80000005;
    input2 = 32'h80000004;

    @(negedge clk)
    input1 = 32'h80000004;
    input2 = 32'h80000005;

    @(negedge clk)
    control = 0;
    input1 = 0;
    input2 = 0;

    #40 $finish;
end

endmodule
