# 5-Stage Pipelined RISC-V Processor (RV32I)

Verilog implementation of a 5-stage pipelined RISC-V processor with hazard detection and forwarding.

**Tools:** Verilog, ModelSim, Xilinx Vivado

## Features
- Supports RV32I ISA
- 5 pipeline stages: IF, ID, EX, MEM, WB
- Hazard detection for load-use and branch hazards
- Forwarding logic to reduce stalls
- Verified with custom assembly and ModelSim simulation

## File structure
- `src/cpu_top.v` – Top-level processor module
- `src/stage_*.v` – Pipeline stage modules
- `src/hazard_unit.v` – Hazard detection
- `src/forwarding_unit.v` – Forwarding logic
- `tb/tb_cpu.v` – Testbench
- `sim/modelsim.do` – ModelSim simulation script
- `synth/vivado_constraints.xdc` – Example constraints

## Usage
Simulate:
```bash
vsim -do sim/modelsim.do
```

Synthesize in Vivado:
- Create new project
- Add `src/*.v`
- Apply constraints from `synth/vivado_constraints.xdc`

## License
MIT
