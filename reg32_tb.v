/*
 * Mark Mossberg
 * 11/12/14
 * EECE 3324 - Homework 6
 *
 * 32 bit register testbench
 */

`timescale 1ns / 1ns

module reg32_tb;

reg clk;
reg enable, reset;
reg [31:0] in;
wire [31:0] out;

reg32 r (clk, in, enable, reset, out);

/* Clock */
always
    #10 clk = ~clk;

/* Display mux state */
always @(in or enable or reset)
    $display("%t:\tin\t%b\n\tenable\t%b\n\treset\t%b\n\tout\t%b\n",
             $time, in, enable, reset, out);

/* Testbench */
initial begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    reset = 0;  
    enable = 0;
    in = 0;

    @(negedge clk)
    in = 1;
    enable = 1;

    @(negedge clk)
    in = 0;
    
    @(negedge clk)
    in = 2;

    @(negedge clk)
    in = 3;

    @(negedge clk)
    reset = 1;
    
    @(negedge clk)
    reset = 0;  
    enable = 0;
    in = 0;

    $finish;
end

endmodule
