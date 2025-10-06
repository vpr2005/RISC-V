module forwarding_unit (
  input  wire [4:0] ex_rs1, ex_rs2,
  input  wire [4:0] mem_rd, wb_rd,
  input  wire mem_regwrite, wb_regwrite,
  output reg  [1:0] forwardA, forwardB
);
  always @(*) begin
    forwardA = 2'b00;
    forwardB = 2'b00;
    if (mem_regwrite && (mem_rd != 0) && (mem_rd == ex_rs1)) forwardA = 2'b01;
    else if (wb_regwrite && (wb_rd != 0) && (wb_rd == ex_rs1)) forwardA = 2'b10;
    if (mem_regwrite && (mem_rd != 0) && (mem_rd == ex_rs2)) forwardB = 2'b01;
    else if (wb_regwrite && (wb_rd != 0) && (wb_rd == ex_rs2)) forwardB = 2'b10;
  end
endmodule
