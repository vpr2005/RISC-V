module regfile (
  input  wire clk,
  input  wire we,
  input  wire [4:0] ra1, ra2, wa,
  input  wire [31:0] wd,
  output wire [31:0] rd1, rd2
);
  reg [31:0] rf [31:0];
  integer i;
  initial begin
    for (i=0; i<32; i=i+1) rf[i] = 0;
  end
  assign rd1 = (ra1==0) ? 32'b0 : rf[ra1];
  assign rd2 = (ra2==0) ? 32'b0 : rf[ra2];
  always @(posedge clk) begin
    if (we && (wa != 0)) rf[wa] <= wd;
  end
endmodule
