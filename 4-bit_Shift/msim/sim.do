vsim -t ns -novopt -lib work work.tb_four_sim_cfg  
view *
do four_wave.do
run 400 ns
