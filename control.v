/*
 * Mark Mossberg
 * 11/13/14
 * EECE 3324 - Homework 6
 *
 * Control unit
 */

module control (opcode, regdst, jump, branch, memread, memtoreg, aluop,
                memwrite, alusrc, regwrite);

input [5:0] opcode;
output reg regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite;
output reg [1:0] aluop;

always @(opcode)
begin
    // reset everything to 0
    regdst = 0;
    jump = 0;
    branch = 0;
    memread = 0;
    memtoreg = 0;
    memwrite = 0;
    alusrc = 0;
    regwrite = 0;
    aluop = 0;

    // flip on necessary bits
    case (opcode)
        0: // add, slt
            begin
                regdst = 1;
                regwrite = 1;
                aluop = 2'b10;
            end
        6'b001000:  // addi
            begin
                $display("FS");
                regwrite = 1;
                aluop = 2'b10;
                alusrc = 1;
            end
        6'b000010: jump = 1; // j
        6'b000100:  // beq
            begin
                branch = 1;
                aluop = 2'b01;
            end
        6'b100011: // lw
            begin
                memread = 1;
                memtoreg = 1;
                regwrite = 1;
                alusrc = 1;
            end
        6'b101011: // sw
            begin
                memwrite = 1;
                alusrc = 1;
            end
    endcase
end

endmodule
