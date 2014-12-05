/*
 * Mark Mossberg
 * 11/12/14
 * EECE 3324 - Homework 6
 *
 * Register file testbench
 */

`timescale 1ns / 1ns

module register_file_tb;

reg clk, write_enable;
reg [4:0] read1, read2, write;
reg [31:0] write_data;
wire [31:0] read_data1, read_data2;

register_file rf(clk, read1, read2, write, write_data, write_enable, read_data1,
              read_data2);

/* Clock */
always
    #10 clk = ~clk;

/* Display RF state */
always @(read1 or read2 or write or write_data)
    $display("%t:\tread1\t\t%b\n\tread2\t\t%b\n\twrite\t\t%b\n\twrite_data\t%b\n\twrite_enable\t%b\n\tread_data1\t%b\n\tread_data2\t%b\n",
             $time, read1, read2, write, write_data,write_enable, read_data1, read_data2);

/* Testbench */
initial begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    read1 = 0;
    read2 = 0;
    write = 0;
    write_data = 0;
    write_enable = 0;

    @(negedge clk)
    write = 0;
    write_data = 3;
    write_enable = 1;

    @(negedge clk)
    write = 0;
    write_data = 7;
    write_enable = 1;

    @(negedge clk)
    write = 0;
    write_data = 15;
    write_enable = 1;

    @(negedge clk)
    write = 0;
    write_data = 5;
    write_enable = 0;

    @(negedge clk)
    read1 = 1;

    @(negedge clk)
    read1 = 0;
    write = 1;
    write_data = 8'hff;
    write_enable = 1;

    @(negedge clk)
    read1 = 1;
    read2 = 1;

    @(negedge clk)
    clk = 0;
    read1 = 0;
    read2 = 0;
    write = 0;
    write_data = 0;
    write_enable = 0;

    #40 $finish;
end

endmodule
