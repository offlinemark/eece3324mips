/*
 * Mark Mossberg
 * 12/5/2014
 * EECE 3324
 *
 * reg32.v -- 32 bit register
 */

module reg32 (clk, in, enable, reset, out);

input enable, reset, clk;
input [31:0] in;
output reg [31:0] out;

always @(posedge clk or posedge reset)
begin
    if (reset)
        out <= 32'h3000;
    else if (enable)
        out <= in;
end

endmodule
