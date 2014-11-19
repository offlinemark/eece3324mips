`timescale 1ns / 1ns

module pc (in, clk, out);

input in, clk;
output reg out;

always @(posedge clk)
    out <= in;

endmodule
