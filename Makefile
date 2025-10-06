# Simple Makefile to run simulation (Icarus)
SIM=iverilog
SIMFLAGS=-g2012
TB=tb/top_tb.sv
RTL=$(wildcard rtl/*.v)

all: sim

sim:
	$(SIM) $(SIMFLAGS) -o sim $(TB) $(RTL)
	vvp sim

clean:
	rm -f sim a.out *.vcd
