//=========================================================
// Integrated Instruction/Data memory (seperate ports)
//=========================================================
`define EOF 32'hFFFF_FFFF
`define NULL 0
`timescale 1ns/100ps

module Memory(
    inst_addr,
    instr,
	data_addr,
	data_in,
	mem_read,
	mem_write,
	data_out
);

// Interface
input   [4*8:1]  inst_addr;
output  [31:0]  instr;
input   [4*8:1]  data_addr;
input   [31:0]  data_in;
input           mem_read;
input           mem_write;
output  [31:0]  data_out;

wire mem_read1;

// Memory is byte-addressable, instructions are word-aligned
// Memory with 2k 8-bit 
// Data address range: 0x0000 ~ 0x2FFC
// Instruction address range: 0x3000 ~ 0x3FFC
parameter MEM_SIZE=32'h00004000;

integer i;
integer file, r;

reg     [7:0] memory  [0:MEM_SIZE-1];

reg [31:0] data_addr_reg, inst_addr_reg;

reg [12*8:1] rest;
initial
    begin : file_block
      
//	for(i=0; i<2048; i=i+1) begin
//		memory[i] = 8'b0;
//	end    

    //file = $fopen("MinMax.hexdump","r");
    file = $fopen("/Users/Student/mmossber/arch/proj/eece3324mips/MinMax.hexdump", "r");
    if (file == `NULL)
        disable file_block;

    for (i = 0; i < 3 ; i=i+1)
          				begin
            					r = $fscanf(file, "%h  %h %h %h %h %h %h %h %h  %h %h %h %h %h %h %h %h\n", data_addr_reg, memory[data_addr_reg], memory[data_addr_reg+1], memory[data_addr_reg+2], memory[data_addr_reg+3], memory[data_addr_reg+4], memory[data_addr_reg+5], memory[data_addr_reg+6], memory[data_addr_reg+7], memory[data_addr_reg+8], memory[data_addr_reg+9], memory[data_addr_reg+10], memory[data_addr_reg+11], memory[data_addr_reg+12], memory[data_addr_reg+13], memory[data_addr_reg+14], memory[data_addr_reg+15]);
          				end // for first loop
    r = $fscanf(file, "%s\n", rest);
	  for (i = 0; i < 8 ; i=i+1)
      				begin
       					r = $fscanf(file, "%h  %h %h %h %h %h %h %h %h  %h %h %h %h %h %h %h %h\n", inst_addr_reg, memory[inst_addr_reg], memory[inst_addr_reg+1], memory[inst_addr_reg+2], memory[inst_addr_reg+3], memory[inst_addr_reg+4], memory[inst_addr_reg+5], memory[inst_addr_reg+6], memory[inst_addr_reg+7], memory[inst_addr_reg+8], memory[inst_addr_reg+9], memory[inst_addr_reg+10], memory[inst_addr_reg+11], memory[inst_addr_reg+12], memory[inst_addr_reg+13], memory[inst_addr_reg+14], memory[inst_addr_reg+15]);
      				end // for second loop

	  $fclose(file);
    end // initial

// Read data
assign #1 mem_read1 = mem_read;
assign  data_out = (mem_read1) ? {memory[data_addr+3], memory[data_addr+2], memory[data_addr+1], memory[data_addr]} : 32'b0;

//write data
always @ (posedge mem_write or data_addr or data_in)
begin
	if (mem_write ==1) begin 
        #1 memory[data_addr+3] <= data_in[31:24];
        #1 memory[data_addr+2] <= data_in[23:16];
        #1 memory[data_addr+1] <= data_in[15:8];
        #1 memory[data_addr]   <= data_in[7:0];	
     end
	
end

// Read instruction
assign  instr = {memory[inst_addr+3], memory[inst_addr+2], memory[inst_addr+1], memory[inst_addr]} ;

endmodule
