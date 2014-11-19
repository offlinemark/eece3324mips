`timescale 1ns / 1ns

module add_tb;

reg [31:0] input_a, input_b;
wire [31:0] out;
reg clk;

add a (input_a, input_b, out);

/* Clock */
always
    #10 clk = ~clk;

/* Display alu control unit state */
always @(posedge clk)
    $display("%t:\tinput_a\t%b\n\tinput_b\t%b\n\tout\t%b\n", $time, input_a, input_b, out);

/* Testbench */
initial begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    input_a = 0;
    input_b = 0;

    @(negedge clk)
    input_a = 1;
    input_b = 1;

    @(negedge clk)
    input_a = 4;
    input_b = 9;

    @(negedge clk)
    input_a = 22;
    input_b = 78;

    @(negedge clk)
    input_a = 0;
    input_b = 0;

    #40 $finish;
end

endmodule
