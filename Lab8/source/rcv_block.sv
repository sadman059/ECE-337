// $Id: $
// File name:   rcv_block.sv
// Created:     2/12/2024
// Author:      mohammed rafi
// Lab Section: 337-06
// Version:     1.0  Initial Design Entry

module rcv_block(
input logic clk,
input logic n_rst,
input logic serial_in,
input logic data_read,
output logic [7:0] rx_data,
output logic data_ready,
output logic overrun_error,
output logic framing_error
);

logic shift_strobe;
logic new_packet_detected;
logic [7:0] packet_data;
logic stop_bit;
logic sbc_clear;
logic sbc_enable;
logic enable_timer;
logic packet_done;
logic load_buffer;

sr_9bit dut1(.clk(clk),.n_rst(n_rst),.serial_in(serial_in),.shift_strobe(shift_strobe),.packet_data(packet_data),.stop_bit(stop_bit));
start_bit_det dut2(.clk(clk),.n_rst(n_rst),.serial_in(serial_in),.new_packet_detected(new_packet_detected));
stop_bit_chk dut3(.clk(clk),.n_rst(n_rst),.sbc_clear(sbc_clear),.sbc_enable(sbc_enable),.stop_bit(stop_bit),.framing_error(framing_error));
timer dut4(.clk(clk),.n_rst(n_rst),.enable_timer(enable_timer),.shift_strobe(shift_strobe),.packet_done(packet_done));
rcu dut5(.clk(clk),.n_rst(n_rst),.new_packet_detected(new_packet_detected),.packet_done(packet_done),.framing_error(framing_error),.sbc_clear(sbc_clear),.sbc_enable(sbc_enable),.load_buffer(load_buffer),.enable_timer(enable_timer));
rx_data_buff dut6(.clk(clk),.n_rst(n_rst),.load_buffer(load_buffer),.packet_data(packet_data),.data_read(data_read),.rx_data(rx_data),.data_ready(data_ready),.overrun_error(overrun_error));

endmodule