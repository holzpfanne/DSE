onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_JKD/CLK
add wave -noupdate -format Logic /tb_JKD/D_i
add wave -noupdate -format Logic /tb_JKD/R
add wave -noupdate -format Logic /tb_JKD/Q_D
add wave -noupdate -format Logic /tb_JKD/J
add wave -noupdate -format Logic /tb_JKD/K
add wave -noupdate -format Logic /tb_JKD/Q_JK
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
