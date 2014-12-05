/*
 * Mark Mossberg
 * 12/5/2014
 * EECE 3324
 *
 * register_file.v -- Register file (32 registers, 32 bits each)
 */

module register_file (clk, read1, read2, write, write_data, write_enable,
                      read_data1, read_data2);

input clk, write_enable;
input [4:0] read1, read2, write;
input [31:0] write_data;
output [31:0] read_data1, read_data2;

reg [5:0] i;
reg [31:0] regfile [31:0];

/* initial clear */
initial
begin
    for (i = 0; i < 32; i=i+1)
        regfile[i] = 0;
end

assign read_data1 = regfile[read1];
assign read_data2 = regfile[read2];

/* writeback */
always @(posedge clk)
begin
    if (write_enable)
        regfile[write] = write_data;
end

endmodule
