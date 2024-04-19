onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -radix unsigned /tb_rcv_block/tb_clk
add wave -noupdate -color Gold -radix unsigned /tb_rcv_block/tb_n_rst
add wave -noupdate -divider {TB Signals}
add wave -noupdate -radix unsigned /tb_rcv_block/tb_test_num
add wave -noupdate -radix unsigned /tb_rcv_block/tb_test_bit_period
add wave -noupdate -radix unsigned /tb_rcv_block/tb_test_stop_bit
add wave -noupdate -radix unsigned /tb_rcv_block/tb_data_read
add wave -noupdate -color {Medium Orchid} -radix binary /tb_rcv_block/tb_test_data
add wave -noupdate -color {Medium Orchid} -radix unsigned /tb_rcv_block/tb_serial_in
add wave -noupdate -divider Outputs
add wave -noupdate -expand -group Data -color {Cornflower Blue} -radix unsigned /tb_rcv_block/tb_rx_data
add wave -noupdate -expand -group Data -color {Cornflower Blue} -radix symbolic /tb_rcv_block/tb_expected_rx_data
add wave -noupdate -color {Cornflower Blue} -radix unsigned /tb_rcv_block/tb_framing_error
add wave -noupdate -color {Cornflower Blue} -radix unsigned /tb_rcv_block/tb_expected_framing_error
add wave -noupdate -color {Cornflower Blue} -radix unsigned /tb_rcv_block/tb_data_ready
add wave -noupdate -color {Cornflower Blue} -radix unsigned /tb_rcv_block/tb_expected_data_ready
add wave -noupdate -color {Cornflower Blue} -radix unsigned /tb_rcv_block/tb_overrun_error
add wave -noupdate -color {Cornflower Blue} -radix unsigned /tb_rcv_block/tb_expected_overrun
add wave -noupdate -radix unsigned /tb_rcv_block/tb_test_data_read
add wave -noupdate /tb_rcv_block/DUT/dut4/shift_strobe
add wave -noupdate /tb_rcv_block/DUT/dut4/packet_done
add wave -noupdate /tb_rcv_block/DUT/dut1/dut/parallel_out
add wave -noupdate /tb_rcv_block/DUT/dut5/current_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26250 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 197
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {186138 ps}
