`timescale 1ns/1ps
module top_pipeline (
  input wire clk, rst
);
  // This is a compact top for simulation/demo only.
  // Instruction memory: simple ROM with a few 32-bit words (replace with real imem)
  reg [31:0] imem [0:15];
  initial begin
    imem[0] = 32'h00500113; // addi x2, x0, 5  (example)
    imem[1] = 32'h002081b3; // add x3, x1, x2
    imem[2] = 32'h00310233; // add x4, x2, x3
    imem[3] = 32'h0000006f; // jal x0, 0  (infinite loop)
  end

  reg [31:0] pc;
  wire [31:0] instr = imem[pc[5:2]];

  // Minimal pipeline registers (IF/ID simplified)
  reg [31:0] if_id_instr;
  reg [31:0] id_ex_rd1, id_ex_rd2;
  reg [4:0]  id_ex_rs1, id_ex_rs2, id_ex_rd;
  reg [6:0]  id_ex_opcode;
  reg        ex_mem_regwrite;
  reg [4:0]  ex_mem_rd;

  // Instantiate regfile, alu
  regfile rf(.clk(clk), .we(1'b1), .ra1(if_id_instr[19:15]), .ra2(if_id_instr[24:20]),
             .wa(5'd0), .wd(32'd0), .rd1(), .rd2());

  // Very small state machine to step PC and move pipeline registers
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      pc <= 0;
      if_id_instr <= 0;
    end else begin
      if_id_instr <= instr;
      pc <= pc + 1;
    end
  end

endmodule
