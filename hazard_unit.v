module hazard_unit (
  input  wire [4:0] id_rs1, id_rs2,
  input  wire [4:0] ex_rd,
  input  wire ex_memread,
  output reg  stall
);
  always @(*) begin
    stall = 0;
    if (ex_memread && (ex_rd != 0) && ((ex_rd == id_rs1) || (ex_rd == id_rs2)))
      stall = 1;
  end
endmodule
