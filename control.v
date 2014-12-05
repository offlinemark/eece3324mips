/*
 * Mark Mossberg
 * 12/5/2014
 * EECE 3324
 *
 * control.v -- cpu control decoder
 */

module control (opcode, regdst, jump, branch, memread, memtoreg, aluop,
                memwrite, alusrc, regwrite, halt);

input [5:0] opcode;
output reg regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite,
           halt;
output reg [1:0] aluop;

always @(opcode)
begin
    /* reset everything to 0 */
    regdst = 0;
    jump = 0;
    branch = 0;
    memread = 0;
    memtoreg = 0;
    memwrite = 0;
    alusrc = 0;
    regwrite = 0;
    aluop = 0;
    halt = 0;

    /* flip on necessary bits */
    case (opcode)
        0: // add, slt
            begin
                regdst = 1;
                regwrite = 1;
                aluop = 2'b10;
            end
        6'b001000:  // addi
            begin
                regwrite = 1;
                alusrc = 1;
            end
        6'b001001: // addiu
            begin
                regwrite = 1;
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
        6'h3f: // hlt
            begin
                halt = 1;
            end
    endcase
end

endmodule
