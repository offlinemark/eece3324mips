CC = iverilog

# single modules
$(MOD):
	$(CC) $(MOD).v $(MOD)_tb.v
	./a.out

# whole cpu
cpu:
	$(CC) -s cpu cpu.v mux_2x1.v reg32.v memory1.v alu_control.v alu.v \
		  register_file.v control.v mux_2x1_5.v cpu_tb.v
