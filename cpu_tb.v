`timescale 1ns/100ps

module cpu_tb;

reg clk, rst;
integer cycles, instrs;

initial
begin
	clk = 1;
 	rst = 0;
	cycles = 0;
	instrs = 0;

	// Set CPU to start executing at 0x00003000
	#1 rst = 1;
	#1 rst = 0;

	// Cleanly finish half clock cycle
	#48 clk = 1;
end

// clk
always #50 clk = ~clk;

always @(posedge clk)
begin
cycles = cycles + 1;
instrs = instrs + 1;
$display("\ncycles: %d", cycles);
$display("instructions: %d", instrs);
$display("CPI: %d", cycles/instrs);
end

cpu c(clk, rst);

endmodule
