
	vlib work
	vlog jk_tb.v
	vsim -voptargs="+acc" work.tb
	add wave -r *
	run -all


