onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_num
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_stage
add wave -noupdate -color Gold -radix unsigned /tb_adder_16bit/tb_test_case_err
add wave -noupdate -divider {DUT signals}
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_a
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_b
add wave -noupdate -radix unsigned /tb_adder_16bit/tb_carry_in
add wave -noupdate -expand -group sum -color {Dark Orchid} -radix unsigned -subitemconfig {{/tb_adder_16bit/tb_sum[15]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[14]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[13]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[12]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[11]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[10]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[9]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[8]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[7]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[6]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[5]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[4]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[3]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[2]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[1]} {-color {Dark Orchid}} {/tb_adder_16bit/tb_sum[0]} {-color {Dark Orchid}}} /tb_adder_16bit/tb_sum
add wave -noupdate -expand -group sum -color Cyan -radix unsigned /tb_adder_16bit/tb_expected_sum
add wave -noupdate -expand -group overflow -color {Dark Orchid} -radix unsigned /tb_adder_16bit/tb_overflow
add wave -noupdate -expand -group overflow -color Cyan -radix unsigned /tb_adder_16bit/tb_expected_overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10532 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 252
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
configure wave -timelineunits ps
update
WaveRestoreZoom {10050 ps} {11550 ps}
