`timescale 1ns / 1ns

module shift_left_pc_tb;

reg [25:0] i;
reg [31:0] pc;
wire [31:0] out;

reg clk;

shift_left_pc s (i, pc, out);

/* Clock */
always
    #10 clk = ~clk;

/* Display alu control unit state */
always @(posedge clk)
    $display("%t:\ti\t%b\n\tpc\t%b\n\tout\t%b\n", $time, i, pc, out);

/* Testbench */
initial begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    i = 0;
    pc = 0;

    @(negedge clk)
    i = 7;
    pc = 32'hf0000000;

    @(negedge clk)
    i = 23337;
    pc = 32'h50000000;

    @(negedge clk)
    i = 0;
    pc = 0;

    #40 $finish;
end

endmodule
