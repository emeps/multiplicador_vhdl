onerror {quit -f}
vlib work
vlog -work work somador.vo
vlog -work work somador.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.somador_vlg_vec_tst
vcd file -direction somador.msim.vcd
vcd add -internal somador_vlg_vec_tst/*
vcd add -internal somador_vlg_vec_tst/i1/*
add wave /*
run -all
