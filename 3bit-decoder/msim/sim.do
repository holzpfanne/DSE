vsim -t ns -novopt -lib work work.tb_decoder_sim_cfg  
view *
do decoder_wave.do
run 3000 ns
