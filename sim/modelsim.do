vlib work
vlog ../src/*.v ../tb/tb_cpu.v
vsim tb_cpu
add wave *
run -all
