/*
 * Mark Mossberg
 * 11/12/14
 * EECE 3324 - Homework 6
 *
 * Register file
 */

//`timescale 1ns / 1ns

module register_file (clk, read1, read2, write, write_data, write_enable,
                      read_data1, read_data2);

input clk, write_enable;
input [4:0] read1, read2, write;
input [31:0] write_data;
output [31:0] read_data1, read_data2;

reg [31:0] regfile [31:0];

//initial
//begin
 // for (
//end

assign read_data1 = regfile[read1];
assign read_data2 = regfile[read2];

always @(posedge clk)
begin
    if (write_enable)
        regfile[write] = write_data;
end

endmodule
