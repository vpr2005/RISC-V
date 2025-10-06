`timescale 1ns/1ps
module top_tb;
  reg clk = 0;
  reg rst = 1;
  always #5 clk = ~clk;

  top_pipeline dut(.clk(clk), .rst(rst));

  initial begin
    #10 rst = 0;
    #500 $display("Simulation finished");
    $finish;
  end
endmodule
