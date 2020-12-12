onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_calculator/clk_i
add wave -noupdate -format Logic /tb_calculator/reset_i
add wave -noupdate -format Logic /tb_calculator/ss_o
add wave -noupdate -format Logic /tb_calculator/ss_sel_o
add wave -noupdate -format Logic /tb_calculator/led_o
add wave -noupdate -format Logic /tb_calculator/pb_i
add wave -noupdate -format Logic /tb_calculator/sw_i
add wave -position end  sim:/tb_calculator/i_calculator/i_alu/result_o
add wave -position end  sim:/tb_calculator/i_calculator/i_alu/overflow_o
add wave -position end  sim:/tb_calculator/i_calculator/i_alu/error_o
add wave -position end  sim:/tb_calculator/i_calculator/i_alu/finished_o
add wave -position end  sim:/tb_calculator/i_calculator/i_alu/start_i
add wave -position end  sim:/tb_calculator/i_calculator/i_alu/op1_i
add wave -position end  sim:/tb_calculator/i_calculator/i_alu/op2_i
add wave -position end  sim:/tb_calculator/i_calculator/i_alu/opttype_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
