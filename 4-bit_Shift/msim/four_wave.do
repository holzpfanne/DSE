onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_four/d_i
add wave -noupdate -format Logic /tb_four/en_i
add wave -noupdate -format Logic /tb_four/sh_i
add wave -noupdate -format Logic /tb_four/q_o
add wave -noupdate -format Logic /tb_four/clk
add wave -noupdate -format Logic /tb_four/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
