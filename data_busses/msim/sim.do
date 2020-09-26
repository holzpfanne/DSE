vsim -t ns -novopt -lib work work.tb_busses_sim_cfg  
view *
do busses_wave.do
run 3000 ns
