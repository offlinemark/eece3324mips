module add (input_a, input_b, out);

input [31:0] input_a, input_b;
output reg [31:0] out;

always @(input_a or input_b)
    out = input_a + input_b;

endmodule
