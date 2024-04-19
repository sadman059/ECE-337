onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_enqueue_transaction
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_transaction_write
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_transaction_fake
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_transaction_addr
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_transaction_data
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_transaction_error
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_transaction_size
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_enable_transactions
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_current_transaction_num
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_current_transaction_error
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_model_reset
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_test_case_num
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_test_data
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_mismatch
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_check
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_n_rst
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_fir_out
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_modwait
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_err
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_coeff_num
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_coeff_clr
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_data_ready
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_sample_data
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_new_coeff_set
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_fir_coefficient
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_expected_data_ready
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_expected_sample
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_expected_new_coeff_set
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_expected_coeff
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23344193517 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 184
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
WaveRestoreZoom {0 ps} {28876422750 ps}
