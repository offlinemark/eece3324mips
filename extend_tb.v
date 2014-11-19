`timescale 1ns / 1ns

module extend_tb;

reg [15:0] in;
wire [31:0] out;
reg clk;

extend e (in, out);

/* Clock */
always
    #10 clk = ~clk;

/* Display alu control unit state */
always @(posedge clk)
    $display("%t:\tin\t%b\n\tout\t%b\n", $time, in, out);

/* Testbench */
initial begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    in = 0;

    @(negedge clk)
    in = 6;

    @(negedge clk)
    in = 16'hffff;

    @(negedge clk)
    in = 16'h7fff;

    @(negedge clk)
    in = 0;

    #40 $finish;
end

endmodule
