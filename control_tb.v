/*
 * Mark Mossberg
 * 11/12/14
 * EECE 3324 - Homework 6
 *
 * Control unit testbench
 */

`timescale 1ns / 1ns

module control_tb;

reg [5:0] opcode;
output regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite;
output [1:0] aluop;

reg clk;

control ctrl(opcode, regdst, jump, branch, memread, memtoreg, aluop,
                memwrite, alusrc, regwrite);

/* Clock */
always
    #10 clk = ~clk;

/* Display control unit state */
always @(posedge clk)
    $display("%t:\topcode\t\t%b\n\tregdst\t\t%b\n\tjump\t\t%b\n\tbranch\t\t%b\n\tmemread\t\t%b\n\tmemtoreg\t%b\n\tmemwrite\t%b\n\talusrc\t\t%b\n\tregwrite\t%b\n\taluop\t\t%b\n",
             $time, opcode, regdst, jump, branch, memread, memtoreg, memwrite,
             alusrc, regwrite, aluop);

/* Testbench */
initial begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    opcode = 0;

    @(negedge clk)
    opcode = 6'b001000;  // addi

    @(negedge clk)
    opcode = 6'b000010; // j

    @(negedge clk)
    opcode = 6'b000100;  // beq

    @(negedge clk)
    opcode = 6'b100011; // lw

    @(negedge clk)
    opcode = 6'b101011; // sw

    @(negedge clk)
    opcode = 0;

    #40 $finish;
end

endmodule
