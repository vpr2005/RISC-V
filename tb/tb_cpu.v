// tb_cpu.v
`timescale 1ns/1ps

module tb_cpu;

reg clk = 0;
reg rst;

cpu_top uut (
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial begin
    rst = 1;
    #20;
    rst = 0;

    // Simulation time
    #500;
    $finish;
end

endmodule
