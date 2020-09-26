onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_busses/a_i
add wave -noupdate -format Logic /tb_busses/b_i
add wave -noupdate -format Logic /tb_busses/c_i
add wave -noupdate -format Logic /tb_busses/d_i
add wave -noupdate -format Logic /tb_busses/d_o
add wave -noupdate -format Logic /tb_busses/e_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
