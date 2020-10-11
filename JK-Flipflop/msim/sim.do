vsim -t ns -novopt -lib work work.tb_JKD_sim_cfg  
view *
do JKD_wave.do
run 600 ns
