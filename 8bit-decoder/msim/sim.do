vsim -t ns -novopt -lib work work.tb_eight_bit_sim_cfg  
view *
do eight_bit_wave.do
run 600 ns
