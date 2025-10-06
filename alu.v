module alu (
  input  wire [31:0] a,
  input  wire [31:0] b,
  input  wire [3:0]  alu_ctrl,
  output reg  [31:0] result
);
  always @(*) begin
    case (alu_ctrl)
      4'h0: result = a + b;
      4'h1: result = a - b;
      4'h2: result = a & b;
      4'h3: result = a | b;
      4'h4: result = a ^ b;
      4'h5: result = (a < b) ? 32'd1 : 32'd0; // slt unsigned for simplicity
      default: result = 32'd0;
    endcase
  end
endmodule
