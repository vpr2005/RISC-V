# 5-Stage Pipelined RISC-V (RV32I) - Educational Skeleton

Contents:
- rtl/: Verilog RTL modules (top-level, regfile, ALU, forwarding, hazard)
- tb/: SystemVerilog testbench that simulates a small instruction sequence
- asm/: small assembly test programs and hex loader helper

Simulation (Icarus Verilog):
1. Assemble or create a memory image (hex) for imem. Simple examples included in asm/.
2. Run: `iverilog -g2012 -o sim top_tb.sv && vvp sim`
3. View waveforms with GTKWave: `gtkwave dump.vcd`

Synthesis:
- Import `rtl/` files into Vivado and create a project targeting your FPGA.
- The design is a learning skeleton and may need adaptation for specific constraints.

Recommended tools:
- riscv64-unknown-elf-gcc (for assembling tests)
- Icarus Verilog or Verilator
- Vivado for synthesis (Xilinx)

