onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb/f/wclk
add wave -noupdate -radix binary /tb/f/rclk
add wave -noupdate -radix binary /tb/f/rst
add wave -noupdate -radix binary /tb/f/w_en
add wave -noupdate -radix binary /tb/f/r_en
add wave -noupdate -radix binary /tb/f/wdata
add wave -noupdate -radix binary /tb/f/rdata
add wave -noupdate -radix binary /tb/f/full
add wave -noupdate -radix binary /tb/f/empty
add wave -noupdate -radix binary /tb/f/wr_tog
add wave -noupdate -radix binary /tb/f/rd_tog
add wave -noupdate -radix binary /tb/f/w_er
add wave -noupdate -radix binary /tb/f/r_er
add wave -noupdate -radix binary /tb/dut/rd_data
add wave -noupdate -radix binary /tb/dut/wr_er
add wave -noupdate -radix binary /tb/dut/rd_er
add wave -noupdate -radix binary /tb/dut/full
add wave -noupdate -radix binary /tb/dut/empty
add wave -noupdate -radix binary /tb/dut/rd_tog
add wave -noupdate -radix binary /tb/dut/wr_tog
add wave -noupdate -radix binary /tb/dut/j
add wave -noupdate -radix binary /tb/dut/rd_tog_wr_clk
add wave -noupdate -radix binary /tb/dut/wr_tog_rd_clk
add wave -noupdate -radix binary /tb/dut/wr_ptr
add wave -noupdate -radix binary /tb/dut/rd_ptr
add wave -noupdate -radix binary /tb/dut/wr_ptr_g
add wave -noupdate -radix binary /tb/dut/rd_ptr_g
add wave -noupdate -radix binary /tb/dut/wr_ptr_rd_clk
add wave -noupdate -radix binary /tb/dut/rd_ptr_wr_clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {111 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {332 ns}
