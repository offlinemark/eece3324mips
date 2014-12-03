module cpu(clk);

input clk;

/*
 * Wires
 */

wire [31:0] pc_in, pc_out, pc4, pc_jump, instr, imm32, alu_in1, alu_in2,
     alu_out, rd_data2, dmem_out, dmem_mux_out, br_offset, br_addr, br_mux_out,
     jmp_mux_out;
wire [15:0] imm16;
wire [5:0] ctl_in, func;
wire [4:0] rd_reg1, rd_reg2, wr_reg, rf_mux_out;
wire [3:0] alu_ctl;
wire [1:0] aluop;
wire  pc_enable, pc_reset, alu_zero, rf_mux_ctl, jmp_mux_ctl, br_ctl,
      br_mux_ctl, dmem_rd, dmem_wr, dmem_mux_ctl, alu_mux_ctl, rf_wr;

/*
 * Assigns
 */

assign pc4 = pc_out + 4;
assign pc_jump = {pc4[31:28], instr[25:0], 2'b00};
assign imm32 = {{16{imm16[15]}}, imm16[15:0]};
assign br_offset = in << 2;
assign br_addr = pc4 + br_offset;
assign br_mux_ctl = br_ctl & alu_zero;

/*
 * Muxes
 */

mux_2x1_5 rf_mux(rd_reg2, wr_reg, rf_mux_ctl, rf_mux_out);
mux_2x1 alu_mux(rd_data2, imm32, alu_mux_ctl, alu_in2);
mux_2x1 dmem_mux(dmem_out, alu_out, dmem_mux_ctl, dmem_mux_out);
mux_2x1 br_mux(pc4, br_addr, br_mux_ctl, br_mux_out);
mux_2x1 jmp_mux(pc_jump, br_mux_out, jmp_mux_ctl, jmp_mux_out);

/*
 * Main Modules
 */

reg32 pc(clk, pc_in, pc_enable, pc_reset, pc_out);
register_file rf(clk, rd_reg1, rd_reg2, rf_mux_out, dmem_mux_out, rf_wr,
                 alu_in1, rd_data2);
alu_control aluctl(aluop, func, alu_ctl);
control ctl(ctl_in, rf_mux_ctl, jmp_mux_ctl, br_ctl, dmem_rd, dmem_mux_ctl,
            aluop, dmem_wr, alu_mux_ctl, rf_wr);
alu alu(alu_ctl, alu_in1, alu_in2, alu_out, alu_zero);

/*
 * Instruction/Data Memory
 */

Memory mem(pc_out, instr, alu_out, rd_data2, dmem_rd, dmem_wr, dmem_out);

endmodule
