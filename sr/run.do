
	vlib work
	vlog sr_ms_tb.v
	vsim -voptargs="+acc" work.tb
	add wave -r *
	run -all


