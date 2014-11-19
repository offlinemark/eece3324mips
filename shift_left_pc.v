module shift_left_pc (i, pc, out);

input [25:0] i;
input [31:0] pc;
output [31:0] out;

assign out = {pc[31:28], i[25:0], 2'b00};

endmodule
